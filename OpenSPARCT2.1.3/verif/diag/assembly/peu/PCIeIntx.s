/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeIntx.s
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
/* #define MAIN_PAGE_NUCLEUS_ALSO */ /* Access main in priviledge mode */
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

INTA_ASSERT_Evnt:
	! $EV trig_pc_d(1, @VA(.MAIN.INTA_ASSERT_Evnt)) -> EnablePCIeIgCmd ("INTA", 0, 0, "ASSERT", 1 )

	! now poll for INTA ASSERT
	
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_ADDR, %g1, %g2
	setx	0x008, %g1, %g3
	setx	0x020, %g1, %g4

delay_loop1:
	ldx	[%g2], %g5
	cmp     %g3,%g5
	be	INTA_DEASSERT_Evnt
	nop
	dec	%g4
	brnz	%g4, delay_loop1
	nop
	b       test_failed
	nop

INTA_DEASSERT_Evnt:
	! $EV trig_pc_d(1, @VA(.MAIN.INTA_DEASSERT_Evnt)) -> EnablePCIeIgCmd ("INTA", 0, 0, "DEASSERT", 1 )

	! now poll for INTA DEASSERT
	
	setx	0x000, %g1, %g3
	setx	0x020, %g1, %g4

delay_loop2:
	ldx	[%g2], %g5
	cmp     %g3,%g5
	be	INTB_ASSERT_Evnt
	nop
	dec	%g4
	brnz	%g4, delay_loop2
	nop
	b       test_failed
	nop

INTB_ASSERT_Evnt:
	! $EV trig_pc_d(1, @VA(.MAIN.INTB_ASSERT_Evnt)) -> EnablePCIeIgCmd ("INTB", 0, 0, "ASSERT", 1 )

	! now poll for INTB ASSERT
	
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_ADDR, %g1, %g2
	setx	0x004, %g1, %g3
	setx	0x020, %g1, %g4

delay_loop3:
	ldx	[%g2], %g5
	cmp     %g3,%g5
	be	INTB_DEASSERT_Evnt
	nop
	dec	%g4
	brnz	%g4, delay_loop3
	nop
	b       test_failed
	nop

INTB_DEASSERT_Evnt:
	! $EV trig_pc_d(1, @VA(.MAIN.INTB_DEASSERT_Evnt)) -> EnablePCIeIgCmd ("INTB", 0, 0, "DEASSERT", 1 )

	! now poll for INTB DEASSERT
	
	setx	0x000, %g1, %g3
	setx	0x020, %g1, %g4

delay_loop4:
	ldx	[%g2], %g5
	cmp     %g3,%g5
	be	INTC_ASSERT_Evnt
	nop
	dec	%g4
	brnz	%g4, delay_loop4
	nop
	b       test_failed
	nop
	
INTC_ASSERT_Evnt:
	! $EV trig_pc_d(1, @VA(.MAIN.INTC_ASSERT_Evnt)) -> EnablePCIeIgCmd ("INTC", 0, 0, "ASSERT", 1 )

	! now poll for INTC ASSERT
	
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_ADDR, %g1, %g2
	setx	0x002, %g1, %g3
	setx	0x020, %g1, %g4

delay_loop5:
	ldx	[%g2], %g5
	cmp     %g3,%g5
	be	INTC_DEASSERT_Evnt
	nop
	dec	%g4
	brnz	%g4, delay_loop5
	nop
	b       test_failed
	nop

INTC_DEASSERT_Evnt:
	! $EV trig_pc_d(1, @VA(.MAIN.INTC_DEASSERT_Evnt)) -> EnablePCIeIgCmd ("INTC", 0, 0, "DEASSERT", 1 )

	! now poll for INTC DEASSERT
	
	setx	0x000, %g1, %g3
	setx	0x020, %g1, %g4

delay_loop6:
	ldx	[%g2], %g5
	cmp     %g3,%g5
	be	INTD_ASSERT_Evnt
	nop
	dec	%g4
	brnz	%g4, delay_loop6
	nop
	b       test_failed
	nop

INTD_ASSERT_Evnt:
	! $EV trig_pc_d(1, @VA(.MAIN.INTD_ASSERT_Evnt)) -> EnablePCIeIgCmd ("INTD", 0, 0, "ASSERT", 1 )

	! now poll for INTD ASSERT
	
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_ADDR, %g1, %g2
	setx	0x001, %g1, %g3
	setx	0x020, %g1, %g4

delay_loop7:
	ldx	[%g2], %g5
	cmp     %g3,%g5
	be	INTD_DEASSERT_Evnt
	nop
	dec	%g4
	brnz	%g4, delay_loop7
	nop
	b       test_failed
	nop

INTD_DEASSERT_Evnt:
	! $EV trig_pc_d(1, @VA(.MAIN.INTD_DEASSERT_Evnt)) -> EnablePCIeIgCmd ("INTD", 0, 0, "DEASSERT", 1 )

	! now poll for INTD DEASSERT
	
	setx	0x000, %g1, %g3
	setx	0x020, %g1, %g4

delay_loop8:
	ldx	[%g2], %g5
	cmp     %g3,%g5
	be	test_passed
	nop
	dec	%g4
	brnz	%g4, delay_loop8
	nop
	b       test_failed
	nop

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


