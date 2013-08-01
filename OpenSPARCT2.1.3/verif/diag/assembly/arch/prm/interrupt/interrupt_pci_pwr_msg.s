/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_pci_pwr_msg.s
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

#define INTR0x60_EVENT_QUEUE_BASE event_queue_base

#define INTR0x60_MONDO_IV 62

#define INTR0x60_MONDO_30_V      1
#define INTR0x60_MONDO_30_MODE   1
#define INTR0x60_MONDO_30_THREAD 0
#define INTR0x60_MONDO_30_CNTRL  0
#define INTR0x60_PM_PME_EQN      eval(30-24)

#define INTR0x60_MONDO_31_V      1
#define INTR0x60_MONDO_31_MODE   1
#define INTR0x60_MONDO_31_THREAD 0
#define INTR0x60_MONDO_31_CNTRL  1
#define INTR0x60_PME_TO_ACK_EQN  eval(31-24)

#define INTR0x60_PM_PME_EXTRA_HANDLER \
    setx pm_pme_intr_count, %g4, %g3; \
    ldub [%g3], %g4; \
    inc  %g4; \
    stb  %g4, [%g3]
#define INTR0x60_PME_TO_ACK_EXTRA_HANDLER \
    setx pme_to_ack_intr_count, %g4, %g3; \
    ldub [%g3], %g4; \
    inc  %g4; \
    stb  %g4, [%g3]


#define WAIT_FOR_INTERRUPT(counter_addr_reg) \
    best_set_reg(0x100,%l7,%l0); \
1:  ldub [counter_addr_reg], %l2; \
    brnz %l2,2f; \
    dec  %l0; \
    brz  %l0, wait_for_interrupt_timeout; \
    nop; \
    ba   1b; \
2:  nop

#include "interrupt0x60_defines.h"


#define SYNC_THREADS 1

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

/* Kick off one interrupt, wait for it, then kick off the next */

send_pm_pme_intr1:
    ! user event to generate PM_PME msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_pm_pme_intr1)) -> EnablePCIeIgCmd ("PM_PME", 0, 0, "0", 1, * )
    setx pm_pme_intr_count, %l7, %l1
    WAIT_FOR_INTERRUPT(%l1)
    stb  %g0, [%l1]

send_pm_pme_intr2:
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_pm_pme_intr2)) -> EnablePCIeIgCmd ("PM_PME", 0, 0, "0", 1, * )
    WAIT_FOR_INTERRUPT(%l1)
    stb  %g0, [%l1]

send_pme_to_ack_intr1:
    ! user event to generate PME_TO_ACK msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_pme_to_ack_intr1)) -> EnablePCIeIgCmd ("PM_TO_ACK", 0, 0, "0", 1, * )
    setx pme_to_ack_intr_count, %l7, %l1
    WAIT_FOR_INTERRUPT(%l1)
    stb  %g0, [%l1]

send_pme_to_ack_intr2:
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_pme_to_ack_intr2)) -> EnablePCIeIgCmd ("PM_TO_ACK", 0, 0, "0", 1, * )
    WAIT_FOR_INTERRUPT(%l1)
    stb  %g0, [%l1]

    /* We are all done sending interrupts, to go to good trap */
thread_passed:
    EXIT_GOOD

wait_for_interrupt_timeout:
    EXIT_BAD  ! $EV trig_pc_d(1, @VA(.MAIN.wait_for_interrupt_timeout)) -> printf ("ERROR: Timeout waiting for interrupt",*,1);



/************************************************************************
   Test case data start
************************************************************************/

.data
.align	eval(512*1024)
user_data_start:

.global event_queue_base
event_queue_base:
	.skip	1024
user_data_end:


SECTION .HTRAPS
.data
.global pm_pme_intr_count
pm_pme_intr_count:
        .byte   0             ! interrupt count for PM_PME
.global pme_to_ack_intr_count
pme_to_ack_intr_count:
        .byte   0             ! interrupt count for PME_TO_ACK

.end

/************************************************************************/
