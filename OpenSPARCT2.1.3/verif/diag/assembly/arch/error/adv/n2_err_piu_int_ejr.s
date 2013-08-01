/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_piu_int_ejr.s
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
#define H_HT0_Sw_Recoverable_Error_0x40	 My_Recoverable_Sw_error_trap
    
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

	
/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global	 My_Recoverable_Sw_error_trap

main:
        ta T_CHANGE_HPRIV
        nop

lear_esr_first:
	setx	SOC_ESR_REG, %l7, %i0
	stx	%g0, [%i0]

set_ejr:
        set	0x1, %i1
	sllx	%i1, ERR_FIELD, %i2
	setx	SOC_EJR_REG, %l7, %i3
	stx	%i2, [%i3]
	membar	0x40


/*      Initialize the NCU for the interrupt.   */

        ! Disable interrupts


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
	set	PCI_E_MMU_INT_EN_TTE_INV_P_SHIFT, %g3
	set	1, %g4
	sllx	%g4, %g3, %g4
	stx	%g4, [%g2]

	! Enable in IMU, MSI_MAL_ERR_P, malformed MSI message error.

imu_intr_enable_reg_init:
	setx	PCI_E_IMU_INT_ENB_ADDR, %g1, %g2
	set	PCI_E_IMU_INT_EN_MSI_MAL_ERR_P_SHIFT, %g3
	set	1, %g4
	sllx	%g4, %g3, %g4
	stx	%g4, [%g2]

        ! Initialize Interrupt Mapping register
	! Valid, thread ID 0, no interrupt controller

pci_intr_map_reg_init:
        setx    PCI_E_INT_MAP_ADDR, %g1, %g7
        setx    PCI_E_INT_MAP_MONDO_62_OFFSET, %g1, %g3
        add     %g7, %g3, %g7
        setx    0x80000040, %g1, %g6            ! valid = 1, thread id = 0
        stx     %g6, [%g7]                      ! interrupt controller = 1

yes_intr:
        rdpr    %pstate, %g7
        or      %g7, 0x2, %g7           ! Set interrupt enable
        wrpr    %g7, %pstate

	! Enable IMU, MMU interrupts in the DMU Core and Block
	! Interrupt Enable register.

dmu_core_block_enable:
	setx	PCI_E_DMU_CORE_BLK_INT_ENB_ADDR, %g1, %g2
	setx	PCI_E_DMU_CORE_BLK_INT_EN_DMC_MASK, %g1, %g3
	setx	PCI_E_DMU_CORE_BLK_INT_EN_MMU_MASK, %g1, %g4
	or	%g3, %g4, %g4
	setx	PCI_E_DMU_CORE_BLK_INT_EN_IMU_MASK, %g1, %g3
	or	%g3, %g4, %g4
	stx	%g4, [%g2]
	membar	#Sync

	! Generate an interrupt from the IMU block.

gen_imu_intr:
	setx	PCI_E_IMU_ERR_STAT_SET_ADDR, %g1, %g2
	set	1, %g6
	setx	PCI_E_IMU_INT_EN_MSI_MAL_ERR_P_SHIFT, %g1, %g3
	sllx	%g6, %g3, %g6
	stx	%g6, [%g2]
	membar	#Sync

	! Wait for the interrupt trap

intr_wait1:
	setx	0x400, %g1, %g2			! timeout count
	setx	user_data_start, %g1, %g7

intr_wait_loop1:
	ld	[%g7], %g5
	cmp	%g5, 1
	be	read_esr
	nop

	cmp	%g2, 0
	be	test_failed		! time out
	nop
	ba	intr_wait_loop1
	dec	%g2


	/******************************
		Error Check
	******************************/
read_esr:
        setx	SOC_ESR_REG, %l7, %i0
	ldx	[%i0], %i1
	nop

	setx	0x8000000000000000, %l7, %o3	!valid bit
	set	0x1, %i2
	sllx	%i2, ERR_FIELD, %i3
	or	%i3, %o3, %i4
	sub	%i1, %i4, %i5
	brnz	%i5, test_failed
	nop

eie_reg_ones:
	setx    SOC_EIE_REG, %g3, %g2
	set	ERR_FIELD, %g1
	stx	%g1, [%g2]
	membar	0x40

	setx	0x40, %g7, %g6
	set	0x1, %g1			! 1 Trap
err_trap_loop:
	cmp	    %g6, %g0
	be	%xcc, test_failed
	nop

	cmp	%g1, %i7
	be	%xcc, check_tt
	nop

	ba	err_trap_loop
	nop

check_tt:
        mov	0x40, %l0
	cmp	%o7,  %l0
	bne	%xcc, test_failed
	nop


	/********************************/


test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/**********************************************************************
   Interrupt trap handler.
**********************************************************************/

.global my_trap_code

my_trap_code:

	! Record interrupt occured.

trap_intr_flag:
        setx    user_data_start, %l1, %l3
	set	1, %l1
	st	%l1, [%l3]

	! Check Mondo Interrupt Busy reg.

trap_mondo_busy:
        ta      T_RD_THID			! thread id into %o1
	setx	MONDO_INT_BUSY, %l1, %l2
	setx	MONDO_INT_BUSY_STEP, %l1, %l3
	mulx	%l3, %o1, %l3
	add	%l3, %l2, %l2
	ldx	[%l2], %l4
	and	%l4, 0x40, %l5			! Is busy bit set?
	cmp	%l5, 0
	be	test_failed
	nop

	! Clear the mondo interrupt in the PIU.

	! MMU Error Status Set reg.

trap_clear_mmu_err_set:	
	setx	PCI_E_MMU_ERR_STAT_SET_ADDR, %l1, %l2
	stx	%g0, [%l2]			! removes setting of the error

	! MMU Error Status Clear reg.

trap_mmu_err_clear:
	setx	PCI_E_MMU_ERR_STAT_CL_ADDR, %l1, %l2
	sub	%g0, 1, %l0			! a W1C register
	stx	%l0, [%l2]			! clears the error flag

	! IMU Error Status Set reg.

trap_clear_imu_err_set:	
	setx	PCI_E_IMU_ERR_STAT_SET_ADDR, %l1, %l2
	stx	%g0, [%l2]			! removes setting of the error

	! IMU Error Status Clear reg.

trap_imu_err_clear:
	setx	PCI_E_IMU_ERR_STAT_CLR_ADDR, %l1, %l2
	sub	%g0, 1, %l0			! a W1C register
	stx	%l0, [%l2]			! clears the error flag

	! Interrupt Clear reg.

trap_intr_clear:
	setx	PCI_E_INT_CLEAR_ADDR, %l1, %l2
        setx    PCI_E_INT_CLEAR_MONDO_62_OFFSET, %l1, %l3
	add	%l2, %l3, %l2
	stx	%g0, [%l2]

	! Clear the mondo interrupt in the NCU

trap_mondo_intr_clear:
	setx	MONDO_INT_ABUSY, %l0, %l1
	stx	%g0, [%l1]
	membar	#Sync

	ldx	[%l1], %l2
	and	%l2, 0x40, %l2
	cmp	%l2, 0			! Busy should be cleared
	bne	test_failed
	nop

	! Clear the interrupt in the core.

trap_clear_asi_intr_r:
	ldxa	[%g0]ASI_SWVR_INTR_R, %l5
	cmp	%l5, 63			! check for correct vector number
	bne	test_failed
	nop

	! Done.

trap_done:
	jmpl    %o7+0x8, %g0
	nop




/************************************************************************
	RAS
	Trap Handlers
 ************************************************************************/
My_Recoverable_Sw_error_trap:
	! Signal trap taken
	setx	EXECUTED, %l0, %o6
	! save trap type value
	rdpr	%tt, %o7

	inc	%i7

check_desr_tt40:
	ldxa  [%g0]0x4c, %g2
	nop

/*
	setx	0xb300000000000000, %l0, %g3
	subcc	%g2, %g3, %g4
	brnz	%g4, l2_trap
	nop
*/

check_DSFSR_tt32:
	set	0x18, %g1
	ldxa	[%g1]0x58, %g2
	nop
	set	0x4, %g3
	subcc	%g2, %g3, %g4
	brnz	%g4, test_failed
	nop


check_per_tt40:
	setx	SOC_PER_REG, %l7, %g1
	ldx	[%g1], %g2
	setx	0x8000000000000000, %g7, %g1
	set	0x1, %g3
	sllx	%g3, ERR_FIELD, %g4
	or	%g1, %g4, %g3
	sub	%g2, %g3, %g5
	brnz	%g5, test_failed
	nop

clear_per_tt40:
	setx	SOC_PER_REG, %l7, %g1
	stx	%g0, [%g1]
	nop

clear_ejr_tt40:
	setx	SOC_EJR_REG, %l7, %g1
	stx	%g0, [%g1]
	nop

clear_eie_tt40:
	setx	SOC_EIE_REG, %l7, %g1
	stx	%g0, [%g1]
	nop

trap_done_tt40:
	done
	nop


/************************************************************************
   Test case data start
************************************************************************/

.align  1024
.data
user_data_start:
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
user_data_end:
.end

