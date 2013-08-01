/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeEgrDPeDrainState.s
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
#ifndef PCIE_USE_SSYS_RESET
#define RESET_STAT_CHECK
#define RESET_CHECK_REG
#define H_HT0_Hw_Corrected_Error_0x63 hw_corrected_error_handler
#endif

#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
	inc     %l4; \
	done;

#include "hboot.s"
#include "peu_defines.h"
#include "dmu_peu_regs.h"
#include "rst_defines.h"

#define MEM_WR_ADDR mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)
#define DMA_DATA_ADDR   	0x0000000123456000
#define DMARD_ADDR1		0xfffc000123456000
#define DMARD_ADDR2		0xfffc000123457000
#define DMARD_ADDR3		0xfffc000123458000
#define DMARD_ADDR4		0xfffc000123459000

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
#ifdef PCIE_USE_SSYS_RESET
	brnz	%g3, test_failed	! test should only be one-pass
#else
	brnz	%g3, After_Warm_Reset
#endif	
	nop

! First time thru, Store a non-zero value there 
	dec	%g3
	stx	%g3, [%g2]
	
/************************************************************
 make sure the detect.quiet bit is set
 ************************************************************/
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g1, %g3
	ldx	[%g3], %g4
	mov	0x100, %g5
        orcc    %g5, %g4, %g5	! OR in bit 8 == 1
	stx	%g5, [%g3]
	ldx	[%g3], %g4
	
/************************************************************
 Fire off some PIOs and DMA Reads, then bring down the link.
 ************************************************************/
Start_PIOs_and_DMARDs:
	setx	MEM_WR_ADDR, %g1, %g2
	setx	0x3335373992828384, %g1, %l0
	stb	%l0, [%g2]
	sth	%l0, [%g2 + 4]
	stw	%l0, [%g2 + 8]
	ldx	[%g2], %l1

	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_ADDR, %g1, %g3
        ldx	[%g3], %l3
        stx	%l3, [%g3]	! clear any OE status bits

/***************************************************************
 Write the EDI_PAR and EDI_TRG fields of the ILU DIAGNOSTIC CSR
 ***************************************************************/
	nop; nop; nop; nop; 
! This user event will force the next PIO to NOT to call expectPCIE().
! $EV trig_pc_d(1,@VA(.MAIN.Bring_down_the_link)) -> EnablePCIeIgCmd("PIO_NULLIFY",0,0,0,1)
Bring_down_the_link:
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_DIAGNOS_ADDR, %g1, %g4
	ldx	[%g4], %l3
	best_set_reg(0x00001020, %g1, %l4) ! set bits 12 & 5 (EDI_PAR & EDI_TRG)
	or	%l3, %l4, %l3
	stx	%l3, [%g4]		   ! set the EDP error injection triggers

	
	stx	%l0, [%g2 + 16]	! PIO write ===> should get the EDP error
	

	! now wait for "Egress Data Parity Error (EDP)" primary or secondary status to be set
	mov	10, %l0
        setx	0x0000200000002000, %g1, %l1	! mask for EDP Primary and Secondary Events
Wait_for_EDP:
        ldx	[%g3], %l3
        andcc   %l1, %l3, %l4
        bne     %xcc, Check_drain_state
	nop
	dec	%l0
	brnz	%l0, Wait_for_EDP
	nop
	b       test_failed
	nop
	
/************************************************************
 check that drain.state bit is set in the PEU Status Register
 ************************************************************/
Check_drain_state:
	
! This user event will force the next PIO to NOT to call expectPCIE().
! $EV trig_pc_d(1,@VA(.MAIN.Check_drain_state)) -> EnablePCIeIgCmd("PIO_NOEXP",0,0,0,1)
	
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_STS_ADDR, %g1, %g3
	ldx	[%g3], %g4
	mov	0x100, %g5
	andcc   %g4, %g5, %l0
	bz	test_failed		! branch if drain state is not set
	nop	
	
	! issue PIO read request(s) - these should complete with Bus Error
	mov	0, %l4
	setx	MEM_WR_ADDR, %g1, %g4
PioBusErr:
	ldx	[%g4], %l3		! ==> this should get a bus error

	dec	%l4			! <== only one interrupt expected
	brnz    %l4, test_failed
	
	! insure that no outstanding DMA read requests are outstanding
	! by checking that there are no entries on the Transaction Scoreboard
	setx	FIRE_DLC_TSB_CSR_A_TSB_STS_ADDR, %g1, %g5
	mov	0, %l0
	dec	%l0
	mov	0x01, %l1
	xor	%l1, %l0, %l1
Wait_for_dma_read_clear:
	ldx	[%g5], %l4
	andcc	%l4, %l1, %l2
	bnz     Wait_for_dma_read_clear
	
	! clear the link down bit
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_ADDR, %g1, %g2
        ldx	[%g2], %l1
	stx	%l1, [%g2]		! RW1C
        ldx	[%g2], %l1
	brnz	%l1, test_failed	! branch if link down is not cleared
	nop
	
	! clear the drain bit - its also a RW1C bit
	mov	0x100, %g5
	stx	%g5, [%g3]		! RW1C
	ldx	[%g3], %g4
	andcc   %g4, %g5, %g4
	bnz	test_failed		! branch if drain state is not cleared
	nop
	
/************************************************************
 do the warm reset
 ************************************************************/
do_WARM_RESET:
! xxx trig_pc_d(1,@VA(.MAIN.do_WARM_RESET)) -> EnablePCIeIgCmd("SOFTRESET",0,0,0,1)	
#ifdef PCIE_USE_SSYS_RESET
        setx    RST_SSYS_RESET, %g1, %g5	! subsystem reset reg
        mov	RST_SSYS_RESET__DMU_PEU, %g7	! subsystem reset reg data
        stx     %g7, [%g5]			! Subsystem Reset
	
	mov	10, %l0				! loop timeout count
	
Wait4SsysReset:
	ldx     [%g5], %l7		! check if reset bit has cleared
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

/********************************************************************
 Do a couple of PIOs and DMAs to verify that the PCIe link is working.
 ********************************************************************/
After_Warm_Reset:
	nop
	! clear any error bits from from the DLPL Status reg
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_ADDR, %g1, %g6
	ldx	[%g6], %l7
	stx	%l7, [%g6]		! RW1C
	ldx	[%g6], %l7
	brnz	%l7, test_failed	! branch if it is not cleared
	nop
	
DmaRd5:	nop
! $EV trig_pc_d(1, @VA(.MAIN.DmaRd5)) -> EnablePCIeIgCmd("DMARD",DMARD_ADDR2,DMARD_ADDR2,"64'h40",1)
	setx	MEM_WR_ADDR, %g1, %g5
	mov	0, %l4
	stx	%g3, [%g5]		! 3 PIO Writes
	stx	%g4, [%g5+8]
	stx	%g5, [%g5+16]
DmaRd6:	nop
! $EV trig_pc_d(1, @VA(.MAIN.DmaRd6)) -> EnablePCIeIgCmd("DMARD",DMARD_ADDR3,DMARD_ADDR3,"64'h40",1)
	ldx	[%g5], %l0		! 3 PIO Reads
	ldx	[%g5+8], %l1
	ldx	[%g5+16], %l2
	
DmaRd7:	nop
! $EV trig_pc_d(1, @VA(.MAIN.DmaRd7)) -> EnablePCIeIgCmd("DMARD",DMARD_ADDR4,DMARD_ADDR4,"64'h40",1)
        setx    FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_ADDR, %g1, %g3
        ldx	[%g3], %l5		! bit 8 is Link Up primary event
	
        setx    FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_ADDR, %g1, %g4
        ldx	[%g4], %l6		! bits 48:44 are the LTSSM state
	
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_EVENT_ERR_STS_CLR_RW1C_ALIAS_ADDR, %g1, %g6
	ldx	[%g6], %l7		! dlpl status
	
	brnz    %l4, test_failed	! no interrupts were expected
	nop
	nop
		
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


SECTION       .DATA DATA_VA=DMA_DATA_ADDR
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}
.data
	init_mem(0x0101010201030104, 256, 8, +, 0, +, 0x0004000400040004)
/************************************************************************/
