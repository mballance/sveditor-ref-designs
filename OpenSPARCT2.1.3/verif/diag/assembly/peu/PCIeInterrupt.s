/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeInterrupt.s
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

/************************************************************************
 Test case code start
 ************************************************************************/
SECTION .MAIN
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

peu_uncorrectable_err_enable:
	setx	PCI_E_PEU_UE_INT_ENB_ADDR, %g1, %g2
	setx	0x00fff7ff00fff7ff, %g1, %g5 ! all except bits 11, and spare/reserved bits
	stx	%g4, [%g2+0x10]		! clear interrupt status bits
	stx	%g5, [%g2]		! set interrupt enables
		
peu_correctable_err_enable:
	setx	PCI_E_PEU_CE_INT_ENB_ADDR, %g1, %g2
	stx	%g4, [%g2+0x10]		! clear interrupt status bits
	stx	%g4, [%g2]		! set interrupt enables
				
peu_dlpl_error_enable:
	setx	PCI_E_PEU_DLPL_INT_ENB_ADDR, %g1, %g2
	stx	%g4, [%g2+0x10]		! clear interrupt status bits
	!stx	%g4, [%g2]		! set interrupt enables
		
peu_other_err_enable:
	setx	PCI_E_PEU_OTHER_INT_ENB_ADDR, %g1, %g2
	stx	%g4, [%g2+0x10]		! clear interrupt status bits
	stx	%g4, [%g2]		! set interrupt enables

ilu_error_enable:	
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_ADDR, %g1, %g2	! 651000
	stx	%g4, [%g2+0x18]		! clear interrupt status bits
	stx	%g4, [%g2+8]		! set interrupt enables
			
peu_core_block_enable:
	setx	PCI_E_PEU_INT_ENB_ADDR, %g1, %g3
	stx	%g4, [%g3]		! set interrupt enables
		

/**********************************************************************
 Send a couple unsupported requests
 **********************************************************************/
Req1: ! $EV trig_pc_d(1,@VA(.MAIN.Req1)) -> EnablePCIeIgCmd("DMA_CFG0",0,0,0,2)
	
/**********************************************************************
 Force a PEU OE interrupt
 **********************************************************************/
	setx	PCI_E_PEU_OTHER_INT_ENB_ADDR, %g1, %g2
	mov	0, %o0			! clear interrupt indicator
	mov	5, %o1			! loop count
	stx	%g4, [%g2+0x18]		! set all error bits

oe_rupt_wait:
	ldx	[%g2+8], %g1		! read interrupt status reg
	ldx	[%g3+8], %g1		! read peu core & block status reg
	brnz	%o0, oe_rupt_done
	dec	%o1
	brnz	%o1, oe_rupt_wait
	nop
	ba	test_failed
	nop
	
oe_rupt_done:
	
/**********************************************************************
 Send a couple unsupported requests
 **********************************************************************/
Req2: ! $EV trig_pc_d(1,@VA(.MAIN.Req2)) -> EnablePCIeIgCmd("DMA_CFG1",0,0,0,2)

/**********************************************************************
 Force a PEU CE interrupt
 **********************************************************************/
	setx	PCI_E_PEU_CE_INT_ENB_ADDR, %g1, %g2
	mov	0, %o0			! clear interrupt indicator
	mov	5, %o1			! loop count
	stx	%g4, [%g2+0x18]		! set all error bits

ce_rupt_wait:
	ldx	[%g2+8], %g1		! read interrupt status reg
	ldx	[%g3+8], %g1		! read peu core & block status reg
	brnz	%o0, ce_rupt_done
	dec	%o1
	brnz	%o1, ce_rupt_wait
	nop
	ba	test_failed
	nop
	
ce_rupt_done:

/**********************************************************************
 Send a couple unsupported requests
 **********************************************************************/
Req3: ! $EV trig_pc_d(1,@VA(.MAIN.Req3)) -> EnablePCIeIgCmd("DMA_IO"  ,0,0,0,2)
	
/**********************************************************************
 Force a PEU UE interrupt
 **********************************************************************/
	setx	PCI_E_PEU_UE_INT_ENB_ADDR, %g1, %g2
	mov	0, %o0			! clear interrupt indicator
	mov	5, %o1			! loop count
	stx	%g4, [%g2+0x18]		! set all error bits

ue_rupt_wait:
	ldx	[%g2+8], %g1		! read interrupt status reg
	ldx	[%g3+8], %g1		! read peu core & block status reg
	brnz	%o0, ue_rupt_done
	dec	%o1
	brnz	%o1, ue_rupt_wait
	nop
	ba	test_failed
	nop
	
ue_rupt_done:

/**********************************************************************
 Force a PEU ILU interrupt
 **********************************************************************/
	setx	PCI_E_ILU_INT_ENB_ADDR, %g1, %g2
	mov	0, %o0			! clear interrupt indicator
	mov	5, %o1			! loop count
	stx	%g4, [%g2+0x18]		! set all error bits

ilu_rupt_wait:
	ldx	[%g2+8], %g1		! read interrupt status reg
	ldx	[%g3+8], %g1		! read peu core & block status reg
	brnz	%o0, ilu_rupt_done
	dec	%o1
	brnz	%o1, ilu_rupt_wait
	nop
	!ba	test_failed
	nop
	
ilu_rupt_done:


test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

/**********************************************************************
 Interrupt trap handler.
 **********************************************************************/
	.align 64
.global my_trap_code
my_trap_code:

	! read DMU error status registers
	
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_ADDR, %g1, %g5 ! 631000
	ldx	[%g5+0x808], %l7			! 631808 - DMU Core and Block Error Status Reg
	cmp     %l7, 0
	bz	read_peu_error_regs			! if 0, must be a PEU interrupt
	
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
	ldx	[%g6+0x28], %l1				! 641028 - MMU Translation Fault Address Reg
	ldx	[%g6+0x30], %l2				! 641030 - MMU Translation Fault Status Reg
	ba	test_failed				! No errors expected - go to bad trap
	nop
	
	! read PEU error status registers
	
read_peu_error_regs:
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_ADDR, %g1, %g5	! 651000
	ldx	[%g5+0x808], %l7			! 651808 - PEU Core and Block Interrupt Status Reg
	cmp     %l7, 0
	bz	test_failed				! one of the bits should have been set
	
	and	%l7, 0x8, %l6				! test if the ILU has an interrupt
	cmp     %l6, 0
	bnz     read_ilu_error_regs
	
	and	%l7, 0x4, %l6				! test if its an Uncorrectable error from PEU
	cmp     %l6, 0
	bnz     read_ue_error_regs
	
	and	%l7, 0x2, %l6				! test if its a Correctable error from PEU
	cmp     %l6, 0
	bnz     read_ce_error_regs
	nop

read_oe_error_regs:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_ADDR, %g1, %g5	! 681000
	ldx	[%g5+0x10], %l0				! 681010 - PEU OE Status Reg
	stx	%l0, [%g5+0x18]				! 681018 - PEU OE Status Clear Reg
	and	%l0, 0x800, %l1				! test if its a Correctable error from PEU
	cmp     %l1, 0
	bnz     read_dlpl_error_regs
	nop
	ldx	[%g5+0x28], %l1				! 681028 - PEU OE Rx Hdr1 Log Reg
	ldx	[%g5+0x30], %l2				! 681030 - PEU OE Rx Hdr2 Log Reg
	ldx	[%g5+0x38], %l3				! 681038 - PEU OE Tx Hdr1 Log Reg
	ldx	[%g5+0x40], %l4				! 681040 - PEU OE Tx Hdr2 Log Reg
	ba	return_to_test
	nop

read_ue_error_regs:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_ADDR, %g1, %g5	! 691000
	ldx	[%g5+0x10], %l0				! 691010 - PEU UE Status Reg
	stx	%l0, [%g5+0x18]				! 691018 - PEU UE Status Clear Reg
	ldx	[%g5+0x28], %l1				! 691028 - PEU UE Rx Hdr1 Log Reg
	ldx	[%g5+0x30], %l2				! 691030 - PEU UE Rx Hdr2 Log Reg
	ldx	[%g5+0x38], %l3				! 691038 - PEU UE Tx Hdr1 Log Reg
	ldx	[%g5+0x40], %l4				! 691040 - PEU UE Tx Hdr2 Log Reg
	ba	return_to_test
	nop

read_ce_error_regs:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_ADDR, %g1, %g5	! 6a1000
	ldx	[%g5+0x10], %l0				! 6a1010 - PEU CE Status Reg
	stx	%l0, [%g5+0x18]				! 681018 - PEU CE Status Clear Reg
	ba	return_to_test
	nop

read_dlpl_error_regs:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_ADDR, %g1, %g5	! 6e2100
	ldx	[%g5+0x18], %l1				! 6e2118 - PEU DLPL Status Reg
	stx	%l1, [%g5+0x20]				! 6e2120 - PEU DLPL Status Clear Reg
	ba	return_to_test
	nop

read_ilu_error_regs:
	ldx	[%g5+0x10], %l0				! 651010 - ILU Interrupt Status Reg
	stx	%l0, [%g5+0x18]				! 651018 - ILU Status Clear Reg
	ba	return_to_test
	nop

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
	
