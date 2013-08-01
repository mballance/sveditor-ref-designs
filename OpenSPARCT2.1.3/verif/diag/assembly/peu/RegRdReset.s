/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: RegRdReset.s
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

#ifndef NO_SELF_CHECK
#define BNE_TEST_FAIL  bne	test_failed
#else
#define BNE_TEST_FAIL  nop
#endif

/*
Test case code start
*/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	!setx	N2_DMU_PEU_BASE_ADDR, %g1, %g7
REG_TEST_0:
	setx	FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_A_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_0) + 8, 16, 16)) -> printf("\nRead REG_TEST_0\n")
	!set	FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_A_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_0) + 8, 16, 16)) -> printf("\nRead REG_TEST_0\n")
	setx	FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_A_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_1:
	setx	FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_B_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_1) + 8, 16, 16)) -> printf("\nRead REG_TEST_1\n")
	setx	FIRE_DLC_CRU_CSR_A_DMC_DBG_SEL_B_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_2:
	setx	FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_2) + 8, 16, 16)) -> printf("\nRead REG_TEST_2\n")
	setx	FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_3:
	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_3) + 8, 16, 16)) -> printf("\nRead REG_TEST_3\n")
#ifdef DTM_ENABLED	
	setx	FIRE_DLC_MMU_CSR_A_CTL_POR_VALUE+2, %g1, %g3 ! Bypass enable is set
#else
	setx	FIRE_DLC_MMU_CSR_A_CTL_POR_VALUE, %g1, %g3
#endif
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_4:
	setx	FIRE_DLC_MMU_CSR_A_TSB_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_4) + 8, 16, 16)) -> printf("\nRead REG_TEST_4\n")
	setx	FIRE_DLC_MMU_CSR_A_TSB_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_5:
	setx	FIRE_DLC_MMU_CSR_A_FSH_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_5) + 8, 16, 16)) -> printf("\nRead REG_TEST_5\n")
	setx	FIRE_DLC_MMU_CSR_A_FSH_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_6:
	setx	FIRE_DLC_MMU_CSR_A_INV_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_6) + 8, 16, 16)) -> printf("\nRead REG_TEST_6\n")
	setx	FIRE_DLC_MMU_CSR_A_INV_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_7:
	setx	FIRE_DLC_MMU_CSR_A_LOG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_7) + 8, 16, 16)) -> printf("\nRead REG_TEST_7\n")
	setx	FIRE_DLC_MMU_CSR_A_LOG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_8:
	setx	FIRE_DLC_MMU_CSR_A_INT_EN_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_8) + 8, 16, 16)) -> printf("\nRead REG_TEST_8\n")
	setx	FIRE_DLC_MMU_CSR_A_INT_EN_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_9:
	setx	FIRE_DLC_MMU_CSR_A_EN_ERR_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_9) + 8, 16, 16)) -> printf("\nRead REG_TEST_9\n")
	setx	FIRE_DLC_MMU_CSR_A_EN_ERR_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_10:
	setx	FIRE_DLC_MMU_CSR_A_ERR_RW1C_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_10) + 8, 16, 16)) -> printf("\nRead REG_TEST_10\n")
	setx	FIRE_DLC_MMU_CSR_A_ERR_RW1C_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_11:
	setx	FIRE_DLC_MMU_CSR_A_ERR_RW1S_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_11) + 8, 16, 16)) -> printf("\nRead REG_TEST_11\n")
	setx	FIRE_DLC_MMU_CSR_A_ERR_RW1S_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_12:
	setx	FIRE_DLC_MMU_CSR_A_FLTA_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_12) + 8, 16, 16)) -> printf("\nRead REG_TEST_12\n")
	setx	FIRE_DLC_MMU_CSR_A_FLTA_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_13:
	setx	FIRE_DLC_MMU_CSR_A_FLTS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_13) + 8, 16, 16)) -> printf("\nRead REG_TEST_13\n")
	setx	FIRE_DLC_MMU_CSR_A_FLTS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_14:
	setx	FIRE_DLC_MMU_CSR_A_PRFC_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_14) + 8, 16, 16)) -> printf("\nRead REG_TEST_14\n")
	setx	FIRE_DLC_MMU_CSR_A_PRFC_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_15:
	setx	FIRE_DLC_MMU_CSR_A_PRF0_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_15) + 8, 16, 16)) -> printf("\nRead REG_TEST_15\n")
	setx	FIRE_DLC_MMU_CSR_A_PRF0_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_16:
	setx	FIRE_DLC_MMU_CSR_A_PRF1_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_16) + 8, 16, 16)) -> printf("\nRead REG_TEST_16\n")
	setx	FIRE_DLC_MMU_CSR_A_PRF1_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_17:
	setx	FIRE_DLC_MMU_CSR_A_VTB_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_17) + 8, 16, 16)) -> printf("\nRead REG_TEST_17\n")
	setx	FIRE_DLC_MMU_CSR_A_VTB_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_18:
	setx	FIRE_DLC_MMU_CSR_A_PTB_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_18) + 8, 16, 16)) -> printf("\nRead REG_TEST_18\n")
	setx	FIRE_DLC_MMU_CSR_A_PTB_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_19:
	setx	FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_19) + 8, 16, 16)) -> printf("\nRead REG_TEST_19\n")
	setx	FIRE_DLC_MMU_CSR_A_DEV2IOTSB_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_20:
	setx	FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_20) + 8, 16, 16)) -> printf("\nRead REG_TEST_20\n")
	setx	FIRE_DLC_MMU_CSR_A_IOTSBDESC_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_21:
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_BASE_ADDRESS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_21) + 8, 16, 16)) -> printf("\nRead REG_TEST_21\n")
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_BASE_ADDRESS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_22:
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_SET_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_22) + 8, 16, 16)) -> printf("\nRead REG_TEST_22\n")
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_SET_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_23:
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_CLR_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_23) + 8, 16, 16)) -> printf("\nRead REG_TEST_23\n")
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_CLR_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_24:
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_STATE_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_24) + 8, 16, 16)) -> printf("\nRead REG_TEST_24\n")
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_STATE_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_25:
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_TAIL_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_25) + 8, 16, 16)) -> printf("\nRead REG_TEST_25\n")
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_TAIL_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_26:
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_HEAD_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_26) + 8, 16, 16)) -> printf("\nRead REG_TEST_26\n")
	setx	FIRE_DLC_IMU_EQS_CSR_A_EQ_HEAD_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_27:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_27) + 8, 16, 16)) -> printf("\nRead REG_TEST_27\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_28:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_INT_EN_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_28) + 8, 16, 16)) -> printf("\nRead REG_TEST_28\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_INT_EN_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_29:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ENABLED_ERROR_STATUS_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_29) + 8, 16, 16)) -> printf("\nRead REG_TEST_29\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ENABLED_ERROR_STATUS_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_30:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_30) + 8, 16, 16)) -> printf("\nRead REG_TEST_30\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_31:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1S_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_31) + 8, 16, 16)) -> printf("\nRead REG_TEST_31\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1S_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_32:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_RDS_ERROR_LOG_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_32) + 8, 16, 16)) -> printf("\nRead REG_TEST_32\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_RDS_ERROR_LOG_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_33:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_SCS_ERROR_LOG_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_33) + 8, 16, 16)) -> printf("\nRead REG_TEST_33\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_SCS_ERROR_LOG_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_34:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_EQS_ERROR_LOG_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_34) + 8, 16, 16)) -> printf("\nRead REG_TEST_34\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_EQS_ERROR_LOG_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_35:
	setx	FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_MASK_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_35) + 8, 16, 16)) -> printf("\nRead REG_TEST_35\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_MASK_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_36:
	setx	FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_STATUS_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_36) + 8, 16, 16)) -> printf("\nRead REG_TEST_36\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_DMC_INTERRUPT_STATUS_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_37:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNTRL_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_37) + 8, 16, 16)) -> printf("\nRead REG_TEST_37\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNTRL_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_38:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT0_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_38) + 8, 16, 16)) -> printf("\nRead REG_TEST_38\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT0_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_39:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT1_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_39) + 8, 16, 16)) -> printf("\nRead REG_TEST_39\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT1_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_40:
	setx	FIRE_DLC_IMU_ICS_CSR_A_MSI_32_ADDR_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_40) + 8, 16, 16)) -> printf("\nRead REG_TEST_40\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_MSI_32_ADDR_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_41:
	setx	FIRE_DLC_IMU_ICS_CSR_A_MSI_64_ADDR_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_41) + 8, 16, 16)) -> printf("\nRead REG_TEST_41\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_MSI_64_ADDR_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_42:
	setx	FIRE_DLC_IMU_ICS_CSR_A_MEM_64_PCIE_OFFSET_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_42) + 8, 16, 16)) -> printf("\nRead REG_TEST_42\n")
	setx	FIRE_DLC_IMU_ICS_CSR_A_MEM_64_PCIE_OFFSET_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_43:
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_43) + 8, 16, 16)) -> printf("\nRead REG_TEST_43\n")
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_44:
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_A_INT_CLR_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_44) + 8, 16, 16)) -> printf("\nRead REG_TEST_44\n")
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_A_INT_CLR_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_45:
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_B_INT_CLR_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_45) + 8, 16, 16)) -> printf("\nRead REG_TEST_45\n")
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_B_INT_CLR_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_46:
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_C_INT_CLR_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_46) + 8, 16, 16)) -> printf("\nRead REG_TEST_46\n")
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_C_INT_CLR_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_47:
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_D_INT_CLR_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_47) + 8, 16, 16)) -> printf("\nRead REG_TEST_47\n")
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INT_D_INT_CLR_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_48:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_20_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_48) + 8, 16, 16)) -> printf("\nRead REG_TEST_48\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_20_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_49:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_21_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_49) + 8, 16, 16)) -> printf("\nRead REG_TEST_49\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_21_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_50:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_22_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_50) + 8, 16, 16)) -> printf("\nRead REG_TEST_50\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_22_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_51:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_23_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_51) + 8, 16, 16)) -> printf("\nRead REG_TEST_51\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_23_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_52:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_24_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_52) + 8, 16, 16)) -> printf("\nRead REG_TEST_52\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_24_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_53:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_25_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_53) + 8, 16, 16)) -> printf("\nRead REG_TEST_53\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_25_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_54:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_26_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_54) + 8, 16, 16)) -> printf("\nRead REG_TEST_54\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_26_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_55:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_27_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_55) + 8, 16, 16)) -> printf("\nRead REG_TEST_55\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_27_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_56:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_28_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_56) + 8, 16, 16)) -> printf("\nRead REG_TEST_56\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_28_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_57:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_29_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_57) + 8, 16, 16)) -> printf("\nRead REG_TEST_57\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_29_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_58:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_30_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_58) + 8, 16, 16)) -> printf("\nRead REG_TEST_58\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_30_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_59:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_31_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_59) + 8, 16, 16)) -> printf("\nRead REG_TEST_59\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_31_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_60:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_32_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_60) + 8, 16, 16)) -> printf("\nRead REG_TEST_60\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_32_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_61:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_33_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_61) + 8, 16, 16)) -> printf("\nRead REG_TEST_61\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_33_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_62:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_34_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_62) + 8, 16, 16)) -> printf("\nRead REG_TEST_62\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_34_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_63:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_35_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_63) + 8, 16, 16)) -> printf("\nRead REG_TEST_63\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_35_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_64:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_36_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_64) + 8, 16, 16)) -> printf("\nRead REG_TEST_64\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_36_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_65:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_37_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_65) + 8, 16, 16)) -> printf("\nRead REG_TEST_65\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_37_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_66:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_38_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_66) + 8, 16, 16)) -> printf("\nRead REG_TEST_66\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_38_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_67:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_39_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_67) + 8, 16, 16)) -> printf("\nRead REG_TEST_67\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_39_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_68:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_40_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_68) + 8, 16, 16)) -> printf("\nRead REG_TEST_68\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_40_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_69:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_41_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_69) + 8, 16, 16)) -> printf("\nRead REG_TEST_69\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_41_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_70:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_42_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_70) + 8, 16, 16)) -> printf("\nRead REG_TEST_70\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_42_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_71:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_43_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_71) + 8, 16, 16)) -> printf("\nRead REG_TEST_71\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_43_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_72:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_44_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_72) + 8, 16, 16)) -> printf("\nRead REG_TEST_72\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_44_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_73:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_45_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_73) + 8, 16, 16)) -> printf("\nRead REG_TEST_73\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_45_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_74:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_46_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_74) + 8, 16, 16)) -> printf("\nRead REG_TEST_74\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_46_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_75:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_47_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_75) + 8, 16, 16)) -> printf("\nRead REG_TEST_75\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_47_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_76:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_48_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_76) + 8, 16, 16)) -> printf("\nRead REG_TEST_76\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_48_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_77:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_49_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_77) + 8, 16, 16)) -> printf("\nRead REG_TEST_77\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_49_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_78:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_50_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_78) + 8, 16, 16)) -> printf("\nRead REG_TEST_78\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_50_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_79:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_51_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_79) + 8, 16, 16)) -> printf("\nRead REG_TEST_79\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_51_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_80:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_52_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_80) + 8, 16, 16)) -> printf("\nRead REG_TEST_80\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_52_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_81:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_53_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_81) + 8, 16, 16)) -> printf("\nRead REG_TEST_81\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_53_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_82:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_54_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_82) + 8, 16, 16)) -> printf("\nRead REG_TEST_82\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_54_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_83:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_55_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_83) + 8, 16, 16)) -> printf("\nRead REG_TEST_83\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_55_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_84:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_56_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_84) + 8, 16, 16)) -> printf("\nRead REG_TEST_84\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_56_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_85:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_57_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_85) + 8, 16, 16)) -> printf("\nRead REG_TEST_85\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_57_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_86:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_58_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_86) + 8, 16, 16)) -> printf("\nRead REG_TEST_86\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_58_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_87:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_59_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_87) + 8, 16, 16)) -> printf("\nRead REG_TEST_87\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_59_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_88:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_62_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_88) + 8, 16, 16)) -> printf("\nRead REG_TEST_88\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_62_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_89:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_63_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_89) + 8, 16, 16)) -> printf("\nRead REG_TEST_89\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_63_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_90:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_20_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_90) + 8, 16, 16)) -> printf("\nRead REG_TEST_90\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_20_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_91:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_21_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_91) + 8, 16, 16)) -> printf("\nRead REG_TEST_91\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_21_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_92:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_22_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_92) + 8, 16, 16)) -> printf("\nRead REG_TEST_92\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_22_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_93:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_23_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_93) + 8, 16, 16)) -> printf("\nRead REG_TEST_93\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_23_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_94:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_24_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_94) + 8, 16, 16)) -> printf("\nRead REG_TEST_94\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_24_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_95:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_25_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_95) + 8, 16, 16)) -> printf("\nRead REG_TEST_95\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_25_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_96:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_26_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_96) + 8, 16, 16)) -> printf("\nRead REG_TEST_96\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_26_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_97:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_27_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_97) + 8, 16, 16)) -> printf("\nRead REG_TEST_97\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_27_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_98:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_28_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_98) + 8, 16, 16)) -> printf("\nRead REG_TEST_98\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_28_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_99:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_29_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_99) + 8, 16, 16)) -> printf("\nRead REG_TEST_99\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_29_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_100:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_30_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_100) + 8, 16, 16)) -> printf("\nRead REG_TEST_100\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_30_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_101:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_31_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_101) + 8, 16, 16)) -> printf("\nRead REG_TEST_101\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_31_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_102:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_32_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_102) + 8, 16, 16)) -> printf("\nRead REG_TEST_102\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_32_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_103:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_33_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_103) + 8, 16, 16)) -> printf("\nRead REG_TEST_103\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_33_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_104:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_34_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_104) + 8, 16, 16)) -> printf("\nRead REG_TEST_104\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_34_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_105:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_35_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_105) + 8, 16, 16)) -> printf("\nRead REG_TEST_105\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_35_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_106:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_36_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_106) + 8, 16, 16)) -> printf("\nRead REG_TEST_106\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_36_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_107:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_37_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_107) + 8, 16, 16)) -> printf("\nRead REG_TEST_107\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_37_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_108:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_38_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_108) + 8, 16, 16)) -> printf("\nRead REG_TEST_108\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_38_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_109:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_39_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_109) + 8, 16, 16)) -> printf("\nRead REG_TEST_109\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_39_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_110:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_40_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_110) + 8, 16, 16)) -> printf("\nRead REG_TEST_110\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_40_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_111:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_41_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_111) + 8, 16, 16)) -> printf("\nRead REG_TEST_111\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_41_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_112:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_42_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_112) + 8, 16, 16)) -> printf("\nRead REG_TEST_112\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_42_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_113:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_43_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_113) + 8, 16, 16)) -> printf("\nRead REG_TEST_113\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_43_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_114:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_44_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_114) + 8, 16, 16)) -> printf("\nRead REG_TEST_114\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_44_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_115:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_45_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_115) + 8, 16, 16)) -> printf("\nRead REG_TEST_115\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_45_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_116:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_46_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_116) + 8, 16, 16)) -> printf("\nRead REG_TEST_116\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_46_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_117:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_47_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_117) + 8, 16, 16)) -> printf("\nRead REG_TEST_117\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_47_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_118:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_48_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_118) + 8, 16, 16)) -> printf("\nRead REG_TEST_118\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_48_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_119:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_49_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_119) + 8, 16, 16)) -> printf("\nRead REG_TEST_119\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_49_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_120:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_50_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_120) + 8, 16, 16)) -> printf("\nRead REG_TEST_120\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_50_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_121:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_51_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_121) + 8, 16, 16)) -> printf("\nRead REG_TEST_121\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_51_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_122:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_52_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_122) + 8, 16, 16)) -> printf("\nRead REG_TEST_122\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_52_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_123:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_53_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_123) + 8, 16, 16)) -> printf("\nRead REG_TEST_123\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_53_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_124:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_54_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_124) + 8, 16, 16)) -> printf("\nRead REG_TEST_124\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_54_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_125:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_55_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_125) + 8, 16, 16)) -> printf("\nRead REG_TEST_125\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_55_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_126:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_56_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_126) + 8, 16, 16)) -> printf("\nRead REG_TEST_126\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_56_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_127:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_57_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_127) + 8, 16, 16)) -> printf("\nRead REG_TEST_127\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_57_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_128:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_58_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_128) + 8, 16, 16)) -> printf("\nRead REG_TEST_128\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_58_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_129:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_59_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_129) + 8, 16, 16)) -> printf("\nRead REG_TEST_129\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_59_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_130:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_62_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_130) + 8, 16, 16)) -> printf("\nRead REG_TEST_130\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_62_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_131:
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_63_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_131) + 8, 16, 16)) -> printf("\nRead REG_TEST_131\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_63_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_132:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_RETRY_TIMER_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_132) + 8, 16, 16)) -> printf("\nRead REG_TEST_132\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_RETRY_TIMER_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_133:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_1_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_133) + 8, 16, 16)) -> printf("\nRead REG_TEST_133\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_1_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_134:
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_2_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_134) + 8, 16, 16)) -> printf("\nRead REG_TEST_134\n")
	setx	FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_2_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_135:
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_COR_MAPPING_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_135) + 8, 16, 16)) -> printf("\nRead REG_TEST_135\n")
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_COR_MAPPING_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_136:
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_NONFATAL_MAPPING_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_136) + 8, 16, 16)) -> printf("\nRead REG_TEST_136\n")
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_NONFATAL_MAPPING_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_137:
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_FATAL_MAPPING_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_137) + 8, 16, 16)) -> printf("\nRead REG_TEST_137\n")
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_ERR_FATAL_MAPPING_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_138:
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_PM_PME_MAPPING_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_138) + 8, 16, 16)) -> printf("\nRead REG_TEST_138\n")
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_PM_PME_MAPPING_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_139:
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_PME_TO_ACK_MAPPING_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_139) + 8, 16, 16)) -> printf("\nRead REG_TEST_139\n")
	setx	FIRE_DLC_IMU_RDS_MESS_CSR_A_PME_TO_ACK_MAPPING_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_140:
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_MAPPING_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_140) + 8, 16, 16)) -> printf("\nRead REG_TEST_140\n")
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_MAPPING_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_141:
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1C_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_141) + 8, 16, 16)) -> printf("\nRead REG_TEST_141\n")
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1C_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_142:
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1S_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_142) + 8, 16, 16)) -> printf("\nRead REG_TEST_142\n")
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_MSI_CLEAR_REG_RW1S_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_143:
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_0_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_143) + 8, 16, 16)) -> printf("\nRead REG_TEST_143\n")
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_0_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_144:
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_1_REG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_144) + 8, 16, 16)) -> printf("\nRead REG_TEST_144\n")
	setx	FIRE_DLC_IMU_RDS_MSI_CSR_A_INT_MONDO_DATA_1_REG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_145:
	setx	FIRE_DLC_PSB_CSR_A_PSB_DMA_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_145) + 8, 16, 16)) -> printf("\nRead REG_TEST_145\n")
	setx	FIRE_DLC_PSB_CSR_A_PSB_DMA_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_146:
	setx	FIRE_DLC_PSB_CSR_A_PSB_PIO_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_146) + 8, 16, 16)) -> printf("\nRead REG_TEST_146\n")
	setx	FIRE_DLC_PSB_CSR_A_PSB_PIO_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_147:
	setx	FIRE_DLC_TSB_CSR_A_TSB_DMA_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_147) + 8, 16, 16)) -> printf("\nRead REG_TEST_147\n")
	setx	FIRE_DLC_TSB_CSR_A_TSB_DMA_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_148:
	setx	FIRE_DLC_TSB_CSR_A_TSB_STS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_148) + 8, 16, 16)) -> printf("\nRead REG_TEST_148\n")
	setx	FIRE_DLC_TSB_CSR_A_TSB_STS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_149:
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_149) + 8, 16, 16)) -> printf("\nRead REG_TEST_149\n")
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_150:
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_INT_EN_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_150) + 8, 16, 16)) -> printf("\nRead REG_TEST_150\n")
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_INT_EN_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_151:
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_EN_ERR_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_151) + 8, 16, 16)) -> printf("\nRead REG_TEST_151\n")
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_EN_ERR_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_152:
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1C_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_152) + 8, 16, 16)) -> printf("\nRead REG_TEST_152\n")
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1C_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_153:
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_153) + 8, 16, 16)) -> printf("\nRead REG_TEST_153\n")
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_154:
	setx	FIRE_DLC_ILU_CIB_CSR_A_PEC_INT_EN_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_154) + 8, 16, 16)) -> printf("\nRead REG_TEST_154\n")
	setx	FIRE_DLC_ILU_CIB_CSR_A_PEC_INT_EN_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_155:
	setx	FIRE_DLC_ILU_CIB_CSR_A_PEC_EN_ERR_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_155) + 8, 16, 16)) -> printf("\nRead REG_TEST_155\n")
	setx	FIRE_DLC_ILU_CIB_CSR_A_PEC_EN_ERR_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_156:
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_DIAGNOS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_156) + 8, 16, 16)) -> printf("\nRead REG_TEST_156\n")
#ifdef DTM_ENABLED
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_DIAGNOS_POR_VALUE+4, %g1, %g3 ! Half rate
#else
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_DIAGNOS_POR_VALUE, %g1, %g3
#endif
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_157:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_157) + 8, 16, 16)) -> printf("\nRead REG_TEST_157\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_158:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_STS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_158) + 8, 16, 16)) -> printf("\nRead REG_TEST_158\n")
#ifdef DTM_ENABLED
	set	4, %g3	! Data link active state
#else
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_STS_POR_VALUE, %g1, %g3
#endif
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_159:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TRN_OFF_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_159) + 8, 16, 16)) -> printf("\nRead REG_TEST_159\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TRN_OFF_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_160:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICI_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_160) + 8, 16, 16)) -> printf("\nRead REG_TEST_160\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICI_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_161:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DIAG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_161) + 8, 16, 16)) -> printf("\nRead REG_TEST_161\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DIAG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_162:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECC_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_162) + 8, 16, 16)) -> printf("\nRead REG_TEST_162\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECC_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_163:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECL_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_163) + 8, 16, 16)) -> printf("\nRead REG_TEST_163\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECL_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_164:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ERB_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_164) + 8, 16, 16)) -> printf("\nRead REG_TEST_164\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ERB_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_165:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICA_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_165) + 8, 16, 16)) -> printf("\nRead REG_TEST_165\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICA_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_166:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICR_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_166) + 8, 16, 16)) -> printf("\nRead REG_TEST_166\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICR_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_167:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_167) + 8, 16, 16)) -> printf("\nRead REG_TEST_167\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_168:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_INT_EN_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_168) + 8, 16, 16)) -> printf("\nRead REG_TEST_168\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_INT_EN_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_169:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_EN_ERR_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_169) + 8, 16, 16)) -> printf("\nRead REG_TEST_169\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_EN_ERR_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_170:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_170) + 8, 16, 16)) -> printf("\nRead REG_TEST_170\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_171:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1S_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_171) + 8, 16, 16)) -> printf("\nRead REG_TEST_171\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1S_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_172:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR1_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_172) + 8, 16, 16)) -> printf("\nRead REG_TEST_172\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR1_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_173:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR2_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_173) + 8, 16, 16)) -> printf("\nRead REG_TEST_173\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR2_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

/***************************************************
REG_TEST_174:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR1_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_174) + 8, 16, 16)) -> printf("\nRead REG_TEST_174\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR1_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop
********************************************/

REG_TEST_175:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR2_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_175) + 8, 16, 16)) -> printf("\nRead REG_TEST_175\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR2_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_176:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRFC_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_176) + 8, 16, 16)) -> printf("\nRead REG_TEST_176\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRFC_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_177:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF0_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_177) + 8, 16, 16)) -> printf("\nRead REG_TEST_177\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF0_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_178:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF1_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_178) + 8, 16, 16)) -> printf("\nRead REG_TEST_178\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF1_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_179:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF2_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_179) + 8, 16, 16)) -> printf("\nRead REG_TEST_179\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF2_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_180:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_A_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_180) + 8, 16, 16)) -> printf("\nRead REG_TEST_180\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_A_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_181:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_B_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_181) + 8, 16, 16)) -> printf("\nRead REG_TEST_181\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_DBG_SEL_B_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_182:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CAP_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_182) + 8, 16, 16)) -> printf("\nRead REG_TEST_182\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CAP_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_183:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CTL_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_183) + 8, 16, 16)) -> printf("\nRead REG_TEST_183\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CTL_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_184:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_STS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_184) + 8, 16, 16)) -> printf("\nRead REG_TEST_184\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_STS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_185:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CAP_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_185) + 8, 16, 16)) -> printf("\nRead REG_TEST_185\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CAP_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_186:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CTL_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_186) + 8, 16, 16)) -> printf("\nRead REG_TEST_186\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_CTL_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_187:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_STS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_187) + 8, 16, 16)) -> printf("\nRead REG_TEST_187\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_STS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_188:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SLT_CAP_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_188) + 8, 16, 16)) -> printf("\nRead REG_TEST_188\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SLT_CAP_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_189:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_189) + 8, 16, 16)) -> printf("\nRead REG_TEST_189\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_190:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_INT_EN_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_190) + 8, 16, 16)) -> printf("\nRead REG_TEST_190\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_INT_EN_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_191:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_EN_ERR_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_191) + 8, 16, 16)) -> printf("\nRead REG_TEST_191\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_EN_ERR_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_192:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1C_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_192) + 8, 16, 16)) -> printf("\nRead REG_TEST_192\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1C_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_193:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1S_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_193) + 8, 16, 16)) -> printf("\nRead REG_TEST_193\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1S_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_194:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR1_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_194) + 8, 16, 16)) -> printf("\nRead REG_TEST_194\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR1_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_195:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR2_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_195) + 8, 16, 16)) -> printf("\nRead REG_TEST_195\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR2_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_196:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR1_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_196) + 8, 16, 16)) -> printf("\nRead REG_TEST_196\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR1_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
/* this reg is not in the PRM, so don't bother to check the fetched value (yet)	
!        BNE_TEST_FAIL */
	nop

REG_TEST_197:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR2_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_197) + 8, 16, 16)) -> printf("\nRead REG_TEST_197\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR2_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
/* this reg is not in the PRM, so don't bother to check the fetched value (yet)	
!        BNE_TEST_FAIL */
	nop

REG_TEST_198:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_198) + 8, 16, 16)) -> printf("\nRead REG_TEST_198\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_199:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_INT_EN_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_199) + 8, 16, 16)) -> printf("\nRead REG_TEST_199\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_INT_EN_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_200:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_EN_ERR_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_200) + 8, 16, 16)) -> printf("\nRead REG_TEST_200\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_EN_ERR_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_201:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1C_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_201) + 8, 16, 16)) -> printf("\nRead REG_TEST_201\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1C_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_202:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1S_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_202) + 8, 16, 16)) -> printf("\nRead REG_TEST_202\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1S_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_203:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_PEU_DLPL_SERDES_REV_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_203) + 8, 16, 16)) -> printf("\nRead REG_TEST_203\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_PEU_DLPL_SERDES_REV_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_204:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_THRESH_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_204) + 8, 16, 16)) -> printf("\nRead REG_TEST_204\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_THRESH_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_205:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_TIMER_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_205) + 8, 16, 16)) -> printf("\nRead REG_TEST_205\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_ACKNAK_TIMER_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_206:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIM_THRESH_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_206) + 8, 16, 16)) -> printf("\nRead REG_TEST_206\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIM_THRESH_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_207:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIMER_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_207) + 8, 16, 16)) -> printf("\nRead REG_TEST_207\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_REPLAY_TIMER_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_208:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_VEN_DLLP_MSG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_208) + 8, 16, 16)) -> printf("\nRead REG_TEST_208\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_VEN_DLLP_MSG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_209:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_FORCE_LTSSM_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_209) + 8, 16, 16)) -> printf("\nRead REG_TEST_209\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_FORCE_LTSSM_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_210:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_210) + 8, 16, 16)) -> printf("\nRead REG_TEST_210\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_211:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_211) + 8, 16, 16)) -> printf("\nRead REG_TEST_211\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_212:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LANE_SKEW_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_212) + 8, 16, 16)) -> printf("\nRead REG_TEST_212\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LANE_SKEW_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_213:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_NUM_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_213) + 8, 16, 16)) -> printf("\nRead REG_TEST_213\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_NUM_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_214:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_TIMER_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_214) + 8, 16, 16)) -> printf("\nRead REG_TEST_214\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SYMBOL_TIMER_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

/***************************************************
REG_TEST_215:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_215) + 8, 16, 16)) -> printf("\nRead REG_TEST_215\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop
*******************************************************/

REG_TEST_216:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_LOG_EN_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_216) + 8, 16, 16)) -> printf("\nRead REG_TEST_216\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_LOG_EN_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_217:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_EN_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_217) + 8, 16, 16)) -> printf("\nRead REG_TEST_217\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_EN_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_218:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_STS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_218) + 8, 16, 16)) -> printf("\nRead REG_TEST_218\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_INT_STS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

	! check this reg
	! RTL returns 0x18000
/*************************************
REG_TEST_219:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_219) + 8, 16, 16)) -> printf("\nRead REG_TEST_219\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop
*********************************/
	
	! check this reg
	! RTL returns 0x18000
/*************************************
REG_TEST_220:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_220) + 8, 16, 16)) -> printf("\nRead REG_TEST_220\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_221:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_1_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_221) + 8, 16, 16)) -> printf("\nRead REG_TEST_221\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_1_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop
*********************************/

REG_TEST_222:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_2_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_222) + 8, 16, 16)) -> printf("\nRead REG_TEST_222\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LNK_BIT_ERR_CNT_2_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_223:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_PLL_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_223) + 8, 16, 16)) -> printf("\nRead REG_TEST_223\n")
#ifdef DTM_ENABLED
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_PLL_POR_VALUE|7, %g1, %g3 ! 100 Mhz
#else
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_PLL_POR_VALUE, %g1, %g3
#endif
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_224:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_224) + 8, 16, 16)) -> printf("\nRead REG_TEST_224\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

	! check this reg
	! RTL returns X
/*************************************
REG_TEST_225:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_STATUS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_225) + 8, 16, 16)) -> printf("\nRead REG_TEST_225\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_STATUS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_226:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_226) + 8, 16, 16)) -> printf("\nRead REG_TEST_226\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_227:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_STATUS_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_227) + 8, 16, 16)) -> printf("\nRead REG_TEST_227\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_STATUS_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop

REG_TEST_228:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_MACRO_TEST_CFG_ADDR, %g1, %g2     ! $EV trig_pc_d(1, expr(@VA(.MAIN.REG_TEST_228) + 8, 16, 16)) -> printf("\nRead REG_TEST_228\n")
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_MACRO_TEST_CFG_POR_VALUE, %g1, %g3
	ldx	[%g2], %g4
        xorcc   %g3, %g4, %g5
        BNE_TEST_FAIL
	nop
***************************************************/

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

