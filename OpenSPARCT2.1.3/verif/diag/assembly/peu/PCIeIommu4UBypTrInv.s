/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeIommu4UBypTrInv.s
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

#define ENABLE_INTR0x60 1

#define INTR0x60_MONDO_IV 63

#define INTR0x60_MONDO_20_V 1
#define INTR0x60_MONDO_20_THREAD 0
#define INTR0x60_MONDO_20_CNTRL 0


#define INTR0x60_INTA_EXTRA_HANDLER \
    setx intr_count, %g4, %g3; \
    add  %g3, %g1, %g3; \
    ldub [%g3], %g4; \
    inc  %g4; \
    stb  %g4, [%g3]

#include "interrupt0x60_defines.h"

#include "hboot.s"
#include "peu_defines.h"
#include "ncu_defines.h"
#include "cmp_macros.h"

#include "interrupt0x60_handler.s"

#define MEM32_WR_ADDR 		   mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)

#define DMA_DATA_ADDR		   0x00800000

#define IOMMU_TTE_ADDR		   0x40000000

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
!#include "piu_rupt_enable.s"

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
	
! Trigger some DMA Reads that will create IOMMU tlb entries
	
#define DMA_ADDR_1 mpeval(0x00800000,16,16)
DMA1: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA1)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_1, DMA_ADDR_1, "64'h40",1)
#define DMA_ADDR_2 mpeval(0x00810000,16,16)
DMA2: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA2)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_2, DMA_ADDR_2, "64'h40",1)
#define DMA_ADDR_3 mpeval(0x00820000,16,16)
DMA3: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA3)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_3, DMA_ADDR_3, "64'h40",1)
#define DMA_ADDR_4 mpeval(0x00830000,16,16)
DMA4: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA4)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_4, DMA_ADDR_4, "64'h40",1)
#define DMA_ADDR_5 mpeval(0x00840000,16,16)
DMA5: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA5)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_5, DMA_ADDR_5, "64'h40",1)
#define DMA_ADDR_6 mpeval(0x00850000,16,16)
DMA6: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA6)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_6, DMA_ADDR_6, "64'h40",1)
#define DMA_ADDR_7 mpeval(0x00860000,16,16)
DMA7: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA7)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_7, DMA_ADDR_7, "64'h40",1)
	
#define DMA_ADDR_8  mpeval(0x00870000,16,16)
#define DMA_ADDR_8d  mpeval(0x00870000)
DMA8: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA8)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_8, DMA_ADDR_8, "64'h40",1)

INTA_ASSERT_Evnt: nop
! $EV trig_pc_d(1, @VA(.MAIN.INTA_ASSERT_Evnt)) -> EnablePCIeIgCmd ("INTA", 0, 0, "ASSERT", 1 )

intr_wait_1:
    mov	 1, %g4
    setx intr_count, %l1, %g3
    best_set_reg(0x200, %l1, %g2)		! timeout count

intr_wait_loop_top_1:
    ldub  [%g3], %g5
    cmp  %g5, %g4
    be   INTA_DEASSERT_Evnt
    dec  %g2

    cmp  %g2, 0
    bne  intr_wait_loop_top_1
    nop

intr_timeout1:
!$EV trig_pc_d(1, @VA(.MAIN.intr_timeout1)) -> printf("ERROR: Timeout waiting for interrupt 1",*,1)
    EXIT_BAD
	

INTA_DEASSERT_Evnt: nop
! $EV trig_pc_d(1, @VA(.MAIN.INTA_DEASSERT_Evnt)) -> EnablePCIeIgCmd ("INTA", 0, 0, "DEASSERT", 1 )

! the last DMA should be complete

	setx	DMA_ADDR_8d, %g1, %g2		! DMA tgt address
	ldx	[%g2], %g5			! get the last dma data area
	brnz	%g5, invalidate_the_TTE_in_memory
	nop
	b	test_failed
	nop
	
! now clear the VALID bit of the TTEs in memory

invalidate_the_TTE_in_memory:
	!setx	iommu_tte_addr, %g1, %g2	! TTE address
	
	setx	mpeval(IOMMU_TTE_ADDR+(8*0x80)), %g1, %g2 ! get the TTE address
	
	stb	%g0, [%g2 + 7]			! clear the last byte of the TTE
	add	%g2, 8, %g2			! address of next TTE
	stb	%g0, [%g2 + 7]			! clear the last byte of the TTE
	add	%g2, 8, %g2			! address of next TTE
	stb	%g0, [%g2 + 7]			! clear the last byte of the TTE
	add	%g2, 8, %g2			! address of next TTE
	stb	%g0, [%g2 + 7]			! clear the last byte of the TTE
	add	%g2, 8, %g2			! address of next TTE
	stb	%g0, [%g2 + 7]			! clear the last byte of the TTE
	add	%g2, 8, %g2			! address of next TTE
	stb	%g0, [%g2 + 7]			! clear the last byte of the TTE
	add	%g2, 8, %g2			! address of next TTE
	stb	%g0, [%g2 + 7]			! clear the last byte of the TTE
	add	%g2, 8, %g2			! address of next TTE
	stb	%g0, [%g2 + 7]			! clear the last byte of the TTE
	membar	0x40

! now do some more DMAs using the same TTEs
	
DMA65: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA65) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_1, DMA_ADDR_1, "64'h40",1)
DMA66: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA66) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_2, DMA_ADDR_2, "64'h40",1)
DMA67: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA67) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_3, DMA_ADDR_3, "64'h40",1)
DMA68: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA68) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_4, DMA_ADDR_4, "64'h40",1)
DMA69: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA69) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_5, DMA_ADDR_5, "64'h40",1)
DMA70: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA70) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_6, DMA_ADDR_6, "64'h40",1)
DMA71: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA71) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_7, DMA_ADDR_7, "64'h40",1)
DMA72: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA72) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_8, DMA_ADDR_8, "64'h40",1)
#define DMA_ADDR_9  mpeval(0x00880000,16,16)
#define DMA_ADDR_9d  mpeval(0x00880000)
DMA9: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA8)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_9, DMA_ADDR_9, "64'h40",1)

INTA_ASSERT_Evnt2: nop
! $EV trig_pc_d(1, @VA(.MAIN.INTA_ASSERT_Evnt2)) -> EnablePCIeIgCmd ("INTA", 0, 0, "ASSERT", 1)

intr_wait_2:
    mov	 2, %g4
    setx intr_count, %l1, %g3
    best_set_reg(0x200, %l1, %g2)		! timeout count

intr_wait_loop_top_2:
    ldub  [%g3], %g5
    cmp  %g5, %g4
    be   INTA_DEASSERT_Evnt2
    dec  %g2

    cmp  %g2, 0
    bne  intr_wait_loop_top_2
    nop

intr_timeout2:
    !$EV trig_pc_d(1, @VA(.MAIN.intr_timeout2)) -> printf("ERROR: Timeout waiting for interrupt 2",*,1)
    EXIT_BAD
	

INTA_DEASSERT_Evnt2: nop
! $EV trig_pc_d(1, @VA(.MAIN.INTA_DEASSERT_Evnt2)) -> EnablePCIeIgCmd ("INTA", 0, 0, "DEASSERT",1 )

! the last DMA should be complete

	setx	DMA_ADDR_9d, %g1, %g2		! DMA tgt address
	ldx	[%g2], %g5			! get the last dma data area
	brnz	%g5, test_passed
	nop
	b	test_failed
	nop


/************************************************************************
   Threads 1 - 7 will issue the IOMMU INVALIDATES
************************************************************************/
th_main_1:
	setx	th_data_1, %g1, %g2
	b	th_1to7_join
	nop
th_main_2:
	setx	th_data_2, %g1, %g2
	b	th_1to7_join
	nop
th_main_3:
	setx	th_data_3, %g1, %g2
	b	th_1to7_join
	nop
th_main_4:
	setx	th_data_4, %g1, %g2
	b	th_1to7_join
	nop
th_main_5:
	setx	th_data_5, %g1, %g2
	b	th_1to7_join
	nop
th_main_6:
	setx	th_data_6, %g1, %g2
	b	th_1to7_join
	nop
th_main_7:
	setx	th_data_7, %g1, %g2
	b	th_1to7_join
	nop

th_1to7_join:
	set	90, %g3		! loop 90 times
	setx	NCU_IOMMU_INVALIDATE_REG_ADDR, %g1, %g4		! NCU register address

iommu_invalidate_loop:
	ldx	[%g2], %g5		! get an address
	stx	%g5, [%g4]		! issue an IOMMU INVALIDATE 
	add	%g2, 8, %g2		! increment data address
	
	dec	%g3			! decrement counter
	brnz	%g3, iommu_invalidate_loop	! loop if not zero
	nop
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD
/************************************************************************
   Test case data start
************************************************************************/

.align  1024
.data
user_data_start:
intr_expect:
        .byte   0x1             ! expected interrupt count for thread 0
        .byte   0x0             ! expected interrupt count for thread 1
        .byte   0x1             ! expected interrupt count for thread 2
        .byte   0x0             ! expected interrupt count for thread 3
        .byte   0x1             ! expected interrupt count for thread 4
        .byte   0x0             ! expected interrupt count for thread 5
        .byte   0x1             ! expected interrupt count for thread 6
        .byte   0x0             ! expected interrupt count for thread 7
user_data_end:

/************************************************************************
   Test case INVALIDATE data start.  We don't want any values to match
   the IOMMU_TTE_ADDR being used, which is IOMMU_TTE_ADDR + 0x80
************************************************************************/
	.align 64
th_data_1:	
	init_mem(IOMMU_TTE_ADDR+0x0040, 64, 8, +, 0, +, 0x0004004004004040)
	
th_data_2:	
	init_mem(IOMMU_TTE_ADDR+0x0080, 64, 8, +, 0, +, 0x0000800800808080)
	
th_data_3:	
	init_mem(IOMMU_TTE_ADDR+0x0100, 64, 8, +, 0, +, 0x0000100100101101)
	
th_data_4:	
	init_mem(IOMMU_TTE_ADDR+0x0200, 64, 8, +, 0, +, 0x0002020202020202)
	
th_data_5:	
	init_mem(IOMMU_TTE_ADDR+0x0800, 64, 8, +, 0, +, 0x0004040404040404)
	
th_data_6:	
	init_mem(IOMMU_TTE_ADDR+0x1000, 64, 8, +, 0, +, 0x0008080808080808)
	
th_data_7:	
	init_mem(IOMMU_TTE_ADDR+0x2000, 64, 8, +, 0, +, 0x0001010101001010)
	
	

/************************************************************************
   Test case DMA data start.
************************************************************************/

SECTION       .DATA DATA_VA=DMA_DATA_ADDR
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}
.data
	init_mem(0x0101010201030104, 8, 8, +, 0, +, 0x0004000400040004)
.skip 0x10000 - 64
	init_mem(0x0201020202030204, 8, 8, +, 0, +, 0x0004000400040004)
.skip 0x10000 - 64
	init_mem(0x0301030203030304, 8, 8, +, 0, +, 0x0004000400040004)
.skip 0x10000 - 64
	init_mem(0x0401040204030404, 8, 8, +, 0, +, 0x0004000400040004)
.skip 0x10000 - 64
	init_mem(0x0501050205030504, 8, 8, +, 0, +, 0x0004000400040004)
.skip 0x10000 - 64
	init_mem(0x0601060206030604, 8, 8, +, 0, +, 0x0004000400040004)
.skip 0x10000 - 64
	init_mem(0x0701070207030704, 8, 8, +, 0, +, 0x0004000400040004)

.skip 0x10000 - 64
	!! test expects this to be zero until DMA writes it
	init_mem(0x0000000000000000, 8, 8, +, 0, +, 0x0000000000000000)

.skip 0x10000 - 64
	!! test expects this to be zero until DMA writes it
	init_mem(0x0000000000000000, 8, 8, +, 0, +, 0x0000000000000000)


	
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
	
	!!! we only need 8+1 TTEs for this test
iommu_tte_addr:	
	init_mem(0x0000000000800003, 9, 8, +, 0, +, 0x0000000000010000)
	
/************************************************************************/

SECTION .HTRAPS
.data
.global intr_count
intr_count:
        .byte   0x0             ! interrupt count for thread 0
        .byte   0x0             ! interrupt count for thread 1
        .byte   0x0             ! interrupt count for thread 2
        .byte   0x0             ! interrupt count for thread 3
        .byte   0x0             ! interrupt count for thread 4
        .byte   0x0             ! interrupt count for thread 5
        .byte   0x0             ! interrupt count for thread 6
        .byte   0x0             ! interrupt count for thread 7

.end

/************************************************************************/
