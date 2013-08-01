/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_pci_multiple_INTX.s
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

#ifdef FC_NO_PEU_VERA
#include "dmaept_defines.h"
#else /* FC_NO_PEU_VERA */
#define ENABLE_PCIE_LINK_TRAINING
#endif /* FC_NO_PEU_VERA */

#define ENABLE_INTR0x60 1

#define INTR0x60_MONDO_IV 63

#define INTR0x60_MONDO_20_V 1
#define INTR0x60_MONDO_20_THREAD 0
#define INTR0x60_MONDO_20_CNTRL 0

#define INTR0x60_MONDO_21_V 1
#define INTR0x60_MONDO_21_MODE 1
#define INTR0x60_MONDO_21_THREAD 2
#define INTR0x60_MONDO_21_CNTRL 1

#define INTR0x60_MONDO_22_V 1
#define INTR0x60_MONDO_22_MODE 1
#define INTR0x60_MONDO_22_THREAD 4
#define INTR0x60_MONDO_22_CNTRL 2

#define INTR0x60_MONDO_23_V 1
#define INTR0x60_MONDO_23_THREAD 6
#define INTR0x60_MONDO_23_CNTRL 3


#ifdef PORTABLE_CORE
#define MASK_THREAD_ID and %g1, 0x7, %g1;
#else
#define MASK_THREAD_ID /*nothing*/
#endif /* PORTABLE_CORE */
#define INTR0x60_INTA_EXTRA_HANDLER \
    MASK_THREAD_ID \
    setx intr_count, %g4, %g3; \
    add  %g3, %g1, %g3; \
    ldub [%g3], %g4; \
    inc  %g4; \
    stb  %g4, [%g3]
#define INTR0x60_INTB_EXTRA_HANDLER INTR0x60_INTA_EXTRA_HANDLER
#define INTR0x60_INTC_EXTRA_HANDLER INTR0x60_INTA_EXTRA_HANDLER
#define INTR0x60_INTD_EXTRA_HANDLER INTR0x60_INTA_EXTRA_HANDLER

#include "interrupt0x60_defines.h"


#include "hboot.s"
#include "peu_defines.h"
#include "ncu_defines.h"
#include "cmp_macros.h"

#include "interrupt0x60_handler.s"

	
/************************************************************************
   Test case code start
 ************************************************************************/
SECTION .MAIN
.text
.global main

main:
    ta T_CHANGE_HPRIV
    nop

    ldxa [%g0] ASI_INTR_ID, %g1      ! Get the thread number
    MASK_THREAD_ID
    brnz %g1, main_target
    nop


/**************************************************************/
/* We are the "source" thread that sends interrupts */
main_source:
    /* Set up the MONDO DATA registers to non-zero values so that
     * we wiggle the data path */
    best_set_reg(0xAAAAAAAAAAAAAAAA, %l7, %l0)
    best_set_reg(PCI_E_INT_MONDO_DATA_0_ADDR, %l7, %l2)
init_mondo_data_0:
    stx     %l0, [%l2]
    xnor    %l0, %g0, %l1
    best_set_reg(PCI_E_INT_MONDO_DATA_1_ADDR, %l7, %l2)
init_mondo_data_1:
    stx     %l0, [%l2]

    /* Kick off the interrupts */

send_inta_intr:
#ifdef FC_NO_PEU_VERA
    ! Setup ASI - little-endian access to PCI space
    wr %g0, ASI_NL, %asi

    ! Offset accesses by PART_0_BASE + PCIE_MEM64_OFFSET since
    ! BAR is set that way. Physical addresses generated via TSB
    ! have this offset so mimic that when accessing directly, as here.
    best_set_reg(mpeval(N2_PCIE_BASE_ADDR
                        + MEM64_OFFSET_BASE_REG_DATA
                        + PCIE_MEM64_OFFSET
                        + PART_0_BASE
                        + (INTR0x60_MONDO_20_DMAEPT_ENGINE << 8)),
                 %l7, %l2)
    mov     %g0, %i1 /* Address 0 for now */
    ! Store upper half of address
    srlx    %i1, 32, %l0
    !setx    0xfffc0000, %l1, %l0 ! Always bypass for now.
    stwa    %l0, [%l2+DMAEPT_DATA_ADDR_UPPER] %asi

    ! Store lower half of address
    stwa    %i1, [%l2+DMAEPT_DATA_ADDR_LOWER] %asi

    ! Store pattern value
    mov     %g0, %i2 /* Pattern 0 */
    stwa    %i2, [%l2+DMAEPT_PATTERN] %asi
        
    ! Interrupt type
    best_set_reg(DMAEPT_ENDING_INTERRUPT_INTA, %l7, %l5)
    stwa    %l5, [%l2+DMAEPT_ENDING_INTERRUPT] %asi

    ! Packet size
    mov     4, %i4 /* Max of 4 DW */
    stwa    %i4, [%l2+DMAEPT_MAX_PYLD] %asi

    ! Tag for MR operations, use engine ID
    mov     INTR0x60_MONDO_20_DMAEPT_ENGINE, %i0
    stwa    %i0, [%l2+DMAEPT_TAG] %asi

    ! Fire the DMA
    best_set_reg(DMAEPT_OPERATION_MW, %l7, %i1) /* 0-byte write */
    stwa    %i1, [%l2+DMAEPT_OPERATION] %asi

#else /* FC_NO_PEU_VERA */
    ! user event to generate ASSERT_INTA msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_inta_intr)) -> EnablePCIeIgCmd ("INTA", 0, 0, "ASSERT", 64'd1, *, 1 )
    nop
    nop
    nop
    nop
#endif /* FC_NO_PEU_VERA */

send_intd_intr:
#ifdef FC_NO_PEU_VERA
    ! Offset accesses by PART_0_BASE + PCIE_MEM64_OFFSET since
    ! BAR is set that way. Physical addresses generated via TSB
    ! have this offset so mimic that when accessing directly, as here.
    best_set_reg(mpeval(N2_PCIE_BASE_ADDR
                        + MEM64_OFFSET_BASE_REG_DATA
                        + PCIE_MEM64_OFFSET
                        + PART_0_BASE
                        + (INTR0x60_MONDO_23_DMAEPT_ENGINE << 8)),
                 %l7, %l2)
    mov     %g0, %i1 /* Address 0 for now */
    ! Store upper half of address
    srlx    %i1, 32, %l0
    !setx    0xfffc0000, %l1, %l0 ! Always bypass for now.
    stwa    %l0, [%l2+DMAEPT_DATA_ADDR_UPPER] %asi

    ! Store lower half of address
    stwa    %i1, [%l2+DMAEPT_DATA_ADDR_LOWER] %asi

    ! Store pattern value
    mov     %g0, %i2 /* Pattern 0 */
    stwa    %i2, [%l2+DMAEPT_PATTERN] %asi
        
    ! Interrupt type
    best_set_reg(DMAEPT_ENDING_INTERRUPT_INTD, %l7, %l5)
    stwa    %l5, [%l2+DMAEPT_ENDING_INTERRUPT] %asi

    ! Packet size
    mov     4, %i4 /* Max of 4 DW */
    stwa    %i4, [%l2+DMAEPT_MAX_PYLD] %asi

    ! Tag for MR operations, use engine ID
    mov     INTR0x60_MONDO_20_DMAEPT_ENGINE, %i0
    stwa    %i0, [%l2+DMAEPT_TAG] %asi

    ! Fire the DMA
    best_set_reg(DMAEPT_OPERATION_MW, %l7, %i1) /* 0-byte write */
    stwa    %i1, [%l2+DMAEPT_OPERATION] %asi

#else /* FC_NO_PEU_VERA */
    ! user event to generate ASSERT_INTD msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_intd_intr)) -> EnablePCIeIgCmd ("INTD", 0, 0, "ASSERT", 64'd1, *, 1 )
    nop
    nop
    nop
    nop
#endif /* FC_NO_PEU_VERA */

send_intb_intr:
#ifdef FC_NO_PEU_VERA
    ! Offset accesses by PART_0_BASE + PCIE_MEM64_OFFSET since
    ! BAR is set that way. Physical addresses generated via TSB
    ! have this offset so mimic that when accessing directly, as here.
    best_set_reg(mpeval(N2_PCIE_BASE_ADDR
                        + MEM64_OFFSET_BASE_REG_DATA
                        + PCIE_MEM64_OFFSET
                        + PART_0_BASE
                        + (INTR0x60_MONDO_21_DMAEPT_ENGINE << 8)),
                 %l7, %l2)
    mov     %g0, %i1 /* Address 0 for now */
    ! Store upper half of address
    srlx    %i1, 32, %l0
    !setx    0xfffc0000, %l1, %l0 ! Always bypass for now.
    stwa    %l0, [%l2+DMAEPT_DATA_ADDR_UPPER] %asi

    ! Store lower half of address
    stwa    %i1, [%l2+DMAEPT_DATA_ADDR_LOWER] %asi

    ! Store pattern value
    mov     %g0, %i2 /* Pattern 0 */
    stwa    %i2, [%l2+DMAEPT_PATTERN] %asi
        
    ! Interrupt type
    best_set_reg(DMAEPT_ENDING_INTERRUPT_INTB, %l7, %l5)
    stwa    %l5, [%l2+DMAEPT_ENDING_INTERRUPT] %asi

    ! Packet size
    mov     4, %i4 /* Max of 4 DW */
    stwa    %i4, [%l2+DMAEPT_MAX_PYLD] %asi

    ! Tag for MR operations, use engine ID
    mov     INTR0x60_MONDO_20_DMAEPT_ENGINE, %i0
    stwa    %i0, [%l2+DMAEPT_TAG] %asi

    ! Fire the DMA
    best_set_reg(DMAEPT_OPERATION_MW, %l7, %i1) /* 0-byte write */
    stwa    %i1, [%l2+DMAEPT_OPERATION] %asi

#else /* FC_NO_PEU_VERA */
    ! user event to generate ASSERT_INTB msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_intb_intr)) -> EnablePCIeIgCmd ("INTB", 0, 0, "ASSERT", 64'd1, *, 1 )
    nop
    nop
    nop
    nop
#endif /* FC_NO_PEU_VERA */

send_intc_intr:
#ifdef FC_NO_PEU_VERA
    ! Offset accesses by PART_0_BASE + PCIE_MEM64_OFFSET since
    ! BAR is set that way. Physical addresses generated via TSB
    ! have this offset so mimic that when accessing directly, as here.
    best_set_reg(mpeval(N2_PCIE_BASE_ADDR
                        + MEM64_OFFSET_BASE_REG_DATA
                        + PCIE_MEM64_OFFSET
                        + PART_0_BASE
                        + (INTR0x60_MONDO_22_DMAEPT_ENGINE << 8)),
                 %l7, %l2)
    mov     %g0, %i1 /* Address 0 for now */
    ! Store upper half of address
    srlx    %i1, 32, %l0
    !setx    0xfffc0000, %l1, %l0 ! Always bypass for now.
    stwa    %l0, [%l2+DMAEPT_DATA_ADDR_UPPER] %asi

    ! Store lower half of address
    stwa    %i1, [%l2+DMAEPT_DATA_ADDR_LOWER] %asi

    ! Store pattern value
    mov     %g0, %i2 /* Pattern 0 */
    stwa    %i2, [%l2+DMAEPT_PATTERN] %asi
        
    ! Interrupt typefff
    best_set_reg(DMAEPT_ENDING_INTERRUPT_INTC, %l7, %l5)
    stwa    %l5, [%l2+DMAEPT_ENDING_INTERRUPT] %asi

    ! Packet size
    mov     4, %i4 /* Max of 4 DW */
    stwa    %i4, [%l2+DMAEPT_MAX_PYLD] %asi

    ! Tag for MR operations, use engine ID
    mov     INTR0x60_MONDO_20_DMAEPT_ENGINE, %i0
    stwa    %i0, [%l2+DMAEPT_TAG] %asi

    ! Fire the DMA
    best_set_reg(DMAEPT_OPERATION_MW, %l7, %i1) /* 0-byte write */
    stwa    %i1, [%l2+DMAEPT_OPERATION] %asi

#else /* FC_NO_PEU_VERA */
    ! user event to generate ASSERT_INTC msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_intc_intr)) -> EnablePCIeIgCmd ("INTC", 0, 0, "ASSERT", 64'd1, *, 1 )
    nop
    nop
    nop
    nop
#endif /* FC_NO_PEU_VERA */

    /* We are all done sending interrupts, to go to good trap */
/*    EXIT_GOOD */

/**************************************************************/
/* Code for target threads */
main_target:
intr_wait_2:
    setx intr_expect, %l1, %g4
    add  %g4, %g1, %g4          ! address of expected interrupt count for this thread
    ldub [%g4], %g4

    setx intr_count, %l1, %g3
    add  %g3, %g1, %g3          ! address of interrupt count for this thread

#ifdef DTM_ENABLED
    best_set_reg(0x1600, %l1, %g2)		! DTM timeout count
#else
    best_set_reg(0x200, %l1, %g2)		! timeout count
#endif

intr_wait_loop_top_2:
    ldub  [%g3], %g5
    cmp  %g5, %g4
    be   thread_passed
    dec  %g2

    cmp  %g2, 0
    bne  intr_wait_loop_top_2
    nop

intr_timeout:
    !$EV trig_pc_d(1, @VA(.MAIN.intr_timeout)) -> printf("ERROR: Timeout waiting for interrupt",*,1)
    EXIT_BAD
	
thread_passed:
    EXIT_GOOD

local_test_failed:
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
