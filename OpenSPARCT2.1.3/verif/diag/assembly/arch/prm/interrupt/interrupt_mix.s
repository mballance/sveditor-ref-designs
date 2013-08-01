/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_mix.s
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
#define ENABLE_PCIE_LINK_TRAINING

#define ENABLE_INTR0x60 1

#define INTR0x60_CC_IV_0 44

#define INTR0x60_CC_DEST_1


#define INTR0x60_MONDO_IV 61

#define INTR0x60_MONDO_20_V 1
#define INTR0x60_MONDO_20_THREAD 0
#define INTR0x60_MONDO_20_CNTRL 0

#define INTR0x60_INITIALIZE_INT_MAN 1

#define INTR0x60_NIU_TX_IV_0 7
#define INTR0x60_NIU_TX_DMA_0 3
#define INTR0x60_NIU_TX_THREAD_0 5

#define INTR0x60_SSI_INT_IV 31
#define INTR0x60_SSI_INT_THREAD 6


#define INTR0x60_INTA_EXTRA_HANDLER \
    setx intr_count, %g4, %g3; \
    add  %g3, %g1, %g3; \
    ldub [%g3], %g4; \
    inc  %g4; \
    stb  %g4, [%g3]
#define INTR0x60_CC_EXTRA_HANDLER      INTR0x60_INTA_EXTRA_HANDLER
#define INTR0x60_NIU_TX_EXTRA_HANDLER  INTR0x60_INTA_EXTRA_HANDLER
#define INTR0x60_SSI_INT_EXTRA_HANDLER INTR0x60_INTA_EXTRA_HANDLER

#include "interrupt0x60_defines.h"


#define SYNC_THREADS 1

#include "hboot.s"

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
    brz  %g1, t0_main
    sub  %g1, 2, %g2
    brz  %g2, t2_main
    sub  %g1, 3, %g2
    brz  %g2, t3_main
    sub  %g1, 4, %g2
    brz  %g2, t4_main
    nop
    ba   intr_wait              ! All other threads just wait
    nop


/**************************************************************/
/* Thread 0 */
t0_main:
    /* Kick off an INTA interrupt */

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
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_inta_intr)) -> EnablePCIeIgCmd ("INTA", 0, 0, "ASSERT", 1, *, 1 )
    nop
#endif /* FC_NO_PEU_VERA */

    /* We are all done sending interrupts, so go to the wait loop */
    ba   intr_wait
    nop


/**************************************************************/
/* Thread 2 */
t2_main:
    /* Kick off an NIU interrupt */

send_niu_intr:
    ! Generate the interrupt via PIO write
    best_set_reg(TDMC_INTR_DBG, %l1, %l2)
    mov	    INTR0x60_NIU_TX_DMA_0, %l7
    best_set_reg(TDMC_STEP, %l1, %l3)
    mulx    %l7, %l3, %l7
    add     %l2, %l7, %l2
    best_set_reg(0x8000, %l1, %l4)
    stxa    %l4, [%l2]ASI_PRIMARY_LITTLE


    /* We are all done sending interrupts, so go to the wait loop */
    ba   intr_wait
    nop


/**************************************************************/
/* Thread 3 */
t3_main:
    /* Kick off an SSI_EXT_INT_L interrupt to thread 6 */

send_ssi_intr:
    ! user event to generate SSI_EXT_INT_L as soon as possible
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_ssi_intr)) -> extint (0, 8)
    /* We are all done sending interrupts, so go to the wait loop */
    ba   intr_wait
    nop


/**************************************************************/
/* Thread 4 */
t4_main:
    /* Kick off an cross-call interrupt to thread 1 */

send_cc_intr_to_thread_1:
    best_set_reg(mpeval((1<<8)+INTR0x60_CC_IV_0), %g2, %g3)
    stxa	%g3, [%g0]ASI_INTR_W

    /* We are all done sending interrupts, so go to the wait loop */
    ba   intr_wait
    nop


/**************************************************************/
/* Common wait loop for all threads */
intr_wait:
    setx intr_expect, %l1, %g4
    add  %g4, %g1, %g4          ! address of expected interrupt count for this thread
    ldub [%g4], %g4

    setx intr_count, %l1, %g3
    add  %g3, %g1, %g3          ! address of interrupt count for this thread

    best_set_reg(0x200, %l1, %g2)		! timeout count

intr_wait_loop_top:
    ldub  [%g3], %g5
    cmp  %g5, %g4
    be   thread_passed
    dec  %g2

    cmp  %g2, 0
    bne  intr_wait_loop_top
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
        .byte   0x1             ! expected interrupt count for thread 1
        .byte   0x0             ! expected interrupt count for thread 2
        .byte   0x0             ! expected interrupt count for thread 3
        .byte   0x0             ! expected interrupt count for thread 4
        .byte   0x1             ! expected interrupt count for thread 5
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
