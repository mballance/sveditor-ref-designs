/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeIommu4VBadTr2.s
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
#define ENABLE_PCIE_MPS_512
#define MAIN_PAGE_HV_ALSO

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
        call iommu_trap_code; \
        nop; \
        retry; \
        nop; 

#include "hboot.s"
#include "peu_defines.h"
#include "ncu_defines.h"

#define MEM32_WR_ADDR 		   mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)

#define DMA_DATA_ADDR		   0x000000000

#define IOMMU_TTE_ADDR		   0x008000000

! Bits 6:4 = Page Size: 0=8KB, 1=64KB, 3=4MB, 5=256MB, othere are invalid
! Bits 3:0 = TSB Table size: 6=64k entries
	
#define IOTSBDESC_1_DATA	   mpeval((1<<63)|(IOMMU_TTE_ADDR << 21) | (0 << 4) | 0x2)
#define IOTSBDESC_2_DATA	   mpeval((1<<63)|(IOMMU_TTE_ADDR << 21) | (1 << 4) | 0x3)
#define IOTSBDESC_3_DATA	   mpeval((1<<63)|(IOMMU_TTE_ADDR << 21) | (2 << 4) | 0x4)
#define IOTSBDESC_4_DATA	   mpeval((1<<63)|(IOMMU_TTE_ADDR << 21) | (3 << 4) | 0x5)
#define IOTSBDESC_5_DATA	   mpeval((1<<63)|(IOMMU_TTE_ADDR << 21) | (4 << 4) | 0x6)
#define IOTSBDESC_6_DATA	   mpeval((1<<63)|(IOMMU_TTE_ADDR << 21) | (5 << 4) | 0x7)
#define IOTSBDESC_7_DATA	   mpeval((1<<63)|(IOMMU_TTE_ADDR << 21) | (6 << 4) | 0x8)
#define IOTSBDESC_8_DATA	   mpeval((1<<63)|(IOMMU_TTE_ADDR << 21) | (7 << 4) | 0x9)


/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

!
! enable interrupts & provide basic handler (like piu_rupt_enable.s)
!

no_intr: ! Disable interrupts
        rdpr    %pstate, %g7
        xor     %g7, 0x2, %g7           ! Reset interrupt enable
        wrpr    %g7, %pstate

	! Initialize NCU's Mondo Interrupt Vector Register
	! VECTOR = 63

ncu_mondo_int_vec:
	set	63, %g1
	setx	MONDO_INT_VEC, %g2, %g3
	stx	%g1, [%g3]

	! Clear NCU's Mondo Interrupt Busy registers.

ncu_mondo_int_busy:
	setx	MONDO_INT_ABUSY, %g1, %g2
	stx	%g0, [%g2]

	! Enable IOMMU errors.

mmu_intr_enable_reg_init:
	setx	PCI_E_MMU_INT_ENB_ADDR, %g1, %g2
	set	0, %g4
	dec	%g4			! all 1s
	stx	%g4, [%g2]

	! Enable IMU errors.

imu_intr_enable_reg_init:
	setx	PCI_E_IMU_INT_ENB_ADDR, %g1, %g2
	stx	%g4, [%g2]

        ! Initialize Interrupt Mapping register for Mondos 62 and 63
	! Valid, thread ID 0, no interrupt controller

dmu_intr_map_reg_init:
        setx    PCI_E_INT_MAP_ADDR, %g1, %g7
        setx    PCI_E_INT_MAP_MONDO_62_OFFSET, %g1, %g3
        add     %g7, %g3, %g7
        best_set_reg(0x80000040, %g1, %g6)      ! valid = 1, thread id = 0
        stx     %g6, [%g7]                      ! interrupt controller = 1

        add     %g7, PCI_E_INT_MAP_STEP, %g7
        best_set_reg(0x80000080, %g1, %g6)      ! valid = 1, thread id = 0
        stx     %g6, [%g7]                      ! interrupt controller = 2

yes_intr:
        rdpr    %pstate, %g7
        or      %g7, 0x2, %g7           ! Set interrupt enable
        wrpr    %g7, %pstate

	! Enable IMU, MMU interrupts in the DMU Core and Block
	! Interrupt Enable register.

dmu_core_block_enable:
	setx	PCI_E_DMU_CORE_BLK_INT_ENB_ADDR, %g1, %g2
	stx	%g4, [%g2]

! enable SUN4U translation in the IOMMU
	
write_mmu_ctl_reg:
	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
	setx	0x00307, %g1, %g3	! 9:8 11 = Cache enabled, 
					! 3: 1 = Busid Select, 1 = use busid[5:0] for DEV2IOTSB index
					! 2: 1 = SUN4V enabled,
					! 1: 1 = bypass enabled, 
					! 0: 1 = translation enabled
	stx	%g3, [%g2]
	ldx	[%g2], %g3
	
! setup the DEV2IOTSB - the all busids map to IOTSBDESC ram entry 1
! (currently it looks like the denali transactor (or vera wrapper) is generating
! a random busid, so map them all to IOTSB 1.
	
write_dev2iotsb:
	setx	FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR, %g1, %g2
	setx    0x0001020304050607,  %g1, %g3
	stx	%g3, [%g2 + 0x00]
	stx	%g3, [%g2 + 0x08]
	stx	%g3, [%g2 + 0x10]
	stx	%g3, [%g2 + 0x18]
	stx	%g3, [%g2 + 0x20]
	stx	%g3, [%g2 + 0x28]
	stx	%g3, [%g2 + 0x30]
	stx	%g3, [%g2 + 0x38]
	
	stx	%g3, [%g2 + 0x40]
	stx	%g3, [%g2 + 0x48]
	stx	%g3, [%g2 + 0x50]
	stx	%g3, [%g2 + 0x58]
	stx	%g3, [%g2 + 0x60]
	stx	%g3, [%g2 + 0x68]
	stx	%g3, [%g2 + 0x70]
	stx	%g3, [%g2 + 0x78]
	
! setup entry 1 of the IOTSBDESC ram 
	
write_iotsbdesc:
	setx	FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR, %g1, %g2
	setx	IOTSBDESC_1_DATA, %g1, %g3
	setx	IOTSBDESC_2_DATA, %g1, %g4
	setx	IOTSBDESC_3_DATA, %g1, %g5
	setx	IOTSBDESC_4_DATA, %g1, %g6
	stx	%g3, [%g2 + 0]
	stx	%g4, [%g2 + 8]
	stx	%g5, [%g2 + 16]
	stx	%g6, [%g2 + 24]
	setx	IOTSBDESC_5_DATA, %g1, %g3
	setx	IOTSBDESC_6_DATA, %g1, %g4
	setx	IOTSBDESC_7_DATA, %g1, %g5
	setx	IOTSBDESC_8_DATA, %g1, %g6
	stx	%g3, [%g2 + 32]
	stx	%g4, [%g2 + 40]
	stx	%g5, [%g2 + 48]
	stx	%g6, [%g2 + 56]
	ldx	[%g2], %g3
	
! Trigger some DMA Writes which are not bypass addresses, because bits
! 49:40 are not all 0.
	
DMAWR1: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMAWR1)) -> EnablePCIeIgCmd("DMAWR", fffe000000000000, fffe0000ffffffff, "64'h100",1)

DMAWR2: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMAWR2)) -> EnablePCIeIgCmd("DMAWR", fffd000000000000, fffd0000ffffffff, "64'h100",1)

DMAWR3: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMAWR3)) -> EnablePCIeIgCmd("DMAWR", fffc800000000000, fffc8000ffffffff, "64'h100",1)

DMAWR4: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMAWR4)) -> EnablePCIeIgCmd("DMAWR", fffc400000000000, fffc4000ffffffff, "64'h100",1)

DMAWR5: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMAWR5)) -> EnablePCIeIgCmd("DMAWR", fffc200000000000, fffc2000ffffffff, "64'h100",1)

DMAWR6: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMAWR6)) -> EnablePCIeIgCmd("DMAWR", fffc100000000000, fffc1000ffffffff, "64'h100",1)

DMAWR7: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMAWR7)) -> EnablePCIeIgCmd("DMAWR", fffc080000000000, fffc0800ffffffff, "64'h100",1)

DMAWR8: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMAWR8)) -> EnablePCIeIgCmd("DMAWR", fffc040000000000, fffc0400ffffffff, "64'h100",1)

DMAWR9: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMAWR9)) -> EnablePCIeIgCmd("DMAWR", fffc020000000000, fffc0200ffffffff, "64'h100",1)

DMAWRa: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMAWRa)) -> EnablePCIeIgCmd("DMAWR", fffc010000000000, fffc0100ffffffff, "64'h100",1)


! Trigger some DMA Reads of various lengths
	
	setx  0x00001F00, %g1, %g2	! DMA start address
	setx  0x00001F00, %g1, %g3	! page size
#define DMA_ADDR_01 mpeval(0x0000001F00 + 0,16,16)
#define DMA_ADDR_02 mpeval(0x0000001F00 + 64,16,16)
DMA0: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA0)) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_01, DMA_ADDR_02, "64'h100",1)
	!stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_11 mpeval(0x0000002F00 + 0,16,16)
#define DMA_ADDR_12 mpeval(0x0000002F00 + 64,16,16)
DMA1: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA1)) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_11, DMA_ADDR_12, "64'h100",1)
	!stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_21 mpeval(0x0000003F00 + 0,16,16)
#define DMA_ADDR_22 mpeval(0x0000003F00 + 64,16,16)

DMA2: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA2)) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_21, DMA_ADDR_22, "64'h100",1)
	!stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_31 mpeval(0x0000004F00 + 0,16,16)
#define DMA_ADDR_32 mpeval(0x0000004F00 + 64,16,16)

DMA3: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA3)) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_31, DMA_ADDR_32, "64'h100",1)
	!stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_41 mpeval(0x0000005F00 + 0,16,16)
#define DMA_ADDR_42 mpeval(0x0000005F00 + 64,16,16)

DMA4: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA4)) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_41, DMA_ADDR_42, "64'h100",1)
	!stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_51 mpeval(0x0000006F00 + 0,16,16)
#define DMA_ADDR_52 mpeval(0x0000006F00 + 64,16,16)

DMA5: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA5)) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_51, DMA_ADDR_52, "64'h100",1)
	!stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2


	! select a MEM32 address in PCI address range and transmit the command to NCU
	
	setx    MEM32_WR_ADDR, %g1, %g2
	set	5, %g4			! loop 5 times

delay_loop:
	stx	%g2, [%g2]		! MEM32 PIO Write
	ldx	[%g2], %l0		! MEM32 PIO READ
	add	%g2, 8, %g2		! increment PIO  address
	
	dec	%g4			! decrement counter
	brnz	%g4, delay_loop		! loop if not zero
	nop

	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/**********************************************************************
 Interrupt trap handler.
 **********************************************************************/
	.align 64
.global iommu_trap_code
iommu_trap_code:

	! read DMU error status registers
	
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_ADDR, %g1, %g5 ! 631000
	ldx	[%g5+0x808], %l7			! 631808 - DMU Core and Block Error Status Reg
	cmp     %l7, 0
	bz	test_failed			! if 0, must be a PEU interrupt
	nop
	
	and	%l7, 0x2, %l6				! test if the MMU has an interrupt
	cmp     %l6, 0
	bnz     read_mmu_error_regs
	nop
	
read_imu_error_regs:
	ldx	[%g5+0x10], %l3				! 631010 - IMU Interrupt Status Reg
	ldx	[%g5+0x28], %l4				! 631028 - IMU RDS Error Log Reg
	ldx	[%g5+0x30], %l5				! 631030 - IMU SCS Error Log Reg
	ldx	[%g5+0x38], %l6				! 631038 - IMU EQS Error Log Reg
	ba	test_failed				! No errors expected - go to bad trap
	nop
	
read_mmu_error_regs:
	setx	FIRE_DLC_MMU_CSR_A_LOG_ADDR, %g1, %g6	! 641000
	ldx	[%g6+0x10], %l0				! 641010 - MMU Interrupt Status Reg
	stx	%l0, [%g6+0x18]				! 641018 - MMU Status Clear Reg
	ldx	[%g6+0x28], %l1				! 641028 - MMU Translation Fault Address Reg
	ldx	[%g6+0x30], %l2				! 641030 - MMU Translation Fault Status Reg
	!ba	return_to_test
	!nop

return_to_test:
	best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR+PCI_E_INT_CLEAR_MONDO_62_OFFSET), %g1, %g6)
	ldx	[%g6], %g1				! get mondo62 int state
	stx	%g0, [%g6]				! clear mondo 62 int state
	ldx	[%g6+8], %g1				! get mondo63 int state
	stx	%g0, [%g6+8]				! clear mondo 63 int state

clear_mondo_busy:
	best_set_reg(MONDO_INT_ABUSY, %g1, %g7)
	stx	%g0, [%g7]
	
	ldxa	[%g0]ASI_SWVR_INTR_R, %l5

        inc	%o0
        jmpl	%o7 + 4, %g0
	nop
	
/************************************************************************
   Test case data start.
************************************************************************/


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
	init_mem(0x0000000000000003, 66, 8, +, 0, +, 0x0000000010000000)
	
/************************************************************************/
