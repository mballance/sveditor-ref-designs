/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeFireDeadlockScn2.s
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

! this will make the boot code load a new NPH credit value before link training
#define PEU_NPH_CREDIT 0x4

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

/*************************************************************************
 Thread 0 will 
 *************************************************************************/
th_main_0:
! enable interrupts & provide basic handler
#include "piu_rupt_enable.s"

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

StallCpl: nop
! $EV trig_pc_d(1,@VA(.MAIN.StallCpl)) -> EnablePCIeIgCmd("STALL_CPL", 0, 0, "64'h40",1)

! set the Traffic Class for all the DMA R&W TLPs to 3, so denali doesn't
! send them out of order
settc:	nop ! $EV trig_pc_d(1, @VA(.MAIN.settc)) -> EnablePCIeIgCmd ("SET_TC", 3, 0, 0, 1 )
	
	SYNC_THREAD_MAIN( test_failed, %g1, %g2, %g3 )

	!!! wait for threads 6 & 7 to issue enough PIO WRITES
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ECC_ADDR, %g1, %g7
	mov	100, %g2
	
delay_loop1:
	ldx	[%g7], %l7		! get Egress Credits Consumed 
	ldx	[%g7+0x20], %o7		! get Ingress Credits Received 
	dec	%g2
	cmp	%g2, 0
	bne	delay_loop1
	nop
	nop
	nop
	
	!!! 4. DMA Memory Read Requests E (4k byte total)
 	
#define DMARD_ADDR_1 mpeval(0x00800000,16,16)
DMARD1: nop; nop;nop; nop;nop; nop;
! $EV trig_pc_d(1,@VA(.MAIN.DMARD1)) -> EnablePCIeIgCmd("DMARD", DMARD_ADDR_1, DMARD_ADDR_1, "64'h1000",1)

	!!! 5. DMA Memory Read Request F (any size)
 	
#define DMARD_ADDR_2 mpeval(0x00801000,16,16)
DMARD2: nop; nop;nop; nop;nop; nop;
! $EV trig_pc_d(1,@VA(.MAIN.DMARD2)) -> EnablePCIeIgCmd("DMARD", DMARD_ADDR_2, DMARD_ADDR_2, "64'h1000",1)

	mov	50, %g2
delay_loop2:
	ldx	[%g7], %l7		! get Egress Credits Consumed 
	ldx	[%g7+0x20], %o7		! get Ingress Credits Received 
	dec	%g2
	cmp	%g2, 0
	bne	delay_loop2
	nop
	nop
	nop

	!!! 6. 61 DMA Memory Write Requests G (each 64 bytes)
	!!! 7. DMA Memory Write Request H (any size)
		
#define DMA_ADDR_1 mpeval(0x00800000,16,16)
#define DMA_ADDR_2 mpeval(0x00900000,16,16)

dmawr:	nop
! $EV trig_pc_d(1,@VA(.MAIN.dmawr)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_1, DMA_ADDR_2, "64'h40", 3e, *, * )
	mov	10, %g2
	
dmawr_loop:
	ldx	[%g7], %l7		! get Egress Credits Consumed 
	ldx	[%g7+0x20], %o7		! get Ingress Credits Received 
	dec	%g2
	cmp	%g2, 0
	bne	dmawr_loop
	nop
	nop
	nop
		
	!!! 8. CplD for Memory Read A/B/C/D/E
	
UnstallCpl: nop
! $EV trig_pc_d(1,@VA(.MAIN.UnstallCpl)) -> EnablePCIeIgCmd("UNSTALL_CPL", 0, 0, "64'h40",1)
		
	!!! wait for the completions
		
	mov	100, %g2
delay_loop3:
	ldx	[%g7], %l7		! get Egress Credits Consumed 
	ldx	[%g7+0x20], %o7		! get Ingress Credits Received 
	dec	%g2
	cmp	%g2, 0
	bne	delay_loop3
	nop
	nop
	nop

	!!! Wait for the INTA following a 0 length DMA Read to make sure all is okay
	
INTA: 
! $EV trig_pc_d(1,@VA(.MAIN.INTA)) -> EnablePCIeIgCmd("DMARD_INTA", DMA_ADDR_2, DMA_ADDR_2, "64'h0",1)			
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_ADDR, %g1, %g2
	mov	100, %g3		! loop count
	mov	8, %g4			! INTA asserted bit
	
inta_wait:
	ldx	[%g2], %g5
	cmp     %g4,%g5
	be	got_inta
	
	dec	%g3
	cmp	%g3, 0
	bne	inta_wait
	nop

test_failed0:
! $EV trig_pc_d(1, @VA(.MAIN.test_failed0)) -> printf("\n ERROR: timeout while waiting for INTA\n")
	EXIT_BAD
	nop

got_inta:
	!!! write to "thread done" location
	setx	thread_done, %g1, %g2
	mov	0xff, %g3
	stb	%g3, [%g2 + %o1]
	
	!!! check that all threads wrote to "thread done" location
	setx	0xffffffffffffffff, %g1, %g3
	ldx	[%g2], %g4
	cmp	%g3, %g4
	be	test_passed0
	nop
	
test_failed1:
! $EV trig_pc_d(1, @VA(.MAIN.test_failed1)) -> printf("\n ERROR: not all threads are complete\n")
	EXIT_BAD
	nop


test_passed0:
	EXIT_GOOD
	nop
	

/*************************************************************************
 Threads 1 - 5 will issue th 5 PIO Memory Read requests, that will stall
 *************************************************************************/
th_main_1:
th_main_2:
th_main_3:
th_main_4:
th_main_5:
        SYNC_THREAD_OTHER( %o1,%g1,%g2 )

	!!! 1. Do five Memory Read requests A
	
	setx	MEM32_RD_ADDR, %g1, %g2
	sllx	%o1, 4, %l1
	or	%l1, %g2, %g2
	ldx	[%g2], %g3		! this PIO read will stall the
					! thread until the read returns
	!!! write to "thread done" location
	setx	thread_done, %g1, %g2
	mov	0xff, %g3
	stb	%g3, [%g2 + %o1]
	
	ba	test_passed
	nop
	
/*************************************************************************
 Threads 6 - 7 will issue the 35 PIO Memory Write requests. These might 
 stall if one of the pio modes (fixes) is enabled.
 *************************************************************************/
th_main_6:
th_main_7:
        SYNC_THREAD_OTHER( %o1,%g1,%g2 )

	!!! 2. the 35 Memory write requests C0-C34
		
	setx	MEM32_WR_ADDR, %g1, %g2
	sllx	%o1, 16, %l1
	or	%l1, %g2, %g2

	setx	0x2121212121212121, %g1, %g3
	stx	%g3, [%g2] 

	setx	0x2222222222222222, %g1, %g3
	stx	%g3, [%g2+8] 

	setx	0x2323232323232323, %g1, %g3
	stx	%g3, [%g2+16] 

	setx	0x2424242424242424, %g1, %g3
	stx	%g3, [%g2+24] 

	setx	0x2525252525252525, %g1, %g3
	stx	%g3, [%g2+32] 

	setx	0x2626262626262626, %g1, %g3
	stx	%g3, [%g2+40]

	setx	0x2727272727272727, %g1, %g3
	stx	%g3, [%g2+48] 

	setx	0x2828282828282828, %g1, %g3
	stx	%g3, [%g2+56] 

	setx	0x2929292929292929, %g1, %g3
	stx	%g3, [%g2+64] 

	setx	0x2a2a2a2a2a2a2a2a, %g1, %g3
	stx	%g3, [%g2+72] 

	setx	0x2b2b2b2b2b2b2b2b, %g1, %g3
	stx	%g3, [%g2+40]

	setx	0x2c2c2c2c2c2c2c2c, %g1, %g3
	stx	%g3, [%g2+48] 

	setx	0x2d2d2d2d2d2d2d2d, %g1, %g3
	stx	%g3, [%g2+56] 

	setx	0x2e2e2e2e2e2e2e2e, %g1, %g3
	stx	%g3, [%g2+64] 

	setx	0x2f2f2f2f2f2f2f2f, %g1, %g3
	stx	%g3, [%g2+72] 

	setx	0x3131313131313131, %g1, %g3
	stx	%g3, [%g2+80]

	setx	0x3232323232323232, %g1, %g3
	stx	%g3, [%g2+88]

	setx	0x3333333333333333, %g1, %g3
	stx	%g3, [%g2+96]

	setx	0x3434343434343434, %g1, %g3
	stx	%g3, [%g2+104]

	!!! write to "thread done" location
	setx	thread_done, %g1, %g2
	mov	0xff, %g3
	stb	%g3, [%g2 + %o1]
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD
	
/************************************************************************
   Test case data start
 ***********************************************************************/
	.align 64
thread_done:
        .byte   0x0             ! done thread 0
        .byte   0x0             ! done thread 1
        .byte   0x0             ! done thread 2
        .byte   0x0             ! done thread 3
        .byte   0x0             ! done thread 4
        .byte   0x0             ! done thread 5
        .byte   0x0             ! done thread 6
        .byte   0x0             ! done thread 7



SECTION       .DATA DATA_VA=MEM32_RD_ADDR
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
	
data0:	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
data1:	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
data2:	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
data3:	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
data4:	.xword 0x5051525354555657
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
	init_mem(0x0101010201030104, 1024, 8, +, 0, +, 0x0004000400040004)

	
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
	init_mem(0x0000000000800003, 32, 8, +, 0, +, 0x0000000000010000)
	
/************************************************************************/
