/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_niurx.s
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

#define ENABLE_BG_NIU_RX 1
#define ENABLE_NIU_BACKGROUND_PACKETS_IN_BOOT 1

#define ENABLE_INTR0x60 1

#define INTR0x60_INITIALIZE_INT_MAN 1

#define INTR0x60_NIU_RX_IV_0 7
#define INTR0x60_NIU_RX_THREAD_0 1
#define INTR0x60_NIU_RX_DMA_0 0

#include "niu_defines.h"

/* Increment the interrupt count for this thread.
 * If it is not equal to the expected count, call NIU_PktRcv.
 * The call instruction will write to %o7, so preserve it in %g7 */
#define INTR0x60_NIU_RX_EXTRA_HANDLER \
    setx intr_count, %g7, %g6; \
    add  %g6, %g1, %g6; \
    ldub [%g6], %g5; \
    inc  %g5; \
    stb  %g5, [%g6]; \
    setx intr_expect, %g7, %g6; \
    add  %g6, %g1, %g6; \
    ldub [%g6], %g7; \
    cmp  %g7, %g5; \
    be   %xcc, 1f; \
    mov  %o7, %g7; \
    call NIU_PktRcv; nop; \
    mov  %g7, %o7; \
1:

#include "interrupt0x60_defines.h"


#define SYNC_THREADS 1

#include "hboot.s"

#include "interrupt0x60_handler.s"

	
#include "niu_pktgen.s"

/************************************************************************
   Test case code start
 ************************************************************************/
SECTION .MAIN
.text
.global main

main:
    ta T_CHANGE_HPRIV

get_thread_id:
    ldxa [%g0] ASI_INTR_ID, %g1      ! Get the thread number
    brz  %g1, t0_main
    nop
    ba	 intr_wait
    nop

/**************************************************************/
/* Thread 0 */
t0_main:
    nop
    /* Interrupts are now started in niu_start_bg_pkts.s */

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

    best_set_reg(100, %l1, %g2)		! timeout count

intr_wait_loop_top:
    /* For debug, get the values of certain NIU registers */
    best_set_reg(mpeval(RX_DMA_CTL_STAT_DBG+(RXDMA_CHNL*RX_DMA_CTL_STAT_STEP)),
                 %l1, %l0)
    ldxa    [%l0]ASI_PRIMARY_LITTLE, %l5
    best_set_reg(mpeval(RX_DMA_CTL_STAT+(RXDMA_CHNL*RX_DMA_CTL_STAT_STEP)),
                 %l1, %l0)
    ldxa    [%l0]ASI_PRIMARY_LITTLE, %l6
    best_set_reg(mpeval(RCR_STAT_A+(RXDMA_CHNL*RX_DMA_CTL_STAT_STEP)),
                 %l1, %l0)
    ldxa    [%l0]ASI_PRIMARY_LITTLE, %l7

    /* Check whether we have received the desired number of interrupts */
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

.global intr_expect
intr_expect:
        .byte   0x0             ! expected interrupt count for thread 0
        .byte   0x3             ! expected interrupt count for thread 1
        .byte   0x0             ! expected interrupt count for thread 2
        .byte   0x0             ! expected interrupt count for thread 3
        .byte   0x0             ! expected interrupt count for thread 4
        .byte   0x0             ! expected interrupt count for thread 5
        .byte   0x0             ! expected interrupt count for thread 6
        .byte   0x0             ! expected interrupt count for thread 7
.end

/************************************************************************/
