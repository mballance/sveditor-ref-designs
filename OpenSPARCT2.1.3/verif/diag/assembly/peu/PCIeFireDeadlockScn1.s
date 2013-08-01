/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeFireDeadlockScn1.s
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
#define ENABLE_PCIE_MPS_256
#define MAIN_PAGE_HV_ALSO

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
        call    my_trap_code; \
        nop; \
        retry; \
        nop; 

#include "hboot.s"
#include "peu_defines.h"
#include "ncu_defines.h"
#include "cmp_macros.h"

#define MEM32_RD_ADDR		mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)
#define MEM32_WR_ADDR 		mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)
#define CFG1_WR_ADDR		mpeval((N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA) | CFG1_ACCESS_PA)

#define DMA_DATA_ADDR		0x00800000

#define IOMMU_TTE_ADDR		0x40000000

! Bit 8 = Page Size: 0=8KB, 1=64KB;  Bits 3:0 = TSB Table size:	6=64k entries 
#define MMU_TSB_CNTRL_REG_DATA	   mpeval(IOMMU_TTE_ADDR | 0x100 | 6)

#define	NCU_IOMMU_INVALIDATE_REG_ADDR	0x8000002030

/************************************************************************
   Test case code start
 ************************************************************************/
SECTION .MAIN
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

th_fork(th_main, %l0)

th_main_0:
! enable interrupts & provide basic handler
#include "piu_rupt_enable.s"

StallCpl: nop
! $EV trig_pc_d(1,@VA(.MAIN.StallCpl)) -> EnablePCIeIgCmd("STALL_CPL", 0, 0, "64'h40",1)

! set the Traffic Class for all the DMA R&W TLPs to 5, so denali doesn't
! send them out of order
settc:	nop ! $EV trig_pc_d(1, @VA(.MAIN.settc)) -> EnablePCIeIgCmd ("SET_TC", 5, 0, 0, 1 )

	SYNC_THREAD_MAIN( test_failed, %g1, %g2, %g3 )

	!!! 1. Do a Memory Read request A
	
	setx	MEM32_RD_ADDR, %g1, %g2
	ldx	[%g2], %l1		! completion on this PIO READ will stall

	ldx	[%g2+8], %l2

	ldx	[%g2+16],%l3

	ldx	[%g2+24],%l4

	ldx	[%g2+32],%l5

	ba	test_passed
	nop
	
/************************************************************************
   Thread 1 will issue the PIO Memory Write requests
 ************************************************************************/
th_main_1:

! enable SUN4U translation in the IOMMU
	
	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
	setx	0x00301, %g1, %g3	! 9:8 11 = Cache enabled, 0: 1 = translation enabled
	stx	%g3, [%g2]
	ldx	[%g2], %g3
	
! load address of the TSB table, and the page size (64KB)
	
	setx	FIRE_DLC_MMU_CSR_A_TSB_ADDR, %g1, %g2
	setx	MMU_TSB_CNTRL_REG_DATA, %g1, %g3
	stx	%g3, [%g2]
	ldx	[%g2], %g3

	SYNC_THREAD_OTHER( %o1,%g1,%g2 )

	!!! 2. Cfg Write Request B
	
	mov	5, %g2
delay_loop:			! give thread 0 a chance to do the memory read pio
	dec	%g2
	cmp	%g2, 0
	bne	delay_loop
	nop

	setx	CFG1_WR_ADDR, %g1, %g2
	setx	0x11223344, %g1, %l1
	stw	%l1, [%g2]		! this PIO write will stall due to NPWR_EN

	!!! 3. 5 of the 35 Memory write requests C0-C34
	
	setx	MEM32_RD_ADDR, %g1, %g2
	sll	%l0, 24, %l1
	or	%l1, %g2, %g2

	setx	0x1111111111111111, %g1, %g3
	stx	%g3, [%g2] 

	setx	0x1212121212121212, %g1, %g3
	stx	%g3, [%g2+8]
	
	setx	0x1313131313131313, %g1, %g3
	stx	%g3, [%g2+16] 

	setx	0x1414141414141414, %g1, %g3
	stx	%g3, [%g2+24] 

	setx	0x1515151515151515, %g1, %g3
	stx	%g3, [%g2+32] 

	mov	30, %g2
delay_loop0:
	dec	%g2
	cmp	%g2, 0
	bne	delay_loop0
	nop;nop;nop;nop
	
	!!! 4. DMA Memory Read Requests E (4k byte total)
 	
#define DMARD_ADDR_1 mpeval(0x00800000,16,16)
DMARD1: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMARD1)) -> EnablePCIeIgCmd("DMARD", DMARD_ADDR_1, DMARD_ADDR_1, "64'h1000",1)

	!!! 5. DMA Memory Read Request F (any size)
 	
#define DMARD_ADDR_2 mpeval(0x00801000,16,16)
DMARD2: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMARD2)) -> EnablePCIeIgCmd("DMARD_INTA", DMARD_ADDR_2, DMARD_ADDR_2, "64'h100",1)

	mov	200, %g2
delay_loop00:			! give denali a chance to send the dma reads & L2 to respond
	dec	%g2
	cmp	%g2, 0
	bne	delay_loop00
	nop;nop;nop;nop;
	nop;nop;nop;nop;

	!!! 6. 61 DMA Memory Write Requests G (each 64 bytes)
	!!! 7. DMA Memory Write Requests H (any size)
		
#define DMA_ADDR_1 mpeval(0x00800000,16,16)
#define DMA_ADDR_2 mpeval(0x00900000,16,16)
DMAWR: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMAWR)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_1, DMA_ADDR_2, "64'h40", 3e )

	mov	200, %g2
delay_loop000:			! give denali a chance to send the dma writes
	dec	%g2
	cmp	%g2, 0
	bne	delay_loop000
	nop;nop;nop;nop
	nop;nop;nop;nop;
	
	!!! 8. CplD for Memory Read A
	!!! 9. Cpl for Cfg Write B
UnstallCpl: nop
! $EV trig_pc_d(1,@VA(.MAIN.UnstallCpl)) -> EnablePCIeIgCmd("UNSTALL_CPL", 0, 0, "64'h40",1)
		
	!!! Wait for the INTA following the last DMA Read completion
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_ADDR, %g1, %g2
	mov	1000, %g3		! loop count
	mov	8, %g4			! INTA asserted bit
	
delay_loop1:
	ldx	[%g2], %g5
	cmp     %g4,%g5
	be	test_passed
	
	dec	%g3
	cmp	%g3, 0
	bne	delay_loop1
	nop

	ba	test_failed
	nop
	
/***********************************************************************
   Threads 2 - 7 go here
 ***********************************************************************/
th_main_2:
th_main_3:
th_main_4:
th_main_5:
th_main_6:
th_main_7:
        SYNC_THREAD_OTHER( %o1,%g1,%g2 )

	! short delay to allow threads 0 and 1 to do thier stuff

	mov	10, %g2
delay_loop2:
	dec	%g2
	cmp	%g2, 0
	bne	delay_loop2
	nop
	
th_1to7_join:	
	setx	MEM32_WR_ADDR, %g1, %g2
	sll	%l0, 24, %l1
	or	%l1, %g2, %g2

	!!! 3. 5 of the 35 Memory write requests C0-C34
	
	setx	0x2121212121212121, %g1, %g3
	stx	%g3, [%g2] 

	setx	0x2222222222222222, %g1, %g3
	stx	%g3, [%g2+8] 

	setx	0x2323232323232323, %g1, %g3
	stx	%g3, [%g2+16] 

	setx	0x2424242424242424, %g1, %g3
	stx	%g3, [%g2+24] 

	setx	0x3535353535353535, %g1, %g3
	stx	%g3, [%g2+32] 

	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD
	
/***********************************************************************
   Test case data start
 ***********************************************************************/

SECTION       .DATA DATA_VA=MEM32_RD_ADDR
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}
.data	
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0x5051525354555657
	.xword 0x58595a5b5c5d5e5f

/************************************************************************
   Test case DMA data start.
************************************************************************/

SECTION       .DMADATA DATA_VA=DMA_DATA_ADDR
attr_data {     
      Name = .DMADATA,
      hypervisor,
      compressimage
}
.data
	init_mem(0x0101010201030104, 512, 8, +, 0, +, 0x0004000400040004)

	
/************************************************************************
   IOMMU TTE start
	TTE Format:
63:	48 DEV KEY	- set to 0
47:	39 reserved	- set to 0
38:	13 DATA PA	- set to VA for VA=RA
12:	7  DATA_SOFT	- set to 0
6:	5  reserved	- set to 0
5:	3  FNM MASK	- set to 0
2:	2  KEY VALID	- set to 0
1:	1  DATA_W	- set to 1
0:	0  DATA_V	- set to 1
************************************************************************/

SECTION       .DATA2 DATA_VA=IOMMU_TTE_ADDR
attr_data {     
      Name = .DATA2,
      hypervisor,
      compressimage
}

.data
	.skip 8*0x80
	
iommu_tte_addr:	
	init_mem(0x0000000000800003, 256, 8, +, 0, +, 0x0000000000010000)
	
/************************************************************************/
