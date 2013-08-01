/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_pci_dup_intx.s
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

#define INTR0x60_MONDO_IV 63

#define INTR0x60_MONDO_20_V 1
#define INTR0x60_MONDO_20_THREAD 1
#define INTR0x60_MONDO_20_CNTRL 0

#define INTR0x60_MONDO_21_V 1
#define INTR0x60_MONDO_21_THREAD 2
#define INTR0x60_MONDO_21_CNTRL 1

#define INTR0x60_MONDO_22_V 1
#define INTR0x60_MONDO_22_THREAD 4
#define INTR0x60_MONDO_22_CNTRL 2

#define INTR0x60_MONDO_23_V 1
#define INTR0x60_MONDO_23_THREAD 6
#define INTR0x60_MONDO_23_CNTRL 3


#define INTR0x60_INTA_EXTRA_HANDLER \
    setx intr_count, %g4, %g3; \
    add  %g3, %g1, %g3; \
    ldub [%g3], %g4; \
    inc  %g4; \
    stb  %g4, [%g3]
#define INTR0x60_INTB_EXTRA_HANDLER INTR0x60_INTA_EXTRA_HANDLER
#define INTR0x60_INTC_EXTRA_HANDLER INTR0x60_INTA_EXTRA_HANDLER
#define INTR0x60_INTD_EXTRA_HANDLER INTR0x60_INTA_EXTRA_HANDLER

#include "interrupt0x60_defines.h"


#define SYNC_THREADS 1

#include "hboot.s"
#include "peu_defines.h"
#include "ncu_defines.h"
#include "cmp_macros.h"

#include "interrupt0x60_handler.s"


/* Extra user events that happen inside the trap handler code */
! $EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_inta)) -> EnablePCIeIgCmd ("INTA", 0, 0, "DEASSERT", 1, *, 1 )
! $EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_intb)) -> EnablePCIeIgCmd ("INTB", 0, 0, "DEASSERT", 1, *, 1 )
! $EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_intc)) -> EnablePCIeIgCmd ("INTC", 0, 0, "DEASSERT", 1, *, 1 )
! $EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_intd)) -> EnablePCIeIgCmd ("INTD", 0, 0, "DEASSERT", 1, *, 1 )


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
    brnz %g1, main_target
    nop


/**************************************************************/
/* We are the "source" thread that sends interrupts */
main_source:
    /* Kick off the interrupts */

send_inta_intr1:
    ! user event to generate ASSERT_INTA msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_inta_intr1)) -> EnablePCIeIgCmd ("INTA", 0, 0, "ASSERT", 1, *, 1 )
    nop

send_inta_intr2:
    ! user event to generate ASSERT_INTA msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_inta_intr2)) -> EnablePCIeIgCmd ("INTA", 0, 0, "ASSERT", 1, *, 1 )
    nop

send_intd_intr1:
    ! user event to generate ASSERT_INTD msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_intd_intr1)) -> EnablePCIeIgCmd ("INTD", 0, 0, "ASSERT", 1, *, 1 )
    nop

send_intd_intr2:
    ! user event to generate ASSERT_INTD msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_intd_intr2)) -> EnablePCIeIgCmd ("INTD", 0, 0, "ASSERT", 1, *, 1 )
    nop

send_intb_intr1:
    ! user event to generate ASSERT_INTB msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_intb_intr1)) -> EnablePCIeIgCmd ("INTB", 0, 0, "ASSERT", 1, *, 1 )
    nop

send_intb_intr2:
    ! user event to generate ASSERT_INTB msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_intb_intr2)) -> EnablePCIeIgCmd ("INTB", 0, 0, "ASSERT", 1, *, 1 )
    nop

send_intc_intr1:
    ! user event to generate ASSERT_INTC msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_intc_intr1)) -> EnablePCIeIgCmd ("INTC", 0, 0, "ASSERT", 1, *, 1 )
    nop

send_intc_intr2:
    ! user event to generate ASSERT_INTC msg.
    nop    ! $EV trig_pc_d(1, @VA(.MAIN.send_intc_intr2)) -> EnablePCIeIgCmd ("INTC", 0, 0, "ASSERT", 1, *, 1 )
    nop

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

    best_set_reg(0x200, %l1, %g2)		! timeout count

intr_wait_loop_top_2:
    ldub  [%g3], %g5
    cmp  %g5, %g4
    be   thread_got_expected_intr_count
    dec  %g2

    cmp  %g2, 0
    bne  intr_wait_loop_top_2
    nop

intr_timeout:
    !$EV trig_pc_d(1, @VA(.MAIN.intr_timeout)) -> printf("ERROR: Timeout waiting for interrupt",*,1)
    EXIT_BAD
	
thread_got_expected_intr_count:
    setx num_threads_waiting_for_expected_intr_count, %l1, %l2
    lduw [%l2], %l3
decrement_waiting_threads:
    sub  %l3, 1, %l4
    cas  [%l2], %l3, %l4
    cmp  %l3, %l4
    bne  decrement_waiting_threads
    mov  %l4, %l3               ! to avoid another lduw for the branching case

wait_for_all_threads:
    lduw [%l2], %l3
    brnz %l3, wait_for_all_threads
    mov  100, %l7

delay_before_final_check:       ! allow time for unexpected interrupts
    dec  %l7
    brgz %l7, delay_before_final_check

final_check:
    ldub  [%g3], %g5
    cmp  %g5, %g4
    bne  local_test_failed
    nop

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
num_threads_waiting_for_expected_intr_count:
        .word   8
intr_expect:
        .byte   0             ! expected interrupt count for thread 0
        .byte   1             ! expected interrupt count for thread 1
        .byte   1             ! expected interrupt count for thread 2
        .byte   0             ! expected interrupt count for thread 3
        .byte   1             ! expected interrupt count for thread 4
        .byte   0             ! expected interrupt count for thread 5
        .byte   1             ! expected interrupt count for thread 6
        .byte   0             ! expected interrupt count for thread 7
user_data_end:


SECTION .HTRAPS
.data
.global intr_count
intr_count:
        .byte   0             ! interrupt count for thread 0
        .byte   0             ! interrupt count for thread 1
        .byte   0             ! interrupt count for thread 2
        .byte   0             ! interrupt count for thread 3
        .byte   0             ! interrupt count for thread 4
        .byte   0             ! interrupt count for thread 5
        .byte   0             ! interrupt count for thread 6
        .byte   0             ! interrupt count for thread 7

.end

/************************************************************************/
