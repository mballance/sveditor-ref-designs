/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: RegWrWrmrst.s
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
#define RESET_STAT_CHECK
#define RESET_CHECK_REG
	
#include "hboot.s"
#include "peu_defines.h"
#include "dmu_peu_regs.h"
#include "rst_defines.h"

/*
Test case code start
*/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

/************************************************************
 Check if this is the first time thru here
 ************************************************************/
	setx	test_entered, %g1, %g2
	ldx	[%g2], %g3
	brnz	%g3, After_Warm_Reset
	nop
	
! First time thru, Store a non-zero value there 
	dec	%g3
	stx	%g3, [%g2]
	
/************************************************************
 Read each register information entry (addr, value), write
 the reg, read back what got written and save it.
 ************************************************************/
write_por_regs:
	setx	RegisterData, %g1, %g2

write_por_reg_loop:
	ldx	[%g2 + 0], %g3
	ldx	[%g2 + 8], %g4
	brz	%g3, do_WARM_RESET
	nop
	stx	%g4, [%g3]
	ldx	[%g3], %g5
	stx	%g5, [%g2 + 24]
	add	%g2, 0x20, %g2
	b	write_por_reg_loop
	nop

/************************************************************
 Now do a WARM RESET.
 ************************************************************/
do_WARM_RESET:
#ifdef PCIE_USE_SSYS_RESET
        setx    RST_SSYS_RESET, %g1, %g5	! subsystem reset reg
        mov	RST_SSYS_RESET__DMU_PEU, %g7	! subsystem reset reg data
        stx     %g7, [%g5]			! Subsystem Reset
	
	mov	255, %l0			! loop timeout count
	
Wait4SsysReset:
        ldx     [%g5], %l7		! should clear when Subsystem Reset is done
	brz	%l7, After_Warm_Reset
	nop
	dec	%l0
	brnz	%l0, Wait4SsysReset
	nop
	ba	test_failed		! Subsystem reset should have completed
	nop
#else
        setx    RST_RESET_GEN, %g1, %g5	! warm reset reg
        mov	RST_RESET_GEN__WMR_GEN, %g7	! warm reset reg data
	mov	25, %l0		! loop timeout count

        stx     %g7, [%g5]		! Warm Reset
        ldx     [%g5], %g7
	
Wait4WarmReset:
	dec	%l0
	brnz	%l0, Wait4WarmReset
	nop
	b	test_failed
	nop
#endif	
	
/************************************************************
 Read all the registers written above to verify that the values 
 written were retained.
 I have to SAVE the value I read out above and do a comparison 
 here, otherwise the follow-me register stuff makes  Riesling 
 think that whatever gets read back is always correct.
 ************************************************************/
After_Warm_Reset:
	setx	RegisterData, %g1, %g2

read_por_reg_loop:
	ldx	[%g2 + 0], %g3
	ldx	[%g2 + 24], %g4
	brz	%g3, test_passed
	nop
	
	ldx	[%g3], %g5		! read por reg
	xor	%g4, %g5, %g6		! compare to pre-reset value
	brnz	%g6, test_failed	! if different, fail
	nop
	
	add	%g2, 0x20, %g2
	b	read_por_reg_loop
	nop


	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

	.align 64
test_entered:
	.xword 0			! pass 1 / pass 2 indicator 
	
/********************************************************************
 Register Data
 1. Register address
 2. Value to write
 3. Mask for value read back
 4. Value read back before Warm Reset	
 ********************************************************************/
	.align 64
RegisterData:
	.xword	FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1S_ALIAS_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_DLC_IMU_ICS_CSR_A_IMU_RDS_ERROR_LOG_REG_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_DLC_IMU_ICS_CSR_A_IMU_SCS_ERROR_LOG_REG_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_DLC_IMU_ICS_CSR_A_IMU_EQS_ERROR_LOG_REG_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_DLC_MMU_CSR_A_LOG_ADDR
	.xword	~FIRE_DLC_MMU_CSR_A_LOG_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_DLC_MMU_CSR_A_ERR_RW1S_ALIAS_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_DLC_MMU_CSR_A_FLTA_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_DLC_MMU_CSR_A_FLTS_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x00)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x08)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x10)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x18)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x20)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x28)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x30)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x38)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x40)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x48)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x50)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x58)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x60)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x68)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x70)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR + 0x78)
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0

	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x00)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x08)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x10)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x18)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x20)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x28)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x30)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x38)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x40)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x48)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x50)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x58)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x60)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x68)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x70)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x78)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x80)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x88)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x90)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0x98)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0xa0)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0xa8)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0xb0)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0xb8)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0xc0)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0xc8)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0xd0)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0xd8)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0xe0)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0xe8)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0xf0)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0
	
	.xword	mpeval(FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR + 0xf8)
	.xword	0xffffffffffffffff
	.xword  0xcfffffffffffffff	! bits 61-62 are parity gen'd by hw
	.xword	0

	
	.xword	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_ADDR
	.xword	~FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_ERR_RW1S_ALIAS_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICI_ADDR
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICI_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_ADDR
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1S_ALIAS_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR1_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_ROE_HDR2_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR1_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_TOE_HDR2_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_ADDR
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1S_ALIAS_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR1_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_RUE_HDR2_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR1_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_TUE_HDR2_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_ADDR
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_ERR_RW1S_ALIAS_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_LOG_EN_ADDR
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_LOG_EN_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1S_ALIAS_ADDR
	.xword	0xffffffffffffffff
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_PLL_ADDR
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_PLL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_ADDR + 0x00)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_ADDR + 0x08)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_ADDR + 0x10)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_ADDR + 0x18)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_ADDR + 0x20)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_ADDR + 0x28)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_ADDR + 0x30)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_ADDR + 0x38)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_RECEIVER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_ADDR + 0x00)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_ADDR + 0x08)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_ADDR + 0x10)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_ADDR + 0x18)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_ADDR + 0x20)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_ADDR + 0x28)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_ADDR + 0x30)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_ADDR + 0x38)
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_XMITTER_LANE_CTL_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_MACRO_TEST_CFG_ADDR
	.xword	~FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_MACRO_TEST_CFG_POR_VALUE
	.xword  0xffffffffffffffff
	.xword	0
	
	.xword	0 ! the end
	.xword	0
	.xword	0
	.xword	0
	
	.xword	0 ! the end
	.xword	0
	.xword	0
	.xword	0
	
