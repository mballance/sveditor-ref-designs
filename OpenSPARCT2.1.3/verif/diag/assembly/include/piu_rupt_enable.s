/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: piu_rupt_enable.s
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
no_intr:
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

	! Enable in MMU, TTE_INV_P, primary TTE valid bit not set error.

mmu_intr_enable_reg_init:
	setx	PCI_E_MMU_INT_ENB_ADDR, %g1, %g2
	set	0, %g4
	dec	%g4			! all 1s
	stx	%g4, [%g2]

	! Enable in IMU, MSI_MAL_ERR_P, malformed MSI message error.

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
#ifdef PORTABLE_CORE
	ldxa	[%g0] ASI_INTR_ID, %l7
	and	%l7, 0x38, %l7			! %l7 = core ID, not thread ID
	sllx	%l7, PCI_E_INT_MAP_THREADID_SHIFT, %l7
	or	%l7, %g6, %g6			! Use core ID of core running on
#endif
        stx     %g6, [%g7]                      ! interrupt controller = 1

        add     %g7, PCI_E_INT_MAP_STEP, %g7
        !setx    0x80000040, %g1, %g6           ! valid = 1, thread id = 0
        stx     %g6, [%g7]                      ! interrupt controller = 1
	

yes_intr:
        rdpr    %pstate, %g7
        or      %g7, 0x2, %g7           ! Set interrupt enable
        wrpr    %g7, %pstate

	! Enable IMU, MMU interrupts in the DMU Core and Block
	! Interrupt Enable register.

dmu_core_block_enable:
	setx	PCI_E_DMU_CORE_BLK_INT_ENB_ADDR, %g1, %g2
	setx	mpeval(PCI_E_DMU_CORE_BLK_INT_EN_DMC_MASK |PCI_E_DMU_CORE_BLK_INT_EN_MMU_MASK | PCI_E_DMU_CORE_BLK_INT_EN_IMU_MASK), %g1, %g3
	stx	%g3, [%g2]

peu_uncorrectable_err_enable:
	setx	PCI_E_PEU_UE_INT_ENB_ADDR, %g1, %g2
	stx	%g4, [%g2+0x10]		! clear interrupt status bits
	stx	%g4, [%g2]		! set interrupt enables
		
peu_correctable_err_enable:
	setx	PCI_E_PEU_CE_INT_ENB_ADDR, %g1, %g2
	stx	%g4, [%g2+0x10]		! clear interrupt status bits
	stx	%g4, [%g2]		! set interrupt enables
		
peu_dlpl_error_enable:
	setx	PCI_E_PEU_DLPL_INT_ENB_ADDR, %g1, %g2
	best_set_reg(0x0003ffff, %g1, %g4)
	stx	%g4, [%g2+0x10]		! clear interrupt status bits
	stx	%g4, [%g2]		! set interrupt enables
		
peu_other_err_enable:
	setx	PCI_E_PEU_OTHER_INT_ENB_ADDR, %g1, %g2
	stx	%g4, [%g2+0x10]		! clear interrupt status bits
	stx	%g4, [%g2]		! set interrupt enables
		
peu_core_block_enable:
	setx	PCI_E_PEU_INT_ENB_ADDR, %g1, %g2
	stx	%g4, [%g2+0x10]		! clear interrupt status bits
	stx	%g4, [%g2]		! set interrupt enables
		
ilu_block_enable:
	setx	PCI_E_ILU_INT_ENB_ADDR, %g1, %g2
	stx	%g4, [%g2]		! set block enables
		
	membar	#Sync

	b       trap_end
	nop
	
/**********************************************************************
   Interrupt trap handler.
**********************************************************************/
	.align 64
.global my_trap_code
my_trap_code:

	! read DMU error status registers
	
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_ADDR, %g1, %g3 ! 631000
	ldx	[%g3+0x808], %l7			! 631808 - DMU Core and Block Error Status Reg
	cmp     %l7, 0
	bz	read_peu_error_regs			! if 0, must be a PEU interrupt
	
	and	%l7, 0x2, %g4				! test if the MMU has an interrupt
	cmp     %g4, 0
	bnz     read_mmu_error_regs
	nop
	
read_imu_error_regs:
	ldx	[%g3+0x10], %l3				! 631010 - IMU Interrupt Status Reg
	ldx	[%g3+0x28], %l4				! 631028 - IMU RDS Error Log Reg
	ldx	[%g3+0x30], %l5				! 631030 - IMU SCS Error Log Reg
	ldx	[%g3+0x38], %l6				! 631038 - IMU EQS Error Log Reg
	b	test_failed				! No errors expected - go to bad trap
	nop
	
read_mmu_error_regs:
	setx	FIRE_DLC_MMU_CSR_A_LOG_ADDR, %g1, %g2	! 641000
	ldx	[%g2+0x10], %l0				! 641010 - MMU Interrupt Status Reg
	ldx	[%g2+0x28], %l1				! 641028 - MMU Translation Fault Address Reg
	ldx	[%g2+0x30], %l2				! 641030 - MMU Translation Fault Status Reg
	b	test_failed				! No errors expected - go to bad trap
	nop
	
	! read PEU error status registers
	
read_peu_error_regs:
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_ADDR, %g1, %g3	! 651000
	ldx	[%g3+0x808], %l7			! 651808 - PEU Core and Block Interrupt Status Reg
	cmp     %l7, 0
	bz	test_failed				! one of the bits should have been set
	
	and	%l7, 0x8, %g4				! test if the ILU has an interrupt
	cmp     %g4, 0
	bnz     read_ilu_error_regs
	
	and	%l7, 0x4, %g4				! test if its an Uncorrectable error from PEU
	cmp     %g4, 0
	bnz     read_ue_error_regs
	
	and	%l7, 0x2, %g4				! test if its a Correctable error from PEU
	cmp     %g4, 0
	bnz     read_ce_error_regs
	nop

read_oe_error_regs:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_ADDR, %g1, %g3	! 681000
	ldx	[%g3+0x10], %l0				! 681010 - PEU OE Status Reg
	and	%l0, 0x800, %l1				! test if its a Correctable error from PEU
	cmp     %l1, 0
	bnz     read_dlpl_error_regs
	nop
	ldx	[%g2+0x28], %l1				! 681028 - PEU OE Rx Hdr1 Log Reg
	ldx	[%g2+0x30], %l2				! 681030 - PEU OE Rx Hdr2 Log Reg
	ldx	[%g2+0x38], %l3				! 681038 - PEU OE Tx Hdr1 Log Reg
	ldx	[%g2+0x40], %l4				! 681040 - PEU OE Tx Hdr2 Log Reg
	b	test_failed				! No errors expected - go to bad trap
	nop

read_ue_error_regs:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_ADDR, %g1, %g3	! 691000
	ldx	[%g3+0x10], %l0				! 691010 - PEU UE Status Reg
	ldx	[%g2+0x28], %l1				! 691028 - PEU UE Rx Hdr1 Log Reg
	ldx	[%g2+0x30], %l2				! 691030 - PEU UE Rx Hdr2 Log Reg
	ldx	[%g2+0x38], %l3				! 691038 - PEU UE Tx Hdr1 Log Reg
	ldx	[%g2+0x40], %l4				! 691040 - PEU UE Tx Hdr2 Log Reg
	b	test_failed				! No errors expected - go to bad trap
	nop

read_ce_error_regs:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_ADDR, %g1, %g3	! 6a1000
	ldx	[%g3+0x10], %l0				! 6a1010 - PEU CE Status Reg
	b	test_failed				! No errors expected - go to bad trap
	nop

read_dlpl_error_regs:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_ADDR, %g1, %g3	! 6e2100
	ldx	[%g3+0x18], %l1				! 6e2118 - PEU DLPL Status Reg
	b	test_failed				! No errors expected - go to bad trap
	nop

read_ilu_error_regs:
	ldx	[%g3+0x10], %l0				! 651010 - ILU Interrupt Status Reg
	b	test_failed				! No errors expected - go to bad trap
	nop
	
	.align 64
trap_end:
