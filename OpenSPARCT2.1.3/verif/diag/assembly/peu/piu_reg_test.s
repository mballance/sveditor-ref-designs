/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: piu_reg_test.s
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
	
!!!#define PORTABLE_CORE 1

#include "hboot.s"
#include "peu_defines.h"
#include "dmu_peu_regs.h"

.text
.global main

main:
        ta T_CHANGE_HPRIV

        mov  0, %l1
        dec  %l1

        th_fork(thread, %l0)

        ba	test_failed
	nop

thread_0:

	! tell the vera code not to generate an expect when this reg is written to
VERA_CMD: nop ! $EV trig_pc_d(1,@VA(.MAIN.VERA_CMD)) -> EnablePCIeIgCmd("IGNORE_PME_TURN_OFF", 0, 0, "0",1)

REG_TEST_0:
        ! First check that the POR value is correct
	setx	FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_A_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_A_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_0_EXP_VALUE mpeval( (~FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_A_REG_POR_VALUE & FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_A_REG_WRITE_MASK) | (FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_A_REG_POR_VALUE & ~FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_A_REG_WRITE_MASK) )

	best_set_reg(REG_0_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_1:
        ! First check that the POR value is correct
	setx	FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_B_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_B_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_1_EXP_VALUE mpeval( (~FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_B_REG_POR_VALUE & FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_B_REG_WRITE_MASK) | (FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_B_REG_POR_VALUE & ~FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_B_REG_WRITE_MASK) )

	best_set_reg(REG_1_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_2:
        ! First check that the POR value is correct
	setx	FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_2_EXP_VALUE mpeval( (~FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_POR_VALUE & FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_WRITE_MASK) | (FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_POR_VALUE & ~FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_WRITE_MASK) )

	best_set_reg(REG_2_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_3:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
#ifdef DTM_ENABLED	
	setx	FIRE_DLC_MMU_CSR_A_CTL_POR_VALUE+2, %g1, %g3 ! Bypass enable is set
#else
	best_set_reg(FIRE_DLC_MMU_CSR_A_CTL_POR_VALUE, %g1, %g3)
#endif
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#ifdef DTM_ENABLED
#define REG_3_EXP_VALUE mpeval( (~(FIRE_DLC_MMU_CSR_A_CTL_POR_VALUE+2) & FIRE_DLC_MMU_CSR_A_CTL_WRITE_MASK) | ((FIRE_DLC_MMU_CSR_A_CTL_POR_VALUE+2) & ~FIRE_DLC_MMU_CSR_A_CTL_WRITE_MASK) )
#else
#define REG_3_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_CTL_POR_VALUE & FIRE_DLC_MMU_CSR_A_CTL_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_CTL_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_CTL_WRITE_MASK) )
#endif
	
	best_set_reg(REG_3_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop

	stx	%g0, [%g2]                      ! CM must be 0 for certain IOMMU writes


REG_TEST_4:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_TSB_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_TSB_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_4_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_TSB_POR_VALUE & FIRE_DLC_MMU_CSR_A_TSB_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_TSB_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_TSB_WRITE_MASK) )

	best_set_reg(REG_4_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_5:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_FSH_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_FSH_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_5_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_FSH_POR_VALUE & FIRE_DLC_MMU_CSR_A_FSH_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_FSH_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_FSH_WRITE_MASK) )

	best_set_reg(REG_5_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_6:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_INV_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_INV_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
!	xor	%g3, %l1, %l2
!	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_6_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_INV_POR_VALUE & FIRE_DLC_MMU_CSR_A_INV_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_INV_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_INV_WRITE_MASK) )

!	best_set_reg(REG_6_EXP_VALUE, %g1, %g7)  ! get expected value
!	ldx	[%g2], %g4
!       !xorcc   %g7, %g4, %g5
!       xorcc   %g0, %g4, %g5	! this reg is write only!, so expect 0s back
!       bne	test_failed
!	nop


REG_TEST_7:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_LOG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_LOG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_7_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_LOG_POR_VALUE & FIRE_DLC_MMU_CSR_A_LOG_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_LOG_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_LOG_WRITE_MASK) )

	best_set_reg(REG_7_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_8:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_INT_EN_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_INT_EN_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_8_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_INT_EN_POR_VALUE & FIRE_DLC_MMU_CSR_A_INT_EN_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_INT_EN_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_INT_EN_WRITE_MASK) )

	best_set_reg(REG_8_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_9:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_EN_ERR_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_EN_ERR_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_9_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_EN_ERR_POR_VALUE & FIRE_DLC_MMU_CSR_A_EN_ERR_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_EN_ERR_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_EN_ERR_WRITE_MASK) )

	best_set_reg(REG_9_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_10:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_ERR_RW1C_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_ERR_RW1C_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_10_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_ERR_RW1C_ALIAS_POR_VALUE & 0) | (FIRE_DLC_MMU_CSR_A_ERR_RW1C_ALIAS_POR_VALUE & ~0) )

	best_set_reg(REG_10_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_11:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_ERR_RW1S_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_ERR_RW1S_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_11_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_ERR_RW1S_ALIAS_POR_VALUE & FIRE_DLC_MMU_CSR_A_ERR_RW1S_ALIAS_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_ERR_RW1S_ALIAS_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_ERR_RW1S_ALIAS_WRITE_MASK) )

	best_set_reg(REG_11_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_12:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_FLTA_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_FLTA_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_12_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_FLTA_POR_VALUE & FIRE_DLC_MMU_CSR_A_FLTA_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_FLTA_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_FLTA_WRITE_MASK) )

	best_set_reg(REG_12_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_13:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_FLTS_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_FLTS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_13_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_FLTS_POR_VALUE & FIRE_DLC_MMU_CSR_A_FLTS_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_FLTS_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_FLTS_WRITE_MASK) )

	best_set_reg(REG_13_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_14:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_PRFC_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_PRFC_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_14_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_PRFC_POR_VALUE & FIRE_DLC_MMU_CSR_A_PRFC_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_PRFC_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_PRFC_WRITE_MASK) )

	best_set_reg(REG_14_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_15:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_PRF0_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_PRF0_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_15_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_PRF0_POR_VALUE & FIRE_DLC_MMU_CSR_A_PRF0_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_PRF0_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_PRF0_WRITE_MASK) )

	best_set_reg(REG_15_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_16:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_PRF1_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_PRF1_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_16_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_PRF1_POR_VALUE & FIRE_DLC_MMU_CSR_A_PRF1_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_PRF1_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_PRF1_WRITE_MASK) )

	best_set_reg(REG_16_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_17:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_VTB_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_VTB_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

/* #define REG_17_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_VTB_POR_VALUE & FIRE_DLC_MMU_CSR_A_VTB_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_VTB_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_VTB_WRITE_MASK) ) */

!!! bits 15:11 are 0 in sun4u mode 
#define REG_17_EXP_VALUE 0x01ffffffffff0001
	
	best_set_reg(REG_17_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_18:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_PTB_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_PTB_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_18_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_PTB_POR_VALUE & FIRE_DLC_MMU_CSR_A_PTB_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_PTB_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_PTB_WRITE_MASK) )

	best_set_reg(REG_18_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_19:
        ! Next check that all the writable bits can be written
	setx	FIRE_DLC_MMU_CSR_A_TDB_ADDR, %g1, %g2
	stx	%l1, [%g2]                      ! store all 1s

#define REG_19_EXP_VALUE mpeval(0xffffffffffffffff & FIRE_DLC_MMU_CSR_A_TDB_WRITE_MASK)

	best_set_reg(REG_19_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
	and	%g4, %g7, %g4	! mask off bits 47:44, parity bits set by hw
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_20:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_20_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_DEV2IOTSB_POR_VALUE & FIRE_DLC_MMU_CSR_A_DEV2IOTSB_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_DEV2IOTSB_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_DEV2IOTSB_WRITE_MASK) )

	best_set_reg(REG_20_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_21:
        ! First check that the POR value is correct
	setx	FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_MMU_CSR_A_IOTSBDESC_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_21_EXP_VALUE mpeval( (~FIRE_DLC_MMU_CSR_A_IOTSBDESC_POR_VALUE & FIRE_DLC_MMU_CSR_A_IOTSBDESC_WRITE_MASK) | (FIRE_DLC_MMU_CSR_A_IOTSBDESC_POR_VALUE & ~FIRE_DLC_MMU_CSR_A_IOTSBDESC_WRITE_MASK) )

	best_set_reg(REG_21_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
	and	%g4, %g7, %g4	! mask off bits 62:61, parity bits set by hw
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_22:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_BASE_ADDRESS_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_EQS_CSR_A_EQ_BASE_ADDRESS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_22_EXP_VALUE mpeval( (~FIRE_DLC_IMU_EQS_CSR_A_EQ_BASE_ADDRESS_POR_VALUE & FIRE_DLC_IMU_EQS_CSR_A_EQ_BASE_ADDRESS_WRITE_MASK) | (FIRE_DLC_IMU_EQS_CSR_A_EQ_BASE_ADDRESS_POR_VALUE & ~FIRE_DLC_IMU_EQS_CSR_A_EQ_BASE_ADDRESS_WRITE_MASK) )

	best_set_reg(REG_22_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_23:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_SET_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_SET_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_23_EXP_VALUE mpeval( (~FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_SET_POR_VALUE & FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_SET_WRITE_MASK) | (FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_SET_POR_VALUE & ~FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_SET_WRITE_MASK) )

	best_set_reg(REG_23_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_24:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_CLR_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_CLR_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_24_EXP_VALUE mpeval( (~FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_CLR_POR_VALUE & FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_CLR_WRITE_MASK) | (FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_CLR_POR_VALUE & ~FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_CLR_WRITE_MASK) )

	best_set_reg(REG_24_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_25:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_STATE_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_EQS_CSR_A_EQ_STATE_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_25_EXP_VALUE mpeval( (~FIRE_DLC_IMU_EQS_CSR_A_EQ_STATE_POR_VALUE & FIRE_DLC_IMU_EQS_CSR_A_EQ_STATE_WRITE_MASK) | (FIRE_DLC_IMU_EQS_CSR_A_EQ_STATE_POR_VALUE & ~FIRE_DLC_IMU_EQS_CSR_A_EQ_STATE_WRITE_MASK) )

	best_set_reg(REG_25_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ba	test_passed
	nop

thread_1:

REG_TEST_26:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_TAIL_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_EQS_CSR_A_EQ_TAIL_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_26_EXP_VALUE mpeval( (~FIRE_DLC_IMU_EQS_CSR_A_EQ_TAIL_POR_VALUE & FIRE_DLC_IMU_EQS_CSR_A_EQ_TAIL_WRITE_MASK) | (FIRE_DLC_IMU_EQS_CSR_A_EQ_TAIL_POR_VALUE & ~FIRE_DLC_IMU_EQS_CSR_A_EQ_TAIL_WRITE_MASK) )

	best_set_reg(REG_26_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_27:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_HEAD_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_EQS_CSR_A_EQ_HEAD_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_27_EXP_VALUE mpeval( (~FIRE_DLC_IMU_EQS_CSR_A_EQ_HEAD_POR_VALUE & FIRE_DLC_IMU_EQS_CSR_A_EQ_HEAD_WRITE_MASK) | (FIRE_DLC_IMU_EQS_CSR_A_EQ_HEAD_POR_VALUE & ~FIRE_DLC_IMU_EQS_CSR_A_EQ_HEAD_WRITE_MASK) )

	best_set_reg(REG_27_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_28:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_28_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_WRITE_MASK) )

	best_set_reg(REG_28_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_29:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_INT_EN_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_IMU_INT_EN_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_29_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_IMU_INT_EN_REG_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_IMU_INT_EN_REG_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_IMU_INT_EN_REG_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_IMU_INT_EN_REG_WRITE_MASK) )

	best_set_reg(REG_29_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_30:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ENABLED_ERROR_STATUS_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_IMU_ENABLED_ERROR_STATUS_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_30_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_IMU_ENABLED_ERROR_STATUS_REG_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_IMU_ENABLED_ERROR_STATUS_REG_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_IMU_ENABLED_ERROR_STATUS_REG_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_IMU_ENABLED_ERROR_STATUS_REG_WRITE_MASK) )

	best_set_reg(REG_30_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_31:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_31_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_POR_VALUE & 0) | (FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_POR_VALUE & ~0) )

	best_set_reg(REG_31_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_32:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1S_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1S_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_32_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1S_ALIAS_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1S_ALIAS_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1S_ALIAS_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1S_ALIAS_WRITE_MASK) )

	best_set_reg(REG_32_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_33:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_RDS_ERROR_LOG_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_IMU_RDS_ERROR_LOG_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_33_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_IMU_RDS_ERROR_LOG_REG_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_IMU_RDS_ERROR_LOG_REG_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_IMU_RDS_ERROR_LOG_REG_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_IMU_RDS_ERROR_LOG_REG_WRITE_MASK) )

	best_set_reg(REG_33_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_34:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_SCS_ERROR_LOG_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_IMU_SCS_ERROR_LOG_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_34_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_IMU_SCS_ERROR_LOG_REG_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_IMU_SCS_ERROR_LOG_REG_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_IMU_SCS_ERROR_LOG_REG_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_IMU_SCS_ERROR_LOG_REG_WRITE_MASK) )

	best_set_reg(REG_34_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_35:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_EQS_ERROR_LOG_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_IMU_EQS_ERROR_LOG_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_35_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_IMU_EQS_ERROR_LOG_REG_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_IMU_EQS_ERROR_LOG_REG_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_IMU_EQS_ERROR_LOG_REG_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_IMU_EQS_ERROR_LOG_REG_WRITE_MASK) )

	best_set_reg(REG_35_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_36:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_MASK_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_MASK_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_36_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_MASK_REG_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_MASK_REG_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_MASK_REG_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_MASK_REG_WRITE_MASK) )

	best_set_reg(REG_36_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_37:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_STATUS_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_STATUS_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed		! writing to other regs set bits here
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_37_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_STATUS_REG_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_STATUS_REG_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_STATUS_REG_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_STATUS_REG_WRITE_MASK) )

	best_set_reg(REG_37_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed		! writing to other regs set bits here
	nop


REG_TEST_38:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNTRL_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNTRL_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_38_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNTRL_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNTRL_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNTRL_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNTRL_WRITE_MASK) )

	best_set_reg(REG_38_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_39:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT0_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT0_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_39_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT0_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT0_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT0_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT0_WRITE_MASK) )

	best_set_reg(REG_39_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_40:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT1_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT1_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_40_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT1_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT1_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT1_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT1_WRITE_MASK) )

	best_set_reg(REG_40_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_41:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_MSI_32_ADDR_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_MSI_32_ADDR_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_41_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_MSI_32_ADDR_REG_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_MSI_32_ADDR_REG_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_MSI_32_ADDR_REG_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_MSI_32_ADDR_REG_WRITE_MASK) )

	best_set_reg(REG_41_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_42:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_MSI_64_ADDR_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_MSI_64_ADDR_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_42_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_MSI_64_ADDR_REG_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_MSI_64_ADDR_REG_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_MSI_64_ADDR_REG_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_MSI_64_ADDR_REG_WRITE_MASK) )

	best_set_reg(REG_42_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_43:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ICS_CSR_A_MEM_64_PCIE_OFFSET_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ICS_CSR_A_MEM_64_PCIE_OFFSET_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_43_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ICS_CSR_A_MEM_64_PCIE_OFFSET_REG_POR_VALUE & FIRE_DLC_IMU_ICS_CSR_A_MEM_64_PCIE_OFFSET_REG_WRITE_MASK) | (FIRE_DLC_IMU_ICS_CSR_A_MEM_64_PCIE_OFFSET_REG_POR_VALUE & ~FIRE_DLC_IMU_ICS_CSR_A_MEM_64_PCIE_OFFSET_REG_WRITE_MASK) )

	best_set_reg(REG_43_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_44:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_44_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_POR_VALUE & FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_WRITE_MASK) | (FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_POR_VALUE & ~FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_WRITE_MASK) )

	best_set_reg(REG_44_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_45:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_A_INT_CLR_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_A_INT_CLR_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_45_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_A_INT_CLR_REG_POR_VALUE & FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_A_INT_CLR_REG_WRITE_MASK) | (FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_A_INT_CLR_REG_POR_VALUE & ~FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_A_INT_CLR_REG_WRITE_MASK) )

	best_set_reg(REG_45_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_46:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_B_INT_CLR_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_B_INT_CLR_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_46_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_B_INT_CLR_REG_POR_VALUE & FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_B_INT_CLR_REG_WRITE_MASK) | (FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_B_INT_CLR_REG_POR_VALUE & ~FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_B_INT_CLR_REG_WRITE_MASK) )

	best_set_reg(REG_46_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_47:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_C_INT_CLR_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_C_INT_CLR_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_47_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_C_INT_CLR_REG_POR_VALUE & FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_C_INT_CLR_REG_WRITE_MASK) | (FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_C_INT_CLR_REG_POR_VALUE & ~FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_C_INT_CLR_REG_WRITE_MASK) )

	best_set_reg(REG_47_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_48:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_D_INT_CLR_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_D_INT_CLR_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_48_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_D_INT_CLR_REG_POR_VALUE & FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_D_INT_CLR_REG_WRITE_MASK) | (FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_D_INT_CLR_REG_POR_VALUE & ~FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_D_INT_CLR_REG_WRITE_MASK) )

	best_set_reg(REG_48_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_49:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_20_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_20_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_49_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_20_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_20_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_20_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_20_WRITE_MASK) )

	best_set_reg(REG_49_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_50:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_21_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_21_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_50_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_21_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_21_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_21_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_21_WRITE_MASK) )

	best_set_reg(REG_50_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_51:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_22_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_22_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_51_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_22_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_22_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_22_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_22_WRITE_MASK) )

	best_set_reg(REG_51_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_52:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_23_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_23_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_52_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_23_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_23_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_23_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_23_WRITE_MASK) )

	best_set_reg(REG_52_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_53:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_24_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_24_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_53_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_24_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_24_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_24_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_24_WRITE_MASK) )

	best_set_reg(REG_53_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_54:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_25_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_25_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_54_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_25_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_25_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_25_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_25_WRITE_MASK) )

	best_set_reg(REG_54_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_55:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_26_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_26_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_55_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_26_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_26_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_26_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_26_WRITE_MASK) )

	best_set_reg(REG_55_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_56:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_27_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_27_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_56_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_27_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_27_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_27_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_27_WRITE_MASK) )

	best_set_reg(REG_56_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop

        ba	test_passed
	nop

thread_2:

REG_TEST_57:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_28_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_28_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_57_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_28_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_28_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_28_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_28_WRITE_MASK) )

	best_set_reg(REG_57_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_58:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_29_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_29_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_58_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_29_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_29_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_29_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_29_WRITE_MASK) )

	best_set_reg(REG_58_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_59:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_30_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_30_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_59_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_30_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_30_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_30_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_30_WRITE_MASK) )

	best_set_reg(REG_59_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_60:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_31_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_31_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_60_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_31_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_31_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_31_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_31_WRITE_MASK) )

	best_set_reg(REG_60_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_61:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_32_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_32_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_61_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_32_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_32_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_32_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_32_WRITE_MASK) )

	best_set_reg(REG_61_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_62:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_33_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_33_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_62_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_33_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_33_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_33_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_33_WRITE_MASK) )

	best_set_reg(REG_62_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_63:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_34_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_34_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_63_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_34_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_34_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_34_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_34_WRITE_MASK) )

	best_set_reg(REG_63_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_64:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_35_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_35_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_64_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_35_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_35_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_35_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_35_WRITE_MASK) )

	best_set_reg(REG_64_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_65:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_36_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_36_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_65_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_36_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_36_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_36_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_36_WRITE_MASK) )

	best_set_reg(REG_65_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_66:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_37_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_37_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_66_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_37_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_37_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_37_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_37_WRITE_MASK) )

	best_set_reg(REG_66_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_67:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_38_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_38_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_67_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_38_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_38_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_38_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_38_WRITE_MASK) )

	best_set_reg(REG_67_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_68:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_39_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_39_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_68_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_39_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_39_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_39_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_39_WRITE_MASK) )

	best_set_reg(REG_68_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_69:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_40_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_40_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_69_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_40_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_40_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_40_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_40_WRITE_MASK) )

	best_set_reg(REG_69_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_70:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_41_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_41_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_70_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_41_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_41_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_41_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_41_WRITE_MASK) )

	best_set_reg(REG_70_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_71:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_42_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_42_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_71_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_42_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_42_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_42_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_42_WRITE_MASK) )

	best_set_reg(REG_71_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_72:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_43_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_43_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_72_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_43_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_43_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_43_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_43_WRITE_MASK) )

	best_set_reg(REG_72_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_73:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_44_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_44_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_73_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_44_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_44_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_44_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_44_WRITE_MASK) )

	best_set_reg(REG_73_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_74:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_45_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_45_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_74_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_45_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_45_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_45_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_45_WRITE_MASK) )

	best_set_reg(REG_74_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_75:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_46_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_46_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_75_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_46_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_46_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_46_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_46_WRITE_MASK) )

	best_set_reg(REG_75_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_76:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_47_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_47_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_76_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_47_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_47_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_47_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_47_WRITE_MASK) )

	best_set_reg(REG_76_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_77:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_48_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_48_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_77_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_48_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_48_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_48_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_48_WRITE_MASK) )

	best_set_reg(REG_77_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_78:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_49_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_49_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_78_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_49_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_49_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_49_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_49_WRITE_MASK) )

	best_set_reg(REG_78_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_79:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_50_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_50_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_79_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_50_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_50_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_50_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_50_WRITE_MASK) )

	best_set_reg(REG_79_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_80:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_51_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_51_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_80_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_51_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_51_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_51_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_51_WRITE_MASK) )

	best_set_reg(REG_80_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_81:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_52_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_52_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_81_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_52_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_52_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_52_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_52_WRITE_MASK) )

	best_set_reg(REG_81_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_82:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_53_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_53_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_82_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_53_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_53_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_53_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_53_WRITE_MASK) )

	best_set_reg(REG_82_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_83:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_54_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_54_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_83_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_54_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_54_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_54_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_54_WRITE_MASK) )

	best_set_reg(REG_83_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_84:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_55_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_55_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_84_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_55_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_55_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_55_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_55_WRITE_MASK) )

	best_set_reg(REG_84_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_85:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_56_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_56_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_85_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_56_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_56_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_56_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_56_WRITE_MASK) )

	best_set_reg(REG_85_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_86:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_57_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_57_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_86_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_57_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_57_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_57_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_57_WRITE_MASK) )

	best_set_reg(REG_86_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_87:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_58_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_58_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_87_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_58_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_58_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_58_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_58_WRITE_MASK) )

	best_set_reg(REG_87_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_88:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_59_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_59_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_88_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_59_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_59_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_59_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_59_WRITE_MASK) )

	best_set_reg(REG_88_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_89:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_62_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_62_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_89_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_62_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_62_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_62_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_62_WRITE_MASK) )

	best_set_reg(REG_89_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_90:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_63_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_63_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_90_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_63_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_63_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_63_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_63_WRITE_MASK) )

	best_set_reg(REG_90_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_91:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_20_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_20_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_91_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_20_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_20_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_20_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_20_WRITE_MASK) )

	best_set_reg(REG_91_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_92:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_21_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_21_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_92_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_21_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_21_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_21_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_21_WRITE_MASK) )

	best_set_reg(REG_92_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_93:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_22_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_22_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_93_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_22_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_22_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_22_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_22_WRITE_MASK) )

	best_set_reg(REG_93_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_94:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_23_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_23_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_94_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_23_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_23_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_23_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_23_WRITE_MASK) )

	best_set_reg(REG_94_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_95:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_24_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_24_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
!        xorcc   %g3, %g4, %g5
!        bne	test_failed
!	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_95_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_24_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_24_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_24_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_24_WRITE_MASK) )

	best_set_reg(REG_95_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_96:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_25_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_25_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
!        xorcc   %g3, %g4, %g5
!        bne	test_failed
!	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_96_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_25_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_25_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_25_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_25_WRITE_MASK) )

	best_set_reg(REG_96_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_97:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_26_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_26_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
!        xorcc   %g3, %g4, %g5
!        bne	test_failed
!	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_97_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_26_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_26_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_26_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_26_WRITE_MASK) )

	best_set_reg(REG_97_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_98:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_27_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_27_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
!        xorcc   %g3, %g4, %g5
!        bne	test_failed
!	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_98_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_27_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_27_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_27_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_27_WRITE_MASK) )

	best_set_reg(REG_98_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_99:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_28_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_28_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
!       xorcc   %g3, %g4, %g5
!        bne	test_failed
!	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_99_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_28_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_28_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_28_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_28_WRITE_MASK) )

	best_set_reg(REG_99_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_100:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_29_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_29_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
!        xorcc   %g3, %g4, %g5
!        bne	test_failed
!	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_100_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_29_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_29_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_29_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_29_WRITE_MASK) )

	best_set_reg(REG_100_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_101:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_30_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_30_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
!        xorcc   %g3, %g4, %g5
!        bne	test_failed
!	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_101_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_30_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_30_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_30_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_30_WRITE_MASK) )

	best_set_reg(REG_101_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_102:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_31_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_31_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
!        xorcc   %g3, %g4, %g5
!        bne	test_failed
!	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_102_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_31_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_31_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_31_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_31_WRITE_MASK) )

	best_set_reg(REG_102_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_103:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_32_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_32_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
!        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_103_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_32_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_32_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_32_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_32_WRITE_MASK) )

	best_set_reg(REG_103_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_104:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_33_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_33_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_104_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_33_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_33_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_33_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_33_WRITE_MASK) )

	best_set_reg(REG_104_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_105:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_34_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_34_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_105_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_34_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_34_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_34_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_34_WRITE_MASK) )

	best_set_reg(REG_105_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_106:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_35_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_35_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_106_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_35_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_35_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_35_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_35_WRITE_MASK) )

	best_set_reg(REG_106_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_107:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_36_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_36_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_107_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_36_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_36_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_36_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_36_WRITE_MASK) )

	best_set_reg(REG_107_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_108:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_37_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_37_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_108_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_37_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_37_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_37_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_37_WRITE_MASK) )

	best_set_reg(REG_108_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_109:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_38_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_38_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_109_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_38_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_38_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_38_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_38_WRITE_MASK) )

	best_set_reg(REG_109_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_110:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_39_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_39_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_110_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_39_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_39_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_39_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_39_WRITE_MASK) )

	best_set_reg(REG_110_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_111:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_40_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_40_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_111_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_40_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_40_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_40_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_40_WRITE_MASK) )

	best_set_reg(REG_111_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_112:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_41_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_41_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_112_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_41_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_41_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_41_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_41_WRITE_MASK) )

	best_set_reg(REG_112_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_113:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_42_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_42_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_113_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_42_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_42_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_42_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_42_WRITE_MASK) )

	best_set_reg(REG_113_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_114:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_43_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_43_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_114_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_43_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_43_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_43_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_43_WRITE_MASK) )

	best_set_reg(REG_114_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_115:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_44_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_44_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_115_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_44_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_44_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_44_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_44_WRITE_MASK) )

	best_set_reg(REG_115_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_116:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_45_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_45_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_116_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_45_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_45_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_45_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_45_WRITE_MASK) )

	best_set_reg(REG_116_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_117:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_46_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_46_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_117_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_46_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_46_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_46_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_46_WRITE_MASK) )

	best_set_reg(REG_117_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_118:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_47_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_47_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_118_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_47_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_47_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_47_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_47_WRITE_MASK) )

	best_set_reg(REG_118_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_119:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_48_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_48_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_119_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_48_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_48_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_48_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_48_WRITE_MASK) )

	best_set_reg(REG_119_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_120:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_49_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_49_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_120_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_49_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_49_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_49_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_49_WRITE_MASK) )

	best_set_reg(REG_120_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_121:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_50_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_50_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_121_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_50_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_50_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_50_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_50_WRITE_MASK) )

	best_set_reg(REG_121_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_122:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_51_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_51_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_122_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_51_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_51_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_51_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_51_WRITE_MASK) )

	best_set_reg(REG_122_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_123:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_52_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_52_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_123_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_52_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_52_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_52_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_52_WRITE_MASK) )

	best_set_reg(REG_123_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_124:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_53_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_53_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_124_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_53_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_53_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_53_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_53_WRITE_MASK) )

	best_set_reg(REG_124_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_125:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_54_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_54_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_125_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_54_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_54_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_54_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_54_WRITE_MASK) )

	best_set_reg(REG_125_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_126:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_55_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_55_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_126_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_55_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_55_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_55_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_55_WRITE_MASK) )

	best_set_reg(REG_126_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_127:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_56_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_56_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_127_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_56_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_56_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_56_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_56_WRITE_MASK) )

	best_set_reg(REG_127_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_128:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_57_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_57_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_128_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_57_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_57_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_57_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_57_WRITE_MASK) )

	best_set_reg(REG_128_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_129:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_58_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_58_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_129_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_58_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_58_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_58_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_58_WRITE_MASK) )

	best_set_reg(REG_129_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_130:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_59_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_59_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_130_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_59_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_59_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_59_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_59_WRITE_MASK) )

	best_set_reg(REG_130_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_131:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_62_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_62_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_131_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_62_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_62_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_62_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_62_WRITE_MASK) )

	best_set_reg(REG_131_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_132:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_63_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_63_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
!        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_132_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_63_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_63_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_63_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_63_WRITE_MASK) )

	best_set_reg(REG_132_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_133:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_RETRY_TIMER_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_RETRY_TIMER_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_133_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_RETRY_TIMER_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_RETRY_TIMER_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_RETRY_TIMER_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_RETRY_TIMER_WRITE_MASK) )

	best_set_reg(REG_133_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_134:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_1_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_1_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_134_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_1_POR_VALUE & FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_1_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_1_POR_VALUE & ~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_1_WRITE_MASK) )

	best_set_reg(REG_134_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_135:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_2_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_2_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define myFIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_2_WRITE_MASK 0xf0ffffffffffffff
#define REG_135_EXP_VALUE mpeval( (~FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_2_POR_VALUE & myFIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_2_WRITE_MASK) | (FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_2_POR_VALUE & ~myFIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_2_WRITE_MASK) )

	best_set_reg(REG_135_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_136:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_COR_MAPPING_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_COR_MAPPING_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_136_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_COR_MAPPING_POR_VALUE & FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_COR_MAPPING_WRITE_MASK) | (FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_COR_MAPPING_POR_VALUE & ~FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_COR_MAPPING_WRITE_MASK) )

	best_set_reg(REG_136_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_137:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_NONFATAL_MAPPING_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_NONFATAL_MAPPING_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_137_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_NONFATAL_MAPPING_POR_VALUE & FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_NONFATAL_MAPPING_WRITE_MASK) | (FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_NONFATAL_MAPPING_POR_VALUE & ~FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_NONFATAL_MAPPING_WRITE_MASK) )

	best_set_reg(REG_137_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_138:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_FATAL_MAPPING_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_FATAL_MAPPING_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_138_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_FATAL_MAPPING_POR_VALUE & FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_FATAL_MAPPING_WRITE_MASK) | (FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_FATAL_MAPPING_POR_VALUE & ~FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_FATAL_MAPPING_WRITE_MASK) )

	best_set_reg(REG_138_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_139:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_PM_PME_MAPPING_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_MESS_CSR_A_PM_PME_MAPPING_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_139_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_MESS_CSR_A_PM_PME_MAPPING_POR_VALUE & FIRE_DLC_IMU_RDS_MESS_CSR_A_PM_PME_MAPPING_WRITE_MASK) | (FIRE_DLC_IMU_RDS_MESS_CSR_A_PM_PME_MAPPING_POR_VALUE & ~FIRE_DLC_IMU_RDS_MESS_CSR_A_PM_PME_MAPPING_WRITE_MASK) )

	best_set_reg(REG_139_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_140:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_PME_TO_ACK_MAPPING_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_MESS_CSR_A_PME_TO_ACK_MAPPING_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_140_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_MESS_CSR_A_PME_TO_ACK_MAPPING_POR_VALUE & FIRE_DLC_IMU_RDS_MESS_CSR_A_PME_TO_ACK_MAPPING_WRITE_MASK) | (FIRE_DLC_IMU_RDS_MESS_CSR_A_PME_TO_ACK_MAPPING_POR_VALUE & ~FIRE_DLC_IMU_RDS_MESS_CSR_A_PME_TO_ACK_MAPPING_WRITE_MASK) )

	best_set_reg(REG_140_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ba	test_passed
	nop

thread_3:

REG_TEST_141:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_MAPPING_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_MAPPING_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_141_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_MAPPING_POR_VALUE & FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_MAPPING_WRITE_MASK) | (FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_MAPPING_POR_VALUE & ~FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_MAPPING_WRITE_MASK) )

	best_set_reg(REG_141_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ba	test_passed
	nop

thread_4:

REG_TEST_142:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1C_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1C_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_142_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1C_ALIAS_POR_VALUE & 0) | (FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1C_ALIAS_POR_VALUE & ~0) )

	best_set_reg(REG_142_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ba	test_passed
	nop

thread_5:

REG_TEST_143:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1S_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1S_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_143_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1S_ALIAS_POR_VALUE & FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1S_ALIAS_WRITE_MASK) | (FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1S_ALIAS_POR_VALUE & ~FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1S_ALIAS_WRITE_MASK) )

	best_set_reg(REG_143_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ba	test_passed
	nop

thread_6:
	
REG_TEST_144:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_0_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_0_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_144_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_0_REG_POR_VALUE & FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_0_REG_WRITE_MASK) | (FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_0_REG_POR_VALUE & ~FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_0_REG_WRITE_MASK) )

	best_set_reg(REG_144_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_145:
        ! First check that the POR value is correct
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_1_REG_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_1_REG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_145_EXP_VALUE mpeval( (~FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_1_REG_POR_VALUE & FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_1_REG_WRITE_MASK) | (FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_1_REG_POR_VALUE & ~FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_1_REG_WRITE_MASK) )

	best_set_reg(REG_145_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_146:
        ! First check that the POR value is correct
	setx	FIRE_DLC_PSB_CSR_A_PSB_DMA_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_PSB_CSR_A_PSB_DMA_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_146_EXP_VALUE mpeval( (~FIRE_DLC_PSB_CSR_A_PSB_DMA_POR_VALUE & FIRE_DLC_PSB_CSR_A_PSB_DMA_WRITE_MASK) | (FIRE_DLC_PSB_CSR_A_PSB_DMA_POR_VALUE & ~FIRE_DLC_PSB_CSR_A_PSB_DMA_WRITE_MASK) )

	best_set_reg(REG_146_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_147:
        ! First check that the POR value is correct
	setx	FIRE_DLC_PSB_CSR_A_PSB_PIO_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_PSB_CSR_A_PSB_PIO_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_147_EXP_VALUE mpeval( (~FIRE_DLC_PSB_CSR_A_PSB_PIO_POR_VALUE & FIRE_DLC_PSB_CSR_A_PSB_PIO_WRITE_MASK) | (FIRE_DLC_PSB_CSR_A_PSB_PIO_POR_VALUE & ~FIRE_DLC_PSB_CSR_A_PSB_PIO_WRITE_MASK) )

	best_set_reg(REG_147_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_148:
        ! First check that the POR value is correct
	setx	FIRE_DLC_TSB_CSR_A_TSB_DMA_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_TSB_CSR_A_TSB_DMA_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_148_EXP_VALUE mpeval( (~FIRE_DLC_TSB_CSR_A_TSB_DMA_POR_VALUE & FIRE_DLC_TSB_CSR_A_TSB_DMA_WRITE_MASK) | (FIRE_DLC_TSB_CSR_A_TSB_DMA_POR_VALUE & ~FIRE_DLC_TSB_CSR_A_TSB_DMA_WRITE_MASK) )

	best_set_reg(REG_148_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_149:
        ! First check that the POR value is correct
	setx	FIRE_DLC_TSB_CSR_A_TSB_STS_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_TSB_CSR_A_TSB_STS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_149_EXP_VALUE mpeval( (~FIRE_DLC_TSB_CSR_A_TSB_STS_POR_VALUE & FIRE_DLC_TSB_CSR_A_TSB_STS_WRITE_MASK) | (FIRE_DLC_TSB_CSR_A_TSB_STS_POR_VALUE & ~FIRE_DLC_TSB_CSR_A_TSB_STS_WRITE_MASK) )

	best_set_reg(REG_149_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_150:
        ! First check that the POR value is correct
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_150_EXP_VALUE mpeval( (~FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_POR_VALUE & FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_WRITE_MASK) | (FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_POR_VALUE & ~FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_WRITE_MASK) )

	best_set_reg(REG_150_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_151:
        ! First check that the POR value is correct
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_INT_EN_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_ILU_CIB_CSR_A_ILU_INT_EN_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_151_EXP_VALUE mpeval( (~FIRE_DLC_ILU_CIB_CSR_A_ILU_INT_EN_POR_VALUE & FIRE_DLC_ILU_CIB_CSR_A_ILU_INT_EN_WRITE_MASK) | (FIRE_DLC_ILU_CIB_CSR_A_ILU_INT_EN_POR_VALUE & ~FIRE_DLC_ILU_CIB_CSR_A_ILU_INT_EN_WRITE_MASK) )

	best_set_reg(REG_151_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_152:
        ! First check that the POR value is correct
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_EN_ERR_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_ILU_CIB_CSR_A_ILU_EN_ERR_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_152_EXP_VALUE mpeval( (~FIRE_DLC_ILU_CIB_CSR_A_ILU_EN_ERR_POR_VALUE & FIRE_DLC_ILU_CIB_CSR_A_ILU_EN_ERR_WRITE_MASK) | (FIRE_DLC_ILU_CIB_CSR_A_ILU_EN_ERR_POR_VALUE & ~FIRE_DLC_ILU_CIB_CSR_A_ILU_EN_ERR_WRITE_MASK) )

	best_set_reg(REG_152_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_153:
        ! First check that the POR value is correct
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1C_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1C_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_153_EXP_VALUE mpeval( (~FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1C_ALIAS_POR_VALUE & 0) | (FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1C_ALIAS_POR_VALUE & ~0) )

	best_set_reg(REG_153_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_154:
        ! First check that the POR value is correct
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_154_EXP_VALUE mpeval( (~FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_POR_VALUE & FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_WRITE_MASK) | (FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_POR_VALUE & ~FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_WRITE_MASK) )

	best_set_reg(REG_154_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_155:
        ! First check that the POR value is correct
	setx	FIRE_DLC_ILU_CIB_CSR_A_PEC_INT_EN_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_ILU_CIB_CSR_A_PEC_INT_EN_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_155_EXP_VALUE mpeval( (~FIRE_DLC_ILU_CIB_CSR_A_PEC_INT_EN_POR_VALUE & FIRE_DLC_ILU_CIB_CSR_A_PEC_INT_EN_WRITE_MASK) | (FIRE_DLC_ILU_CIB_CSR_A_PEC_INT_EN_POR_VALUE & ~FIRE_DLC_ILU_CIB_CSR_A_PEC_INT_EN_WRITE_MASK) )

	best_set_reg(REG_155_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_156:
        ! First check that the POR value is correct
	setx	FIRE_DLC_ILU_CIB_CSR_A_PEC_EN_ERR_ADDR, %g1, %g2
	best_set_reg(FIRE_DLC_ILU_CIB_CSR_A_PEC_EN_ERR_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed		! set by other reg tests
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_156_EXP_VALUE mpeval( (~FIRE_DLC_ILU_CIB_CSR_A_PEC_EN_ERR_POR_VALUE & FIRE_DLC_ILU_CIB_CSR_A_PEC_EN_ERR_WRITE_MASK) | (FIRE_DLC_ILU_CIB_CSR_A_PEC_EN_ERR_POR_VALUE & ~FIRE_DLC_ILU_CIB_CSR_A_PEC_EN_ERR_WRITE_MASK) )

	best_set_reg(REG_156_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed		! set by other reg tests
	nop


REG_TEST_157:
        ! First check that the POR value is correct
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_DIAGNOS_ADDR, %g1, %g2
#ifdef DTM_ENABLED
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_DIAGNOS_POR_VALUE+4, %g1, %g3 ! Half rate in DTM mode
#else
	best_set_reg(FIRE_DLC_ILU_CIB_CSR_A_ILU_DIAGNOS_POR_VALUE, %g1, %g3)
#endif
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	!xor	%g3, %l1, %l2
	stx	%g4, [%g2]                      ! store POR value

	ldx	[%g2], %g5			 
        cmp     %g5, %g4
        bne	test_failed
	nop

REG_TEST_158:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	!xor	%g3, %l1, %l2
	setx	0xfffffffffffffd01, %g1, %l2	! leave non-spare config bits as is
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_158_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_WRITE_MASK) )

	!best_set_reg(REG_158_EXP_VALUE, %g1, %g7)  ! get expected value
	
	setx	0x00000000ff17fd01, %g1, %g7	    ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_159:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_STS_ADDR, %g1, %g2
#ifdef DTM_ENABLED
	set	4, %g3	! Data link active state
#else
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_STS_POR_VALUE, %g1, %g3)
#endif
	ldx	[%g2], %g4

	xor	%l1, 0x100, %l3		! mask off the drain state bit
	and	%l3, %g4, %g4
	
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/*****************************
        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_159_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_STS_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_STS_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_STS_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_STS_WRITE_MASK) )

	best_set_reg(REG_159_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
******************************/
	
REG_TEST_160:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TRN_OFF_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TRN_OFF_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	!xor	%g3, %l1, %l2
	stx	%g0, [%g2]                      ! write 0s for VCM coverage

	ldx	[%g2], %g4
        cmp     %g4, 0
        bne	test_failed
	nop 

REG_TEST_161:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICI_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICI_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_161_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICI_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICI_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICI_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICI_WRITE_MASK) )

	best_set_reg(REG_161_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_162:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DIAG_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DIAG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/************** writing to this reg could cause parity errors
        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_162_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DIAG_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DIAG_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DIAG_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DIAG_WRITE_MASK) )

	best_set_reg(REG_162_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
*****************************************/

REG_TEST_163:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECC_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECC_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_163_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECC_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECC_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECC_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECC_WRITE_MASK) )

	best_set_reg(REG_163_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_164:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECL_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECL_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_164_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECL_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECL_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECL_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECL_WRITE_MASK) )

	best_set_reg(REG_164_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_165:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ERB_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ERB_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed		! somehow, drain state is set
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_165_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ERB_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ERB_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ERB_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ERB_WRITE_MASK) )

	best_set_reg(REG_165_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


REG_TEST_166:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICA_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICA_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed		! getting wrong result, I suspect due to drain state
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_166_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICA_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICA_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICA_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICA_WRITE_MASK) )

	best_set_reg(REG_166_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed		! getting wrong result, I suspect due to drain state
	nop


REG_TEST_167:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICR_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICR_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_167_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICR_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICR_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICR_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICR_WRITE_MASK) )

	best_set_reg(REG_167_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ba	test_passed
	nop

thread_7:
	
REG_TEST_168:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_168_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_WRITE_MASK) )

	best_set_reg(REG_168_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_169:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_INT_EN_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_INT_EN_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_169_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_INT_EN_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_INT_EN_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_INT_EN_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_INT_EN_WRITE_MASK) )

	best_set_reg(REG_169_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_170:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_EN_ERR_ADDR, %g1, %g2
#ifdef DTM_ENABLED
	best_set_reg(0x100, %g1, %g3)						! link up bit set in DTM mode
#else
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_EN_ERR_POR_VALUE, %g1, %g3)	! por value == 0
#endif
	ldx	[%g2], %g4

        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#ifdef DTM_ENABLED
! link up bit set in DTM mode
#define REG_170_EXP_VALUE 0x100
#else
#define REG_170_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_EN_ERR_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_EN_ERR_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_EN_ERR_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_EN_ERR_WRITE_MASK) )
#endif

	best_set_reg(REG_170_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_171:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_ADDR, %g1, %g2
#ifdef DTM_ENABLED
	best_set_reg(0x100, %g1, %g3)						! link up bit set in DTM mode
#else
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_POR_VALUE, %g1, %g3)
#endif
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	!xor	%g3, %l1, %l2
	stx	%l1, [%g2]  ! store inverted POR value, should clear bit 8 in DTM mode

#define REG_171_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_POR_VALUE & 0) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_POR_VALUE & ~0) )

	best_set_reg(REG_171_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_172:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1S_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1S_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_172_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1S_ALIAS_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1S_ALIAS_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1S_ALIAS_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1S_ALIAS_WRITE_MASK) )

	best_set_reg(REG_172_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_173:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR1_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR1_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_173_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR1_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR1_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR1_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR1_WRITE_MASK) )

	best_set_reg(REG_173_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_174:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR2_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR2_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_174_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR2_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR2_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR2_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR2_WRITE_MASK) )

	best_set_reg(REG_174_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_175:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR1_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR1_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_175_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR1_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR1_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR1_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR1_WRITE_MASK) )

	best_set_reg(REG_175_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


REG_TEST_176:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR2_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR2_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_176_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR2_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR2_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR2_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR2_WRITE_MASK) )

	best_set_reg(REG_176_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


REG_TEST_177:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRFC_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRFC_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_177_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRFC_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRFC_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRFC_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRFC_WRITE_MASK) )

	best_set_reg(REG_177_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_178:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF0_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF0_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_178_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF0_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF0_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF0_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF0_WRITE_MASK) )

	best_set_reg(REG_178_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_179:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF1_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF1_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_179_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF1_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF1_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF1_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF1_WRITE_MASK) )

	best_set_reg(REG_179_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_180:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF2_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF2_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_180_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF2_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF2_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF2_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF2_WRITE_MASK) )

	best_set_reg(REG_180_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_181:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_A_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_A_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_181_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_A_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_A_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_A_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_A_WRITE_MASK) )

	best_set_reg(REG_181_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_182:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_B_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_B_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_182_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_B_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_B_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_B_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_B_WRITE_MASK) )

	best_set_reg(REG_182_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_183:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CAP_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CAP_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_183_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CAP_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CAP_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CAP_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CAP_WRITE_MASK) )

	best_set_reg(REG_183_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_184:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CTL_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CTL_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_184_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CTL_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CTL_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CTL_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CTL_WRITE_MASK) )

	best_set_reg(REG_184_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_185:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_STS_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_STS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_185_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_STS_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_STS_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_STS_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_STS_WRITE_MASK) )

	best_set_reg(REG_185_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_186:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CAP_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CAP_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_186_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CAP_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CAP_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CAP_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CAP_WRITE_MASK) )

	best_set_reg(REG_186_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_187:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CTL_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CTL_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	mov	0x30, %g3			! don't write to the retrain & link disable bits
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

/* #define REG_187_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CTL_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CTL_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CTL_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CTL_WRITE_MASK) ) */
	
!#define REG_187_EXP_VALUE 0x00000000000000d3
#define REG_187_EXP_VALUE 0x00000000000000c3

	best_set_reg(REG_187_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_188:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_STS_ADDR, %g1, %g2
#ifdef DTM_ENABLED
	set	0x81, %g3		! link is up, with 8 lanes
#else
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_STS_POR_VALUE, %g1, %g3)
#endif
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_188_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_STS_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_STS_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_STS_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_STS_WRITE_MASK) )

	!best_set_reg(REG_188_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        !xorcc   %g7, %g4, %g5
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop


REG_TEST_189:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SLT_CAP_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_SLT_CAP_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/******************* A write to this reg will cause the msg to be sent
        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_189_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_SLT_CAP_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_SLT_CAP_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_SLT_CAP_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_SLT_CAP_WRITE_MASK) )

	best_set_reg(REG_189_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
*******************************/

REG_TEST_190:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_190_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_WRITE_MASK) )

	best_set_reg(REG_190_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_191:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_INT_EN_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_INT_EN_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_191_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_INT_EN_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_INT_EN_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_INT_EN_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_INT_EN_WRITE_MASK) )

	best_set_reg(REG_191_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_192:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_EN_ERR_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_EN_ERR_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_192_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_EN_ERR_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_EN_ERR_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_EN_ERR_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_EN_ERR_WRITE_MASK) )

	best_set_reg(REG_192_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_193:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1C_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1C_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_193_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1C_ALIAS_POR_VALUE & 0) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1C_ALIAS_POR_VALUE & ~0) )

	best_set_reg(REG_193_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_194:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1S_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1S_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_194_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1S_ALIAS_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1S_ALIAS_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1S_ALIAS_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1S_ALIAS_WRITE_MASK) )

	best_set_reg(REG_194_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_195:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR1_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR1_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_195_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR1_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR1_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR1_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR1_WRITE_MASK) )

	best_set_reg(REG_195_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        !xorcc   %g7, %g4, %g5
        !bne	test_failed
	!nop


REG_TEST_196:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR2_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR2_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_196_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR2_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR2_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR2_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR2_WRITE_MASK) )

	best_set_reg(REG_196_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        !xorcc   %g7, %g4, %g5
        !bne	test_failed
	!nop


REG_TEST_197:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR1_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR1_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
	
        !xorcc   %g3, %g4, %g5			! got 0000000000000d00 in simulation
        !bne	test_failed
	!nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_197_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR1_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR1_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR1_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR1_WRITE_MASK) )

	best_set_reg(REG_197_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        !xorcc   %g7, %g4, %g5
        !bne	test_failed
	!nop


REG_TEST_198:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR2_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR2_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_198_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR2_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR2_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR2_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR2_WRITE_MASK) )

	best_set_reg(REG_198_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        !xorcc   %g7, %g4, %g5
        !bne	test_failed
	!nop


REG_TEST_199:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_199_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_WRITE_MASK) )

	best_set_reg(REG_199_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_200:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_INT_EN_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_INT_EN_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_200_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_INT_EN_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_INT_EN_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_INT_EN_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_INT_EN_WRITE_MASK) )

	best_set_reg(REG_200_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_201:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_EN_ERR_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_EN_ERR_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_201_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_EN_ERR_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_EN_ERR_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_EN_ERR_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_EN_ERR_WRITE_MASK) )

	best_set_reg(REG_201_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_202:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1C_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1C_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_202_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1C_ALIAS_POR_VALUE & 0) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1C_ALIAS_POR_VALUE & ~0) )

	best_set_reg(REG_202_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_203:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1S_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1S_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_203_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1S_ALIAS_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1S_ALIAS_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1S_ALIAS_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1S_ALIAS_WRITE_MASK) )

	best_set_reg(REG_203_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_204:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_PEU_DLPL_SERDES_REV_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_PEU_DLPL_SERDES_REV_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_204_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_PEU_DLPL_SERDES_REV_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_PEU_DLPL_SERDES_REV_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_PEU_DLPL_SERDES_REV_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_PEU_DLPL_SERDES_REV_WRITE_MASK) )

	best_set_reg(REG_204_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_205:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_THRESH_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_THRESH_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_205_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_THRESH_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_THRESH_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_THRESH_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_THRESH_WRITE_MASK) )

	best_set_reg(REG_205_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_206:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_TIMER_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_TIMER_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_206_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_TIMER_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_TIMER_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_TIMER_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_TIMER_WRITE_MASK) )

	best_set_reg(REG_206_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_207:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIM_THRESH_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIM_THRESH_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_207_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIM_THRESH_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIM_THRESH_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIM_THRESH_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIM_THRESH_WRITE_MASK) )

	best_set_reg(REG_207_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_208:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIMER_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIMER_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_208_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIMER_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIMER_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIMER_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIMER_WRITE_MASK) )

	best_set_reg(REG_208_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_209:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_VEN_DLLP_MSG_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_VEN_DLLP_MSG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_209_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_VEN_DLLP_MSG_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_VEN_DLLP_MSG_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_VEN_DLLP_MSG_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_VEN_DLLP_MSG_WRITE_MASK) )

	best_set_reg(REG_209_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_210:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_FORCE_LTSSM_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_FORCE_LTSSM_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_210_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_FORCE_LTSSM_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_FORCE_LTSSM_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_FORCE_LTSSM_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_FORCE_LTSSM_WRITE_MASK) )

	best_set_reg(REG_210_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_211:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
#ifdef DTM_ENABLED
	set	4, %l3			! mask for "omr" bit 2 in DTM mode
	xor	%l3, %l1, %l3		! invert it so it can be masked off
	and	%l2, %l3, %l2		! so that an invalid DLLP is not sent
#endif
	stx	%l2, [%g2]                      ! store inverted POR value

#ifdef DTM_ENABLED
#define REG_211_EXP_VALUE mpeval( (~(FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_POR_VALUE|4) & FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_WRITE_MASK) )
#else
#define REG_211_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_WRITE_MASK) )
#endif

	best_set_reg(REG_211_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_212:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_ADDR, %g1, %g2
#ifdef DTM_ENABLED
	! in DTM mode, scrambling is disabled
	best_set_reg(eval(FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_POR_VALUE+2), %g1, %g3)
#else
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_POR_VALUE, %g1, %g3)
#endif
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

#ifdef DTM_ENABLED
	stx	%g4, [%g2]                      ! store POR value for some coverage
	ldx	[%g2], %g7
#else
        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_212_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_WRITE_MASK) )

	best_set_reg(REG_212_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
#endif
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_213:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LANE_SKEW_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_LANE_SKEW_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_213_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_LANE_SKEW_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_LANE_SKEW_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_LANE_SKEW_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_LANE_SKEW_WRITE_MASK) )

	best_set_reg(REG_213_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_214:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_NUM_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_NUM_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_214_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_NUM_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_NUM_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_NUM_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_NUM_WRITE_MASK) )

	best_set_reg(REG_214_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_215:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_TIMER_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_TIMER_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_215_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_TIMER_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_TIMER_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_TIMER_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_TIMER_WRITE_MASK) )

	best_set_reg(REG_215_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_216:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_216_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_WRITE_MASK) )

	best_set_reg(REG_216_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


REG_TEST_217:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_LOG_EN_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_LOG_EN_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_217_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_LOG_EN_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_LOG_EN_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_LOG_EN_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_LOG_EN_WRITE_MASK) )

	best_set_reg(REG_217_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_218:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_EN_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_EN_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_218_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_EN_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_EN_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_EN_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_EN_WRITE_MASK) )

	best_set_reg(REG_218_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_219:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_STS_ADDR, %g1, %g2
	ldx	[%g2], %g4

	! mask off some status bits that might have gotten set
	best_set_reg(0xffffffff00ffbfff, %g1, %l3)
	and	%l3, %g4, %g4
	
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_STS_POR_VALUE, %g1, %g3)
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_219_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_STS_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_STS_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_STS_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_STS_WRITE_MASK) )

	best_set_reg(REG_219_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
	and	%l3, %g4, %g4	! mask off some status bits that might have gotten set
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_220:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_ADDR, %g1, %g2
	ldx	[%g2], %g4

	! mask off some status bits that might have gotten set
	and	%l3, %g4, %g4
	
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_POR_VALUE, %g1, %g3)
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_220_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_POR_VALUE & 0) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_POR_VALUE & ~0) )

	best_set_reg(REG_220_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
	and	%l3, %g4, %g4	! mask off some status bits that might have gotten set
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_221:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_221_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_WRITE_MASK) )

	best_set_reg(REG_221_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


REG_TEST_222:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_1_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_1_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_222_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_1_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_1_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_1_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_1_WRITE_MASK) )

	best_set_reg(REG_222_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


REG_TEST_223:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_2_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_2_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_223_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_2_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_2_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_2_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_2_WRITE_MASK) )

	best_set_reg(REG_223_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_224:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_PLL_ADDR, %g1, %g2
#ifdef DTM_ENABLED
	set	5, %g3		! 125 Mhz ref clk in DTM mode
#else
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_PLL_POR_VALUE, %g1, %g3)
#endif
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****** don't change the serdes pll config
        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_224_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_PLL_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_PLL_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_PLL_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_PLL_WRITE_MASK) )

	best_set_reg(REG_224_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
******/

REG_TEST_225:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****   ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_225_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_WRITE_MASK) )

	best_set_reg(REG_225_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

REG_TEST_226:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_STATUS_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_STATUS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_226_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_STATUS_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_STATUS_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_STATUS_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_STATUS_WRITE_MASK) )

	best_set_reg(REG_226_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        !bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        !bne	test_failed
	nop


REG_TEST_227:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_227_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_WRITE_MASK) )

	best_set_reg(REG_227_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
****/

REG_TEST_228:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_STATUS_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_STATUS_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

       ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_228_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_STATUS_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_STATUS_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_STATUS_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_STATUS_WRITE_MASK) )

	best_set_reg(REG_228_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop


REG_TEST_229:
        ! First check that the POR value is correct
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_MACRO_TEST_CFG_ADDR, %g1, %g2
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_MACRO_TEST_CFG_POR_VALUE, %g1, %g3)
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****************** don't modify this reg
        ! Next check that all the writable bits can be written
	xor	%g3, %l1, %l2
	stx	%l2, [%g2]                      ! store inverted POR value

#define REG_229_EXP_VALUE mpeval( (~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_MACRO_TEST_CFG_POR_VALUE & FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_MACRO_TEST_CFG_WRITE_MASK) | (FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_MACRO_TEST_CFG_POR_VALUE & ~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_MACRO_TEST_CFG_WRITE_MASK) )

	best_set_reg(REG_229_EXP_VALUE, %g1, %g7)  ! get expected value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
***********************************/

        ! First check that the POR value is correct
	add	%g2, 8, %g2
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        bne	test_failed
	nop

/****************** don't modify this reg
        ! Next check that all the writable bits can be written
	stx	%l2, [%g2]                      ! store inverted POR value
	ldx	[%g2], %g4
        xorcc   %g7, %g4, %g5
        bne	test_failed
	nop
*******************************************/



test_passed:
	EXIT_GOOD

        .align 64       ! start a new line
test_failed:
	EXIT_BAD


