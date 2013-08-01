/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeHotRst.s
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
#define RESET_STAT_CHECK
#define RESET_CHECK_REG

#include "hboot.s"
#include "peu_defines.h"
#include "dmu_peu_regs.h"
#include "rst_defines.h"

#define IO_RD_ADDR mpeval((N2_PCIE_BASE_ADDR + (IOCFG_OFFSET_BASE_REG_DATA & 0x7fffffffffffffff)) | IO_ACCESS_PA)

#define DMA_DATA_ADDR		0x0000000123457000
#define DMA_DATA_BYP_ADDR1      0xfffc000123457000
#define DMA_DATA_BYP_ADDR2      0xfffc000123457100
#define DMA_DATA_BYP_ADDR3      0xfffc000123457200
#define DMA_DATA_BYP_ADDR4      0xfffc000123457300

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
 Hot Reset
 ************************************************************/
Set_Detect_Quiet:
	! set bit to remain in Detect.Quiet state
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g1, %g3
	ldx	[%g3], %g4
	mov	0x100, %g5
        orcc    %g5, %g4, %g5	! OR in bit 8 == 1
	stx	%g5, [%g3]
	ldx	[%g3], %g4
	
Set_RESET_ASSERT:
	! set RESET.ASSERT bit to 1
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_ADDR, %g1, %g2		! 0x680000
	ldx	[%g2], %g4
	or	%g4,0x001, %l0	! OR in the RESET.ASSERT bit
	
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g1, %g3		! 0x680000
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_ADDR, %g1, %g4	! 0x681018
	ldx	[%g4], %l4	! read the PEU Other Event Status Clear Reg
	stx	%l4, [%g4]	! clear the PEU Other Event Status Clear Reg
	mov	25, %l1		! loop timeout count
	setx    0x0000020000000200, %g1, %g5	! mask for Link Down Primary & Secondary events

	stx	%l0, [%g2]	! set  RESET.ASSERT 

! Wait for Link Down primary or secondary event before doing a Warm Reset
Wait4LinkDown:
	ldx	[%g2], %l2	! read the Link Control reg to see if RESET.ASSERT is still set
	ldx	[%g3 + 8], %l3	! read the PEU Status Reg
	ldx	[%g4], %l4	! read the PEU Other Event Status Clear Reg
        andcc   %l4, %g5, %l5
        bne	%xcc, do_WARM_RESET	
	nop
	dec	%l1
	brnz	%l1, Wait4LinkDown
	nop
	b       test_failed
	nop
	
/************************************************************
 Now do WARM RESET
 ************************************************************/
do_WARM_RESET:
	stx	%l4, [%g4]	! clear the PEU Other Event Status Clear Reg
	
#ifdef PCIE_USE_SSYS_RESET
        setx    RST_SSYS_RESET, %g1, %g5	! subsystem reset reg
        mov	RST_SSYS_RESET__DMU_PEU, %g7	! subsystem reset reg data
        stx     %g7, [%g5]			! Subsystem Reset
	
	mov	255, %l0			! loop timeout count
	
Wait4SsysReset:
	ldx     [%g5], %l7		!  check if reset bit has cleared
	brz	%l7, redo_link_training
	nop
	dec	%l0
	brnz	%l0, Wait4SsysReset
	nop
	ba	test_failed		! Subsystem reset should have completed
	nop
/************************************************************
 Now redo link training...
 ************************************************************/
redo_link_training:
        setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_ADDR, %g2, %g3
	ldx	[%g3], %g4
        mov     0x0010, %g5	! FAST LINK MODE, for simulation.
	or	%g4, %g5, %g5
        stx     %g5, [%g3]

	! clear bit 8, to not remain in Detect.Quiet state
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g1, %g3
	mov	0x001, %l4
	stx	%l4, [%g3]

	! enable bypass in IOMMU
	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
	setx	FIRE_DLC_MMU_CSR_A_CTL__BYPASS_EN, %g1, %g3
	stx	%g3, [%g2]

! wait for the "Link Up" status bit to get set in the PEU
! (this code copied from peu_init.h)
	
        setx    FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_ADDR, %g1, %g3
        ldx	[%g3], %l4
        stx	%l4, [%g3]		! clear any status bits that are set
        setx    FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_ADDR, %g1, %g4
	mov	255, %l0
        mov	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_EN_ERR__LUP_P, %l1

LinkTrainingLoop2:
        ldx	[%g3], %l4		! bit 8 is Link Up primary event
        ldx	[%g4], %l5		! bits 48:44 are the LTSSM state
        andcc   %l1, %l4, %l4
        bne     After_Warm_Reset
	nop

	dec	%l0
	brnz	%l0, LinkTrainingLoop2
	nop
	b       test_failed
	nop

#else
        setx    RST_RESET_GEN, %g1, %g5	! warm reset reg
        mov	RST_RESET_GEN__WMR_GEN, %g7	! warm reset reg data
	mov	25, %l0			! loop timeout count
	
        stx     %g7, [%g5]		! Warm Reset
        ldx     [%g5], %g7
	
Wait4WarmReset:
	dec	%l0
	brnz	%l0, Wait4WarmReset
	nop
	ba	test_failed		! Warm reset should have happened
	nop
#endif	

/*********************************************************************
 Do a couple of PIOs and DMAs to verify that the link is working fine.
 *********************************************************************/
After_Warm_Reset:
	nop
	nop
! $EV trig_pc_d(1, @VA(.MAIN.After_Warm_Reset)) -> EnablePCIeIgCmd ("DMARD", DMA_DATA_BYP_ADDR1, DMA_DATA_BYP_ADDR2, "64'h40", 1 )
After_Warm_Reset2:
	nop
	nop
! $EV trig_pc_d(1, @VA(.MAIN.After_Warm_Reset2)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR3, DMA_DATA_BYP_ADDR4, "64'h40", 1 )
	
	! Do PIOs to IO address space
	! load byte - all byte offsets within an octlet
	setx IO_RD_ADDR, %g1, %g2
	ldub [%g2 + 1*8 + 0], %l0
	ldub [%g2 + 2*8 + 1], %l1
	ldub [%g2 + 3*8 + 2], %l2
	ldub [%g2 + 4*8 + 3], %l3
	ldub [%g2 + 5*8 + 4], %l4
	ldub [%g2 + 6*8 + 5], %l5
	ldub [%g2 + 7*8 + 6], %l6
	ldub [%g2 + 8*8 + 7], %l7
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
************************************************************************/
	.align 64
test_entered:
	.xword 0


SECTION       .PIODATA DATA_VA=IO_RD_ADDR
attr_data {     
      Name = .PIODATA,
      hypervisor,
      compressimage
}

.data
	.xword 0xdeadbeefdeadbeef

	.xword 0x1101010101010101
	.xword 0x0122010101010101
	.xword 0x0101330101010101
	.xword 0x0101014401010101
	.xword 0x0101010155010101
	.xword 0x0101010101660101
	.xword 0x0101010101017701
	.xword 0x0101010101010188
	
	.xword 0x1122010101010101
	.xword 0x0101334401010101
	.xword 0x0101010155660101
	.xword 0x0101010101017788
	
	.xword 0x1122334401010101
	.xword 0x0101010155667788
	
	.xword 0xdeadbeefdeadbeef

/************************************************************************/

SECTION       .DMADATA DATA_VA=DMA_DATA_ADDR
attr_data {     
      Name = .DMADATA,
      hypervisor,
      compressimage
}

.data
	init_mem(0x0101010201030104, 256, 8, +, 0, +, 0x0004000400040004)
