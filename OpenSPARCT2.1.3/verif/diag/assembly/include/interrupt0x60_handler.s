/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt0x60_handler.s
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
#ifdef USE_BOBO
#include "bobo_defines.h"
#endif /* USE_BOBO */

SECTION .HTRAPS
.text
.global intr0x60_handler

intr0x60_handler:
    mov     %g7, %o7                    ! Restore %o7
    ldxa    [%g0] ASI_INTR_ID, %g1      ! Get the thread number

    ldxa    [%g0] ASI_INTR_R, %g2       ! Get the interrupt vector number

    setx    intr0x60_ivn_to_ig, %g4, %g3
    ldub    [%g3+%g2], %g4

    cmp     %g4, INTR0x60_IG_CC
    be      intr0x60_handle_cc
    nop

#ifdef INTR0x60_NIU_TX_IV_0
    cmp     %g4, INTR0x60_IG_NIU_TX
    be      intr0x60_handle_niu_tx
    nop
#endif /* INTR0x60_NIU_TX_IV_0 */

#ifdef INTR0x60_NIU_RX_IV_0
    cmp     %g4, INTR0x60_IG_NIU_RX
    be      intr0x60_handle_niu_rx
    nop
#endif /* INTR0x60_NIU_RX_IV_0 */

#ifdef INTR0x60_MONDO_IV
    cmp     %g4, INTR0x60_IG_PIU
    be      intr0x60_handle_piu
    nop
#endif /* INTR0x60_MONDO_IV */

#if (INTR0x60_SSI_ERR_IV != INTR0x60_BAD_IV)
    cmp     %g4, INTR0x60_IG_SSI_ERR
    be      intr0x60_handle_ssi_err
    nop
#endif /* (INTR0x60_SSI_ERR_IV != INTR0x60_BAD_IV) */

#if (INTR0x60_SSI_INT_IV != INTR0x60_BAD_IV)
    cmp     %g4, INTR0x60_IG_SSI_INT
    be      intr0x60_handle_ssi_int
    nop
#endif /* (INTR0x60_SSI_INT_IV != INTR0x60_BAD_IV) */

/* If we get here, we got an unexpected vector number */
intr0x60_bad_ivn:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_bad_ivn)) -> printf("ERROR: Bad interrupt vector number",*,1)
    EXIT_BAD


/************************************************************************/
/* Handle cross-call interrupts */

intr0x60_handle_cc:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_cc)) -> printf("INFO: Cross-call interrupt received",*,1)
#ifndef INTR0x60_CC_DEST_ALL
    /* Make sure that this thread is allowed to receive cross-calls */
    setx intr0x60_handle_cc_thread_table, %g5, %g4
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g5
    ldub [%g4+%g5], %g4
#else
    ldub [%g4+%g1], %g4
#endif
    brz  %g4, intr0x60_handle_cc_bad_thread
    nop
#endif /* INTR0x60_CC_DEST_ALL */

    /* Include any extra cross-call handler from the user */
    /* The code can assume that %g1 is the thread and %g2 is the vector */
#ifdef INTR0x60_CC_EXTRA_HANDLER
intr0x60_handle_cc_extra_handler:
INTR0x60_CC_EXTRA_HANDLER
#endif /* INTR0x60_CC_EXTRA_HANDLER */

intr0x60_handle_cc_retry:
    /* Retry the instruction that was trapped */
    retry

#ifndef INTR0x60_CC_DEST_ALL
intr0x60_handle_cc_bad_thread:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_cc_bad_thread)) -> printf("ERROR: Cross-call received on unexpected thread",*,1)
    EXIT_BAD

.data
intr0x60_handle_cc_thread_table:
#if defined(INTR0x60_CC_DEST_0)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_1)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_2)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_3)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_4)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_5)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_6)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_7)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_8)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_9)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_10)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_11)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_12)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_13)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_14)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_15)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_16)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_17)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_18)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_19)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_20)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_21)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_22)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_23)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_24)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_25)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_26)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_27)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_28)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_29)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_30)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_31)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_32)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_33)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_34)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_35)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_36)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_37)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_38)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_39)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_40)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_41)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_42)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_43)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_44)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_45)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_46)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_47)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_48)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_49)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_50)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_51)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_52)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_53)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_54)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_55)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_56)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_57)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_58)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_59)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_60)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_61)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_62)
    .byte 1
#else
    .byte 0
#endif
#if defined(INTR0x60_CC_DEST_63)
    .byte 1
#else
    .byte 0
#endif

.text
#endif /* INTR0x60_CC_DEST_ALL */


#ifdef INTR0x60_NIU_TX_IV_0
/************************************************************************/
/* Handle NIU TX interrupts */

intr0x60_handle_niu_tx:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_niu_tx)) -> printf("INFO: NIU TX interrupt received",*,1)
    /* Make sure that this thread is the right one for this NIU interrupt */
#ifdef INTR0x60_NIU_TX_IV_0
intr0x60_handle_niu_tx_check_thread_0:
    cmp  %g2, INTR0x60_NIU_TX_IV_0
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_0
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_0
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_0, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_0 */

#ifdef INTR0x60_NIU_TX_IV_1
intr0x60_handle_niu_tx_check_thread_1:
    cmp  %g2, INTR0x60_NIU_TX_IV_1
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_1
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_1
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_1, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_1 */

#ifdef INTR0x60_NIU_TX_IV_2
intr0x60_handle_niu_tx_check_thread_2:
    cmp  %g2, INTR0x60_NIU_TX_IV_2
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_2
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_2
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_2, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_2 */

#ifdef INTR0x60_NIU_TX_IV_3
intr0x60_handle_niu_tx_check_thread_3:
    cmp  %g2, INTR0x60_NIU_TX_IV_3
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_3
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_3
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_3, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_3 */

#ifdef INTR0x60_NIU_TX_IV_4
intr0x60_handle_niu_tx_check_thread_4:
    cmp  %g2, INTR0x60_NIU_TX_IV_4
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_4
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_4
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_4, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_4 */

#ifdef INTR0x60_NIU_TX_IV_5
intr0x60_handle_niu_tx_check_thread_5:
    cmp  %g2, INTR0x60_NIU_TX_IV_5
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_5
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_5
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_5, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_5 */

#ifdef INTR0x60_NIU_TX_IV_6
intr0x60_handle_niu_tx_check_thread_6:
    cmp  %g2, INTR0x60_NIU_TX_IV_6
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_6
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_6
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_6, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_6 */

#ifdef INTR0x60_NIU_TX_IV_7
intr0x60_handle_niu_tx_check_thread_7:
    cmp  %g2, INTR0x60_NIU_TX_IV_7
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_7
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_7
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_7, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_7 */

#ifdef INTR0x60_NIU_TX_IV_8
intr0x60_handle_niu_tx_check_thread_8:
    cmp  %g2, INTR0x60_NIU_TX_IV_8
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_8
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_8
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_8, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_8 */

#ifdef INTR0x60_NIU_TX_IV_9
intr0x60_handle_niu_tx_check_thread_9:
    cmp  %g2, INTR0x60_NIU_TX_IV_9
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_9
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_9
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_9, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_9 */

#ifdef INTR0x60_NIU_TX_IV_10
intr0x60_handle_niu_tx_check_thread_10:
    cmp  %g2, INTR0x60_NIU_TX_IV_10
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_10
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_10
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_10, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_10 */

#ifdef INTR0x60_NIU_TX_IV_11
intr0x60_handle_niu_tx_check_thread_11:
    cmp  %g2, INTR0x60_NIU_TX_IV_11
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_11
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_11
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_11, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_11 */

#ifdef INTR0x60_NIU_TX_IV_12
intr0x60_handle_niu_tx_check_thread_12:
    cmp  %g2, INTR0x60_NIU_TX_IV_12
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_12
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_12
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_12, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_12 */

#ifdef INTR0x60_NIU_TX_IV_13
intr0x60_handle_niu_tx_check_thread_13:
    cmp  %g2, INTR0x60_NIU_TX_IV_13
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_13
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_13
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_13, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_13 */

#ifdef INTR0x60_NIU_TX_IV_14
intr0x60_handle_niu_tx_check_thread_14:
    cmp  %g2, INTR0x60_NIU_TX_IV_14
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_14
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_14
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_14, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_14 */

#ifdef INTR0x60_NIU_TX_IV_15
intr0x60_handle_niu_tx_check_thread_15:
    cmp  %g2, INTR0x60_NIU_TX_IV_15
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_TX_THREAD_15
#else
    cmp  %g1, INTR0x60_NIU_TX_THREAD_15
#endif
    bnz  intr0x60_handle_niu_tx_bad_thread
    best_set_reg(INTR0x60_NIU_TX_DMA_15, %g7, %g3)
    ba   intr0x60_handle_niu_tx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_TX_IV_15 */


    /* If we get here, we have an unknown vector */
intr0x60_handle_niu_tx_bad_vector:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_niu_tx_bad_vector)) -> printf("interrupt0x60_handler.s ERROR: intr0x60_iv_to_ig said this is an NIU TX interrupt, but it is not defined in INTR0x60_NIU_TX_IV_x",*,1)
    EXIT_BAD

    /* If we get here, we know we have the right thread for this vector */
intr0x60_handle_niu_tx_good_thread:
    /* Clear the source of the interrupt */
    ! Re-enable the interrupt in the transmit DMA channel
    best_set_reg(TX_CS, %g7, %g4)			! TX_CS
    best_set_reg(TDMC_STEP, %g7, %g5)
    mulx    %g5, %g3, %g5       ! %g3 is the DMA TX channel
    add     %g4, %g5, %g4
    ldxa    [%g4]ASI_PRIMARY_LITTLE, %g0	! Reset MK

    ! Re-enable the interrupt in the NIU
    best_set_reg(LDGIMGN, %g7, %g4)          ! LDGIMGN
    best_set_reg(LDGIMGN_STEP, %g7, %g5)
    mulx    %g5, %g2, %g5
    add     %g4, %g5, %g4
    best_set_reg(0x80000001, %g7, %g5)
    stxa    %g5, [%g4]ASI_PRIMARY_LITTLE
    nop

    /* Include any extra NIU handler from the user */
    /* The code can assume that %g1 is the thread, %g2 is the vector,
     * and %g3 is the TX DMA channel */
#ifdef INTR0x60_NIU_TX_EXTRA_HANDLER
intr0x60_handle_niu_tx_extra_handler:
INTR0x60_NIU_TX_EXTRA_HANDLER
#endif /* INTR0x60_NIU_TX_EXTRA_HANDLER */

intr0x60_handle_niu_tx_retry:
    /* Retry the instruction that was trapped */
    retry

intr0x60_handle_niu_tx_bad_thread:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_niu_tx_bad_thread)) -> printf("ERROR: NIU TX interrupt received on unexpected thread",*,1)
    EXIT_BAD
#endif /* INTR0x60_NIU_TX_IV_0 */


#ifdef INTR0x60_NIU_RX_IV_0
/************************************************************************/
/* Handle NIU RX interrupts */

intr0x60_handle_niu_rx:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_niu_rx)) -> printf("INFO: NIU RX interrupt received",*,1)
    /* Make sure that this thread is the right one for this NIU interrupt */
#ifdef INTR0x60_NIU_RX_IV_0
intr0x60_handle_niu_rx_check_thread_0:
    cmp  %g2, INTR0x60_NIU_RX_IV_0
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_0
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_0
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_0, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_0 */

#ifdef INTR0x60_NIU_RX_IV_1
intr0x60_handle_niu_rx_check_thread_1:
    cmp  %g2, INTR0x60_NIU_RX_IV_1
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_1
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_1
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_1, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_1 */

#ifdef INTR0x60_NIU_RX_IV_2
intr0x60_handle_niu_rx_check_thread_2:
    cmp  %g2, INTR0x60_NIU_RX_IV_2
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_2
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_2
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_2, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_2 */

#ifdef INTR0x60_NIU_RX_IV_3
intr0x60_handle_niu_rx_check_thread_3:
    cmp  %g2, INTR0x60_NIU_RX_IV_3
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_3
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_3
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_3, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_3 */

#ifdef INTR0x60_NIU_RX_IV_4
intr0x60_handle_niu_rx_check_thread_4:
    cmp  %g2, INTR0x60_NIU_RX_IV_4
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_4
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_4
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_4, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_4 */

#ifdef INTR0x60_NIU_RX_IV_5
intr0x60_handle_niu_rx_check_thread_5:
    cmp  %g2, INTR0x60_NIU_RX_IV_5
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_5
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_5
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_5, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_5 */

#ifdef INTR0x60_NIU_RX_IV_6
intr0x60_handle_niu_rx_check_thread_6:
    cmp  %g2, INTR0x60_NIU_RX_IV_6
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_6
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_6
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_6, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_6 */

#ifdef INTR0x60_NIU_RX_IV_7
intr0x60_handle_niu_rx_check_thread_7:
    cmp  %g2, INTR0x60_NIU_RX_IV_7
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_7
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_7
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_7, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_7 */

#ifdef INTR0x60_NIU_RX_IV_8
intr0x60_handle_niu_rx_check_thread_8:
    cmp  %g2, INTR0x60_NIU_RX_IV_8
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_8
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_8
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_8, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_8 */

#ifdef INTR0x60_NIU_RX_IV_9
intr0x60_handle_niu_rx_check_thread_9:
    cmp  %g2, INTR0x60_NIU_RX_IV_9
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_9
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_9
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_9, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_9 */

#ifdef INTR0x60_NIU_RX_IV_10
intr0x60_handle_niu_rx_check_thread_10:
    cmp  %g2, INTR0x60_NIU_RX_IV_10
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_10
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_10
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_10, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_10 */

#ifdef INTR0x60_NIU_RX_IV_11
intr0x60_handle_niu_rx_check_thread_11:
    cmp  %g2, INTR0x60_NIU_RX_IV_11
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_11
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_11
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_11, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_11 */

#ifdef INTR0x60_NIU_RX_IV_12
intr0x60_handle_niu_rx_check_thread_12:
    cmp  %g2, INTR0x60_NIU_RX_IV_12
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_12
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_12
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_12, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_12 */

#ifdef INTR0x60_NIU_RX_IV_13
intr0x60_handle_niu_rx_check_thread_13:
    cmp  %g2, INTR0x60_NIU_RX_IV_13
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_13
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_13
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_13, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_13 */

#ifdef INTR0x60_NIU_RX_IV_14
intr0x60_handle_niu_rx_check_thread_14:
    cmp  %g2, INTR0x60_NIU_RX_IV_14
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_14
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_14
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_14, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_14 */

#ifdef INTR0x60_NIU_RX_IV_15
intr0x60_handle_niu_rx_check_thread_15:
    cmp  %g2, INTR0x60_NIU_RX_IV_15
    bnz  1f
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, INTR0x60_NIU_RX_THREAD_15
#else
    cmp  %g1, INTR0x60_NIU_RX_THREAD_15
#endif
    bnz  intr0x60_handle_niu_rx_bad_thread
    best_set_reg(INTR0x60_NIU_RX_DMA_15, %g7, %g3)
    ba   intr0x60_handle_niu_rx_good_thread
    nop
1:
#endif /* INTR0x60_NIU_RX_IV_15 */


    /* If we get here, we have an unknown vector */
intr0x60_handle_niu_rx_bad_vector:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_niu_rx_bad_vector)) -> printf("interrupt0x60_handler.s ERROR: intr0x60_iv_to_ig said this is an NIU RX interrupt, but it is not defined in INTR0x60_NIU_RX_IV_x",*,1)
    EXIT_BAD

    /* If we get here, we know we have the right thread for this vector */
intr0x60_handle_niu_rx_good_thread:
    /* Clear the source of the interrupt */
    best_set_reg(RX_DMA_CTL_STAT, %g7, %g4)
    mulx    %g3, RX_DMA_CTL_STAT_STEP, %g7  ! %g3 is the DMA RX channel
    add     %g4, %g7, %g4       ! Addr of RX DMA Ctl/stat for this channel
intr0x60_handle_niu_rx_get_rx_dma_ctl_stat:
    ldxa    [%g4]ASI_PRIMARY_LITTLE, %g5  ! Get status
    mov     0x7, %g7
    sllx    %g7, 32, %g7        ! Mask for clear-on-reset error bits
    and     %g5, %g7, %g7
    brz     %g7, intr0x60_handle_niu_rx_nonfatal
    nop

intr0x60_handle_niu_rx_fatal_error:
#ifdef INTR0x60_NIU_RX_FATAL_HANDLER
INTR0x60_NIU_RX_FATAL_HANDLER
#else /* INTR0x60_NIU_RX_FATAL_HANDLER */
#ifdef INTR0x60_NIU_RX_CLEAR_FATAL_FOR_TSOTOOL
/* This code does what is needed for tsotool NIU RX fatal error interrupts */
    best_set_reg(RXDMA_CFIG1, %g7, %g4)
    mulx    %g3, RX_DMA_CTL_STAT_STEP, %g7  ! %g3 is the DMA RX channel
    add     %g4, %g7, %g4
intr0x60_handle_niu_rx_fatal_error_disable_dma_channel:
    stxa    %g0, [%g4]ASI_PRIMARY_LITTLE
    membar  #Sync
    mov     1, %g7
    sllx    %g7, 30, %g7        ! RST bit in RXDMA_CFIG1
intr0x60_handle_niu_rx_fatal_error_reset_dma_channel:
    stxa    %g7, [%g4]ASI_PRIMARY_LITTLE
    srlx    %g7, 1, %g7         ! QST bit in RXDMA_CFIG1
    mov     10, %g6             ! Timeout
intr0x60_handle_niu_rx_fatal_error_wait_for_dma_channel:
    ldxa    [%g4]ASI_PRIMARY_LITTLE, %g5  ! Get the status
    cmp     %g5, %g7
    beq     intr0x60_handle_niu_rx_fatal_error_enable_intr_for_dma_channel
    dec     %g6
    brnz    %g6, intr0x60_handle_niu_rx_fatal_error_wait_for_dma_channel
    nop
intr0x60_handle_niu_rx_fatal_error_timeout_wait_for_dma_channel:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_niu_rx_fatal_error_timeout_wait_for_dma_channel)) -> printf("ERROR: NIU RX interrupt received for fatal error and DMA channel reset never completed",*,1)
    EXIT_BAD
intr0x60_handle_niu_rx_fatal_error_enable_intr_for_dma_channel:
    best_set_reg(RX_DMA_ENT_MSK, %g7, %g5)
    mulx    %g3, RX_DMA_CTL_STAT_STEP, %g7  ! %g3 is the DMA RX channel
    add     %g5, %g7, %g5
    stxa    %g0, [%g5]ASI_PRIMARY_LITTLE
    ba      intr0x60_handle_niu_rx_reenable_ldg
    membar  #Sync
#else /* INTR0x60_NIU_RX_CLEAR_FATAL_FOR_TSOTOOL */
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_niu_rx_fatal_error)) -> printf("ERROR: NIU RX interrupt received for fatal error",*,1)
    EXIT_BAD
#endif /* INTR0x60_NIU_RX_CLEAR_FATAL_FOR_TSOTOOL */
#endif /* INTR0x60_NIU_RX_FATAL_HANDLER */

intr0x60_handle_niu_rx_nonfatal:
    best_set_reg(0xffffffffffff0000, %g7, %g6)
    and     %g5, %g6, %g5       ! Only preserve error bits, for RW1C
    best_set_reg(RCR_STAT_A, %g7, %g6)
    mulx    %g3, RX_DMA_CTL_STAT_STEP, %g7  ! %g3 is the DMA RX channel
    add     %g6, %g7, %g6
intr0x60_handle_niu_rx_get_rcr_stat_a:
    ldxa    [%g6]ASI_PRIMARY_LITTLE, %g6  ! Get the number of pkts received
    or      %g6, %g5, %g6
    best_set_reg(THRES_INT, %g7, %g5)     ! Bit to enable mailbox (MEX in PRM)
    or      %g6, %g5, %g6
intr0x60_handle_niu_rx_reset_rx_dma_ctl_stat:
    stxa    %g6, [%g4]ASI_PRIMARY_LITTLE  ! RW1C on RCRTHRES, RCRTO, etc., plus
                                          ! set MEX, decrement QLEN by pkt read
intr0x60_handle_niu_rx_reenable_ldg:
    ! Re-enable the interrupt in the NIU LDG
    best_set_reg(LDGIMGN, %g7, %g4)          ! LDGIMGN
    best_set_reg(LDGIMGN_STEP, %g7, %g5)
    mulx    %g5, %g2, %g5
    add     %g4, %g5, %g4
    best_set_reg(0x80000001, %g7, %g5)
    stxa    %g5, [%g4]ASI_PRIMARY_LITTLE  ! Arm LDGI, set timer to 1
    nop

    /* Include any extra NIU handler from the user */
    /* The code can assume that %g1 is the thread, %g2 is the vector,
     * and %g3 is the RX DMA channel */
#ifdef INTR0x60_NIU_RX_EXTRA_HANDLER
intr0x60_handle_niu_rx_extra_handler:
INTR0x60_NIU_RX_EXTRA_HANDLER
#endif /* INTR0x60_NIU_RX_EXTRA_HANDLER */

intr0x60_handle_niu_rx_retry:
    /* Retry the instruction that was trapped */
    retry

intr0x60_handle_niu_rx_bad_thread:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_niu_rx_bad_thread)) -> printf("ERROR: NIU RX interrupt received on unexpected thread",*,1)
    EXIT_BAD
#endif /* INTR0x60_NIU_RX_IV_0 */


#ifdef INTR0x60_MONDO_IV
/************************************************************************/
/* Handle PIU interrupts */

intr0x60_handle_piu:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu)) -> printf("INFO: PIU interrupt received",*,1)
#ifndef INTR0x60_DO_NOT_READ_ADATA1
    /* To reach coverage goals, do a dummy read from ADATA1 */
    best_set_reg(MONDO_INT_ADATA1, %g4, %g3)
    ldx  [%g3], %g3
#endif /* INTR0x60_DO_NOT_READ_ADATA1 */
    best_set_reg(MONDO_INT_ADATA0, %g4, %g3)
    ldx  [%g3], %g3
    and  %g3, 0x3f, %g3  /* WIP: Mask to get INO */
#if INTR0x60_MONDO_20_V
    cmp  %g3, 20
    be   intr0x60_handle_piu_inta
    nop
#endif /* INTR0x60_MONDO_20_V */
#if INTR0x60_MONDO_21_V
    cmp  %g3, 21
    be   intr0x60_handle_piu_intb
    nop
#endif /* INTR0x60_MONDO_21_V */
#if INTR0x60_MONDO_22_V
    cmp  %g3, 22
    be   intr0x60_handle_piu_intc
    nop
#endif /* INTR0x60_MONDO_22_V */
#if INTR0x60_MONDO_23_V
    cmp  %g3, 23
    be   intr0x60_handle_piu_intd
    nop
#endif /* INTR0x60_MONDO_23_V */
#ifdef INTR0x60_MSI_0_NUM
intr0x60_handle_piu_check_msi_0:
    cmp  %g3, mpeval(INTR0x60_MSI_0_EQN+24)
    be   intr0x60_handle_piu_msi_0
    mov  0, %g4
#endif /* INTR0x60_MSI_0_NUM */
#ifdef INTR0x60_MSI_1_NUM
intr0x60_handle_piu_check_msi_1:
    cmp  %g3, mpeval(INTR0x60_MSI_1_EQN+24)
    be   intr0x60_handle_piu_msi_1
    mov  1, %g4
#endif /* INTR0x60_MSI_1_NUM */
#ifdef INTR0x60_MSI_2_NUM
intr0x60_handle_piu_check_msi_2:
    cmp  %g3, mpeval(INTR0x60_MSI_2_EQN+24)
    be   intr0x60_handle_piu_msi_2
    mov  2, %g4
#endif /* INTR0x60_MSI_2_NUM */
#ifdef INTR0x60_MSI_3_NUM
intr0x60_handle_piu_check_msi_3:
    cmp  %g3, mpeval(INTR0x60_MSI_3_EQN+24)
    be   intr0x60_handle_piu_msi_3
    mov  3, %g4
#endif /* INTR0x60_MSI_3_NUM */
#ifdef INTR0x60_MSI_4_NUM
intr0x60_handle_piu_check_msi_4:
    cmp  %g3, mpeval(INTR0x60_MSI_4_EQN+24)
    be   intr0x60_handle_piu_msi_4
    mov  4, %g4
#endif /* INTR0x60_MSI_4_NUM */
#ifdef INTR0x60_MSI_5_NUM
intr0x60_handle_piu_check_msi_5:
    cmp  %g3, mpeval(INTR0x60_MSI_5_EQN+24)
    be   intr0x60_handle_piu_msi_5
    mov  5, %g4
#endif /* INTR0x60_MSI_5_NUM */
#ifdef INTR0x60_MSI_6_NUM
intr0x60_handle_piu_check_msi_6:
    cmp  %g3, mpeval(INTR0x60_MSI_6_EQN+24)
    be   intr0x60_handle_piu_msi_6
    mov  6, %g4
#endif /* INTR0x60_MSI_6_NUM */
#ifdef INTR0x60_MSI_7_NUM
intr0x60_handle_piu_check_msi_7:
    cmp  %g3, mpeval(INTR0x60_MSI_7_EQN+24)
    be   intr0x60_handle_piu_msi_7
    mov  7, %g4
#endif /* INTR0x60_MSI_7_NUM */
#ifdef INTR0x60_PM_PME_EQN
intr0x60_handle_piu_check_pm_pme:
    cmp  %g3, mpeval(INTR0x60_PM_PME_EQN+24)
    be   intr0x60_handle_piu_pm_pme
    nop
#endif /* INTR0x60_PM_PME_EQN */
#ifdef INTR0x60_PME_TO_ACK_EQN
intr0x60_handle_piu_check_pme_to_ack:
    cmp  %g3, mpeval(INTR0x60_PME_TO_ACK_EQN+24)
    be   intr0x60_handle_piu_pme_to_ack
    nop
#endif /* INTR0x60_PME_TO_ACK_EQN */

    /* If we get here, we got an unexpected INO */
intr0x60_bad_mondo_INO:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_bad_mondo_INO)) -> printf("ERROR: Bad mondo INO",*,1)
    EXIT_BAD

#if INTR0x60_MONDO_20_V
    /************ Handle INTA ***********/
intr0x60_handle_piu_inta:
    /* Check whether this thread matches this INO */
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7/*tid*/, INTR0x60_MONDO_20_THREAD
#else
    cmp  %g1/*tid*/, INTR0x60_MONDO_20_THREAD
#endif
    bne  intr0x60_handle_piu_bad_thread
    nop
    /* Clear the interrupt */
intr0x60_handle_piu_inta_deassert:
#ifdef FC_NO_PEU_VERA
#ifdef USE_BOBO
    ! Offset accesses by PCIE_MEM64_OFFSET since
    ! BAR is set that way. Physical addresses generated via TSB
    ! have this offset so mimic that when accessing directly, as here.
    best_set_reg(mpeval(N2_PCIE_BASE_ADDR
                        + MEM64_OFFSET_BASE_REG_DATA
                        + PCIE_MEM64_OFFSET
                        + BOBO_INTR_VECT_STATUS_OFFSET), %g7, %g4)
    ! Interrupt type
    mov  eval(1 << 0), %g5
#else /* USE_BOBO */
    ! Offset accesses by PCIE_MEM64_OFFSET since
    ! BAR is set that way. Physical addresses generated via TSB
    ! have this offset so mimic that when accessing directly, as here.
    best_set_reg(mpeval(N2_PCIE_BASE_ADDR
                        + MEM64_OFFSET_BASE_REG_DATA
                        + PCIE_MEM64_OFFSET
                        + (INTR0x60_MONDO_20_DMAEPT_ENGINE << 8)
                        + DMAEPT_INTERRUPT_ACK), %g7, %g4)
    ! Interrupt type
    best_set_reg(DMAEPT_INTERRUPT_ACK_INTA, %g7, %g5)
#endif /* USE_BOBO */
    stwa    %g5, [%g4] ASI_NL
#else /* FC_NO_PEU_VERA */
    ! $EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_inta_deassert)) -> EnablePCIeIgCmd ("INTA", 0, 0, "DEASSERT", 1, *, 1 )
#endif /* FC_NO_PEU_VERA */

    /* Loop on the INTX Status Register until the deassert message
     * has arrived and been processed. */
    best_set_reg(PCI_E_INTX_STATUS_ADDR, %g5, %g4)
    best_set_reg(INTR0x60_INTX_DEASSERT_TIMEOUT, %g5, %g6)
intr0x60_handle_piu_inta_deassert_loop:
    brz  %g6, intr0x60_handle_piu_inta_deassert_timeout
    dec  %g6
    ldx  [%g4], %g3
    and  %g3, 8, %g3          ! 8 == bit for INTA
    brnz %g3, intr0x60_handle_piu_inta_deassert_loop
    set	 1, %g3
intr0x60_handle_piu_inta_clear:
    best_set_reg(PCI_E_INT_A_CLEAR_ADDR, %g5, %g4)
    stx  %g3, [%g4]
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR+0*PCI_E_INT_CLEAR_STEP), %g5, %g4)
    stx  %g0, [%g4]
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra INTA handler from the user */
    /* The code can assume that %g1 is the thread and %g2 is the vector */
#ifdef INTR0x60_INTA_EXTRA_HANDLER
intr0x60_handle_inta_extra_handler:
INTR0x60_INTA_EXTRA_HANDLER
#endif /* INTR0x60_INTA_EXTRA_HANDLER */

intr0x60_handle_piu_inta_retry:
    /* Retry the instruction that was trapped */
    retry
#endif /* INTR0x60_MONDO_20_V */

    /* If we get here, the interrupt status bit didn't deassert */
intr0x60_handle_piu_inta_deassert_timeout:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_inta_deassert_timeout)) -> printf("ERROR: INTA status bit did not deassert within INTR0x60_INTX_DEASSERT_TIMEOUT iterations",*,1)
    EXIT_BAD


#if INTR0x60_MONDO_21_V
    /************ Handle INTB ***********/
intr0x60_handle_piu_intb:
    /* Check whether this thread matches this INO */
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7/*tid*/, INTR0x60_MONDO_21_THREAD
#else
    cmp  %g1/*tid*/, INTR0x60_MONDO_21_THREAD
#endif
    bne  intr0x60_handle_piu_bad_thread
    nop
    /* Clear the interrupt */
intr0x60_handle_piu_intb_deassert:
#ifdef FC_NO_PEU_VERA
#ifdef USE_BOBO
    ! Offset accesses by PCIE_MEM64_OFFSET since
    ! BAR is set that way. Physical addresses generated via TSB
    ! have this offset so mimic that when accessing directly, as here.
    best_set_reg(mpeval(N2_PCIE_BASE_ADDR
                        + MEM64_OFFSET_BASE_REG_DATA
                        + PCIE_MEM64_OFFSET
                        + BOBO_INTR_VECT_STATUS_OFFSET), %g7, %g4)
    ! Interrupt type
    mov  eval(1 << 1), %g5
#else /* USE_BOBO */
    ! Offset accesses by PCIE_MEM64_OFFSET since
    ! BAR is set that way. Physical addresses generated via TSB
    ! have this offset so mimic that when accessing directly, as here.
    best_set_reg(mpeval(N2_PCIE_BASE_ADDR
                        + MEM64_OFFSET_BASE_REG_DATA
                        + PCIE_MEM64_OFFSET
                        + (INTR0x60_MONDO_21_DMAEPT_ENGINE << 8)
                        + DMAEPT_INTERRUPT_ACK), %g7, %g4)
    ! Interrupt type
    best_set_reg(DMAEPT_INTERRUPT_ACK_INTB, %g7, %g5)
#endif /* USE_BOBO */
    stwa    %g5, [%g4] ASI_NL
#else /* FC_NO_PEU_VERA */
    ! $EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_intb_deassert)) -> EnablePCIeIgCmd ("INTB", 0, 0, "DEASSERT", 1, *, 1 )
#endif /* FC_NO_PEU_VERA */

    /* Loop on the INTX Status Register until the deassert message
     * has arrived and been processed. */
    best_set_reg(PCI_E_INTX_STATUS_ADDR, %g5, %g4)
    best_set_reg(INTR0x60_INTX_DEASSERT_TIMEOUT, %g5, %g6)
intr0x60_handle_piu_intb_deassert_loop:
    brz  %g6, intr0x60_handle_piu_intb_deassert_timeout
    dec  %g6
    ldx  [%g4], %g3
    and  %g3, 4, %g3          ! 4 == bit for INTB
    brnz %g3, intr0x60_handle_piu_intb_deassert_loop
    set	 1, %g3
intr0x60_handle_piu_intb_clear:
    best_set_reg(PCI_E_INT_B_CLEAR_ADDR, %g5, %g4)
    stx  %g3, [%g4]
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR+1*PCI_E_INT_CLEAR_STEP), %g5, %g4)
    stx  %g0, [%g4]
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra INTB handler from the user */
    /* The code can assume that %g1 is the thread and %g2 is the vector */
#ifdef INTR0x60_INTB_EXTRA_HANDLER
intr0x60_handle_intb_extra_handler:
INTR0x60_INTB_EXTRA_HANDLER
#endif /* INTR0x60_INTB_EXTRA_HANDLER */

intr0x60_handle_piu_intb_retry:
    /* Retry the instruction that was trapped */
    retry
#endif /* INTR0x60_MONDO_21_V */

    /* If we get here, the interrupt status bit didn't deassert */
intr0x60_handle_piu_intb_deassert_timeout:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_intb_deassert_timeout)) -> printf("ERROR: INTB status bit did not deassert within INTR0x60_INTX_DEASSERT_TIMEOUT iterations",*,1)
    EXIT_BAD


#if INTR0x60_MONDO_22_V
    /************ Handle INTC ***********/
intr0x60_handle_piu_intc:
    /* Check whether this thread matches this INO */
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7/*tid*/, INTR0x60_MONDO_22_THREAD
#else
    cmp  %g1/*tid*/, INTR0x60_MONDO_22_THREAD
#endif
    bne  intr0x60_handle_piu_bad_thread
    nop
    /* Clear the interrupt */
intr0x60_handle_piu_intc_deassert:
#ifdef FC_NO_PEU_VERA
#ifdef USE_BOBO
    ! Offset accesses by PCIE_MEM64_OFFSET since
    ! BAR is set that way. Physical addresses generated via TSB
    ! have this offset so mimic that when accessing directly, as here.
    best_set_reg(mpeval(N2_PCIE_BASE_ADDR
                        + MEM64_OFFSET_BASE_REG_DATA
                        + PCIE_MEM64_OFFSET
                        + BOBO_INTR_VECT_STATUS_OFFSET), %g7, %g4)
    ! Interrupt type
    mov  eval(1 << 2), %g5
#else /* USE_BOBO */
    ! Offset accesses by PCIE_MEM64_OFFSET since
    ! BAR is set that way. Physical addresses generated via TSB
    ! have this offset so mimic that when accessing directly, as here.
    best_set_reg(mpeval(N2_PCIE_BASE_ADDR
                        + MEM64_OFFSET_BASE_REG_DATA
                        + PCIE_MEM64_OFFSET
                        + (INTR0x60_MONDO_22_DMAEPT_ENGINE << 8)
                        + DMAEPT_INTERRUPT_ACK), %g7, %g4)
    ! Interrupt type
    best_set_reg(DMAEPT_INTERRUPT_ACK_INTC, %g7, %g5)
#endif /* USE_BOBO */
    stwa    %g5, [%g4] ASI_NL
#else /* FC_NO_PEU_VERA */
    ! $EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_intc_deassert)) -> EnablePCIeIgCmd ("INTC", 0, 0, "DEASSERT", 1, *, 1 )
#endif /* FC_NO_PEU_VERA */

    /* Loop on the INTX Status Register until the deassert message
     * has arrived and been processed. */
    best_set_reg(PCI_E_INTX_STATUS_ADDR, %g5, %g4)
    best_set_reg(INTR0x60_INTX_DEASSERT_TIMEOUT, %g5, %g6)
intr0x60_handle_piu_intc_deassert_loop:
    brz  %g6, intr0x60_handle_piu_intc_deassert_timeout
    dec  %g6
    ldx  [%g4], %g3
    and  %g3, 2, %g3          ! 2 == bit for INTC
    brnz %g3, intr0x60_handle_piu_intc_deassert_loop
    set	 1, %g3
intr0x60_handle_piu_intc_clear:
    best_set_reg(PCI_E_INT_C_CLEAR_ADDR, %g5, %g4)
    stx  %g3, [%g4]
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR+2*PCI_E_INT_CLEAR_STEP), %g5, %g4)
    stx  %g0, [%g4]
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra INTC handler from the user */
    /* The code can assume that %g1 is the thread and %g2 is the vector */
#ifdef INTR0x60_INTC_EXTRA_HANDLER
intr0x60_handle_intc_extra_handler:
INTR0x60_INTC_EXTRA_HANDLER
#endif /* INTR0x60_INTC_EXTRA_HANDLER */

intr0x60_handle_piu_intc_retry:
    /* Retry the instruction that was trapped */
    retry
#endif /* INTR0x60_MONDO_22_V */

    /* If we get here, the interrupt status bit didn't deassert */
intr0x60_handle_piu_intc_deassert_timeout:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_intc_deassert_timeout)) -> printf("ERROR: INTC status bit did not deassert within INTR0x60_INTX_DEASSERT_TIMEOUT iterations",*,1)
    EXIT_BAD


#if INTR0x60_MONDO_23_V
    /************ Handle INTD ***********/
intr0x60_handle_piu_intd:
    /* Check whether this thread matches this INO */
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7/*tid*/, INTR0x60_MONDO_23_THREAD
#else
    cmp  %g1/*tid*/, INTR0x60_MONDO_23_THREAD
#endif
    bne  intr0x60_handle_piu_bad_thread
    nop
    /* Clear the interrupt */
intr0x60_handle_piu_intd_deassert:
#ifdef FC_NO_PEU_VERA
#ifdef USE_BOBO
    ! Offset accesses by PCIE_MEM64_OFFSET since
    ! BAR is set that way. Physical addresses generated via TSB
    ! have this offset so mimic that when accessing directly, as here.
    best_set_reg(mpeval(N2_PCIE_BASE_ADDR
                        + MEM64_OFFSET_BASE_REG_DATA
                        + PCIE_MEM64_OFFSET
                        + BOBO_INTR_VECT_STATUS_OFFSET), %g7, %g4)
    ! Interrupt type
    mov  eval(1 << 3), %g5
#else /* USE_BOBO */
    ! Offset accesses by PCIE_MEM64_OFFSET since
    ! BAR is set that way. Physical addresses generated via TSB
    ! have this offset so mimic that when accessing directly, as here.
    best_set_reg(mpeval(N2_PCIE_BASE_ADDR
                        + MEM64_OFFSET_BASE_REG_DATA
                        + PCIE_MEM64_OFFSET
                        + (INTR0x60_MONDO_23_DMAEPT_ENGINE << 8)
                        + DMAEPT_INTERRUPT_ACK), %g7, %g4)
    ! Interrupt type
    best_set_reg(DMAEPT_INTERRUPT_ACK_INTD, %g7, %g5)
#endif /* USE_BOBO */
    stwa    %g5, [%g4] ASI_NL
#else /* FC_NO_PEU_VERA */
    ! $EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_intd_deassert)) -> EnablePCIeIgCmd ("INTD", 0, 0, "DEASSERT", 1, *, 1 )
#endif /* FC_NO_PEU_VERA */

    /* Loop on the INTX Status Register until the deassert message
     * has arrived and been processed. */
    best_set_reg(PCI_E_INTX_STATUS_ADDR, %g5, %g4)
    best_set_reg(INTR0x60_INTX_DEASSERT_TIMEOUT, %g5, %g6)
intr0x60_handle_piu_intd_deassert_loop:
    brz  %g6, intr0x60_handle_piu_intd_deassert_timeout
    dec  %g6
    ldx  [%g4], %g3
    and  %g3, 1, %g3          ! 1 == bit for INTD
    brnz %g3, intr0x60_handle_piu_intd_deassert_loop
    set	 1, %g3
intr0x60_handle_piu_intd_clear:
    best_set_reg(PCI_E_INT_D_CLEAR_ADDR, %g5, %g4)
    stx  %g3, [%g4]
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR+3*PCI_E_INT_CLEAR_STEP), %g5, %g4)
    stx  %g0, [%g4]
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra INTD handler from the user */
    /* The code can assume that %g1 is the thread and %g2 is the vector */
#ifdef INTR0x60_INTD_EXTRA_HANDLER
intr0x60_handle_intd_extra_handler:
INTR0x60_INTD_EXTRA_HANDLER
#endif /* INTR0x60_INTD_EXTRA_HANDLER */

intr0x60_handle_piu_intd_retry:
    /* Retry the instruction that was trapped */
    retry
#endif /* INTR0x60_MONDO_23_V */

    /* If we get here, the interrupt status bit didn't deassert */
intr0x60_handle_piu_intd_deassert_timeout:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_intd_deassert_timeout)) -> printf("ERROR: INTD status bit did not deassert within INTR0x60_INTX_DEASSERT_TIMEOUT iterations",*,1)
    EXIT_BAD





#ifdef INTR0x60_MSI_0_NUM
    /************ Handle MSI 0 ***********/
intr0x60_handle_piu_msi_0:
!WIP:    /* Check whether this thread matches this INO */
!WIP:    cmp  %g1/*tid*/, INTR0x60_MONDO_XXX_THREAD
!WIP:    bne  intr0x60_handle_piu_bad_thread
!WIP:    nop
    /* Clear the interrupt */
    /* MSI Clear reg. */
intr0x60_handle_piu_msi_0_clear_eqwr:
    set	 1, %g4
    sllx %g4, 62, %g4           ! EQWR_N is bit 62
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_ADDR
                        +PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_0_NUM),
                 %g7, %g5)
    stx  %g4, [%g5]			! clear EQWR in MSI map reg.
    membar #Sync

intr0x60_handle_piu_msi_0_disable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! DIS is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_CLEAR_ADDR
                        +PCI_E_EV_QUE_CTL_CLEAR_STEP*INTR0x60_MSI_0_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ! Set Event Queue Head = Event Queue Tail
intr0x60_handle_piu_msi_0_reset_eq_head:
    best_set_reg(mpeval(PCI_E_EV_QUE_TAIL_ADDR
                        +PCI_E_EV_QUE_TAIL_STEP*INTR0x60_MSI_0_EQN),
                 %g7, %g5)
    ldx  [%g5], %g6
    best_set_reg(mpeval(PCI_E_EV_QUE_HEAD_ADDR
                        +PCI_E_EV_QUE_HEAD_STEP*INTR0x60_MSI_0_EQN),
                 %g7, %g5)
    stx  %g6, [%g5]

intr0x60_handle_piu_msi_0_clear_int:
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR
                        +(4+INTR0x60_MSI_0_EQN)*PCI_E_INT_CLEAR_STEP),
                 %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the mondo busy flag is still asserted. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_0_EXTRA_HANDLER_WHILE_BUSY
intr0x60_handle_msi_0_extra_handler_while_busy:
INTR0x60_MSI_0_EXTRA_HANDLER_WHILE_BUSY
#endif /* INTR0x60_MSI_0_EXTRA_HANDLER_WHILE_BUSY */

intr0x60_handle_piu_msi_0_clear_mondo_busy:
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the event queue is disabled. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
intr0x60_handle_msi_extra_handler_while_eq_disabled_0:
INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
#endif /* INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED */

intr0x60_handle_piu_msi_0_enable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! EN is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_ADDR
                        +PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_0_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ba   intr0x60_handle_msi_extra_handler
    nop
#endif /* INTR0x60_MSI_0_NUM */


#ifdef INTR0x60_MSI_1_NUM
    /************ Handle MSI 1 ***********/
intr0x60_handle_piu_msi_1:
!WIP:    /* Check whether this thread matches this INO */
!WIP:    cmp  %g1/*tid*/, INTR0x60_MONDO_XXX_THREAD
!WIP:    bne  intr0x60_handle_piu_bad_thread
!WIP:    nop
    /* Clear the interrupt */
    /* MSI Clear reg. */
intr0x60_handle_piu_msi_1_clear_eqwr:
    set	 1, %g4
    sllx %g4, 62, %g4           ! EQWR_N is bit 62
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_ADDR
                        +PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_1_NUM),
                 %g7, %g5)
    stx  %g4, [%g5]			! clear EQWR in MSI map reg.
    membar #Sync

intr0x60_handle_piu_msi_1_disable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! DIS is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_CLEAR_ADDR
                        +PCI_E_EV_QUE_CTL_CLEAR_STEP*INTR0x60_MSI_1_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ! Set Event Queue Head = Event Queue Tail
intr0x60_handle_piu_msi_1_reset_eq_head:
    best_set_reg(mpeval(PCI_E_EV_QUE_TAIL_ADDR
                        +PCI_E_EV_QUE_TAIL_STEP*INTR0x60_MSI_1_EQN),
                 %g7, %g5)
    ldx  [%g5], %g6
    best_set_reg(mpeval(PCI_E_EV_QUE_HEAD_ADDR
                        +PCI_E_EV_QUE_HEAD_STEP*INTR0x60_MSI_1_EQN),
                 %g7, %g5)
    stx  %g6, [%g5]

intr0x60_handle_piu_msi_1_clear_int:
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR
                        +(4+INTR0x60_MSI_1_EQN)*PCI_E_INT_CLEAR_STEP),
                 %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the mondo busy flag is still asserted. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_1_EXTRA_HANDLER_WHILE_BUSY
intr0x60_handle_msi_1_extra_handler_while_busy:
INTR0x60_MSI_1_EXTRA_HANDLER_WHILE_BUSY
#endif /* INTR0x60_MSI_1_EXTRA_HANDLER_WHILE_BUSY */

intr0x60_handle_piu_msi_1_clear_mondo_busy:
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the event queue is disabled. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
intr0x60_handle_msi_extra_handler_while_eq_disabled_1:
INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
#endif /* INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED */

intr0x60_handle_piu_msi_1_enable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! EN is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_ADDR
                        +PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_1_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ba   intr0x60_handle_msi_extra_handler
    nop
#endif /* INTR0x60_MSI_1_NUM */


#ifdef INTR0x60_MSI_2_NUM
    /************ Handle MSI 2 ***********/
intr0x60_handle_piu_msi_2:
!WIP:    /* Check whether this thread matches this INO */
!WIP:    cmp  %g1/*tid*/, INTR0x60_MONDO_XXX_THREAD
!WIP:    bne  intr0x60_handle_piu_bad_thread
!WIP:    nop
    /* Clear the interrupt */
    /* MSI Clear reg. */
intr0x60_handle_piu_msi_2_clear_eqwr:
    set	 1, %g4
    sllx %g4, 62, %g4           ! EQWR_N is bit 62
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_ADDR
                        +PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_2_NUM),
                 %g7, %g5)
    stx  %g4, [%g5]			! clear EQWR in MSI map reg.
    membar #Sync

intr0x60_handle_piu_msi_2_disable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! DIS is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_CLEAR_ADDR
                        +PCI_E_EV_QUE_CTL_CLEAR_STEP*INTR0x60_MSI_2_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ! Set Event Queue Head = Event Queue Tail
intr0x60_handle_piu_msi_2_reset_eq_head:
    best_set_reg(mpeval(PCI_E_EV_QUE_TAIL_ADDR
                        +PCI_E_EV_QUE_TAIL_STEP*INTR0x60_MSI_2_EQN),
                 %g7, %g5)
    ldx  [%g5], %g6
    best_set_reg(mpeval(PCI_E_EV_QUE_HEAD_ADDR
                        +PCI_E_EV_QUE_HEAD_STEP*INTR0x60_MSI_2_EQN),
                 %g7, %g5)
    stx  %g6, [%g5]

intr0x60_handle_piu_msi_2_clear_int:
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR
                        +(4+INTR0x60_MSI_2_EQN)*PCI_E_INT_CLEAR_STEP),
                 %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the mondo busy flag is still asserted. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_2_EXTRA_HANDLER_WHILE_BUSY
intr0x60_handle_msi_2_extra_handler_while_busy:
INTR0x60_MSI_2_EXTRA_HANDLER_WHILE_BUSY
#endif /* INTR0x60_MSI_2_EXTRA_HANDLER_WHILE_BUSY */

intr0x60_handle_piu_msi_2_clear_mondo_busy:
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the event queue is disabled. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
intr0x60_handle_msi_extra_handler_while_eq_disabled_2:
INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
#endif /* INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED */

intr0x60_handle_piu_msi_2_enable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! EN is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_ADDR
                        +PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_2_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ba   intr0x60_handle_msi_extra_handler
    nop
#endif /* INTR0x60_MSI_2_NUM */


#ifdef INTR0x60_MSI_3_NUM
    /************ Handle MSI 3 ***********/
intr0x60_handle_piu_msi_3:
!WIP:    /* Check whether this thread matches this INO */
!WIP:    cmp  %g1/*tid*/, INTR0x60_MONDO_XXX_THREAD
!WIP:    bne  intr0x60_handle_piu_bad_thread
!WIP:    nop
    /* Clear the interrupt */
    /* MSI Clear reg. */
intr0x60_handle_piu_msi_3_clear_eqwr:
    set	 1, %g4
    sllx %g4, 62, %g4           ! EQWR_N is bit 62
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_ADDR
                        +PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_3_NUM),
                 %g7, %g5)
    stx  %g4, [%g5]			! clear EQWR in MSI map reg.
    membar #Sync

intr0x60_handle_piu_msi_3_disable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! DIS is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_CLEAR_ADDR
                        +PCI_E_EV_QUE_CTL_CLEAR_STEP*INTR0x60_MSI_3_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ! Set Event Queue Head = Event Queue Tail
intr0x60_handle_piu_msi_3_reset_eq_head:
    best_set_reg(mpeval(PCI_E_EV_QUE_TAIL_ADDR
                        +PCI_E_EV_QUE_TAIL_STEP*INTR0x60_MSI_3_EQN),
                 %g7, %g5)
    ldx  [%g5], %g6
    best_set_reg(mpeval(PCI_E_EV_QUE_HEAD_ADDR
                        +PCI_E_EV_QUE_HEAD_STEP*INTR0x60_MSI_3_EQN),
                 %g7, %g5)
    stx  %g6, [%g5]

intr0x60_handle_piu_msi_3_clear_int:
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR
                        +(4+INTR0x60_MSI_3_EQN)*PCI_E_INT_CLEAR_STEP),
                 %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the mondo busy flag is still asserted. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_3_EXTRA_HANDLER_WHILE_BUSY
intr0x60_handle_msi_3_extra_handler_while_busy:
INTR0x60_MSI_3_EXTRA_HANDLER_WHILE_BUSY
#endif /* INTR0x60_MSI_3_EXTRA_HANDLER_WHILE_BUSY */

intr0x60_handle_piu_msi_3_clear_mondo_busy:
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the event queue is disabled. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
intr0x60_handle_msi_extra_handler_while_eq_disabled_3:
INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
#endif /* INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED */

intr0x60_handle_piu_msi_3_enable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! EN is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_ADDR
                        +PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_3_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ba   intr0x60_handle_msi_extra_handler
    nop
#endif /* INTR0x60_MSI_3_NUM */


#ifdef INTR0x60_MSI_4_NUM
    /************ Handle MSI 4 ***********/
intr0x60_handle_piu_msi_4:
!WIP:    /* Check whether this thread matches this INO */
!WIP:    cmp  %g1/*tid*/, INTR0x60_MONDO_XXX_THREAD
!WIP:    bne  intr0x60_handle_piu_bad_thread
!WIP:    nop
    /* Clear the interrupt */
    /* MSI Clear reg. */
intr0x60_handle_piu_msi_4_clear_eqwr:
    set	 1, %g4
    sllx %g4, 62, %g4           ! EQWR_N is bit 62
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_ADDR
                        +PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_4_NUM),
                 %g7, %g5)
    stx  %g4, [%g5]			! clear EQWR in MSI map reg.
    membar #Sync

intr0x60_handle_piu_msi_4_disable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! DIS is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_CLEAR_ADDR
                        +PCI_E_EV_QUE_CTL_CLEAR_STEP*INTR0x60_MSI_4_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ! Set Event Queue Head = Event Queue Tail
intr0x60_handle_piu_msi_4_reset_eq_head:
    best_set_reg(mpeval(PCI_E_EV_QUE_TAIL_ADDR
                        +PCI_E_EV_QUE_TAIL_STEP*INTR0x60_MSI_4_EQN),
                 %g7, %g5)
    ldx  [%g5], %g6
    best_set_reg(mpeval(PCI_E_EV_QUE_HEAD_ADDR
                        +PCI_E_EV_QUE_HEAD_STEP*INTR0x60_MSI_4_EQN),
                 %g7, %g5)
    stx  %g6, [%g5]

intr0x60_handle_piu_msi_4_clear_int:
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR
                        +(4+INTR0x60_MSI_4_EQN)*PCI_E_INT_CLEAR_STEP),
                 %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the mondo busy flag is still asserted. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_4_EXTRA_HANDLER_WHILE_BUSY
intr0x60_handle_msi_4_extra_handler_while_busy:
INTR0x60_MSI_4_EXTRA_HANDLER_WHILE_BUSY
#endif /* INTR0x60_MSI_4_EXTRA_HANDLER_WHILE_BUSY */

intr0x60_handle_piu_msi_4_clear_mondo_busy:
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the event queue is disabled. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
intr0x60_handle_msi_extra_handler_while_eq_disabled_4:
INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
#endif /* INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED */

intr0x60_handle_piu_msi_4_enable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! EN is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_ADDR
                        +PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_4_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ba   intr0x60_handle_msi_extra_handler
    nop
#endif /* INTR0x60_MSI_4_NUM */


#ifdef INTR0x60_MSI_5_NUM
    /************ Handle MSI 5 ***********/
intr0x60_handle_piu_msi_5:
!WIP:    /* Check whether this thread matches this INO */
!WIP:    cmp  %g1/*tid*/, INTR0x60_MONDO_XXX_THREAD
!WIP:    bne  intr0x60_handle_piu_bad_thread
!WIP:    nop
    /* Clear the interrupt */
    /* MSI Clear reg. */
intr0x60_handle_piu_msi_5_clear_eqwr:
    set	 1, %g4
    sllx %g4, 62, %g4           ! EQWR_N is bit 62
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_ADDR
                        +PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_5_NUM),
                 %g7, %g5)
    stx  %g4, [%g5]			! clear EQWR in MSI map reg.
    membar #Sync

intr0x60_handle_piu_msi_5_disable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! DIS is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_CLEAR_ADDR
                        +PCI_E_EV_QUE_CTL_CLEAR_STEP*INTR0x60_MSI_5_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ! Set Event Queue Head = Event Queue Tail
intr0x60_handle_piu_msi_5_reset_eq_head:
    best_set_reg(mpeval(PCI_E_EV_QUE_TAIL_ADDR
                        +PCI_E_EV_QUE_TAIL_STEP*INTR0x60_MSI_5_EQN),
                 %g7, %g5)
    ldx  [%g5], %g6
    best_set_reg(mpeval(PCI_E_EV_QUE_HEAD_ADDR
                        +PCI_E_EV_QUE_HEAD_STEP*INTR0x60_MSI_5_EQN),
                 %g7, %g5)
    stx  %g6, [%g5]

intr0x60_handle_piu_msi_5_clear_int:
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR
                        +(4+INTR0x60_MSI_5_EQN)*PCI_E_INT_CLEAR_STEP),
                 %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the mondo busy flag is still asserted. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_5_EXTRA_HANDLER_WHILE_BUSY
intr0x60_handle_msi_5_extra_handler_while_busy:
INTR0x60_MSI_5_EXTRA_HANDLER_WHILE_BUSY
#endif /* INTR0x60_MSI_5_EXTRA_HANDLER_WHILE_BUSY */

intr0x60_handle_piu_msi_5_clear_mondo_busy:
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the event queue is disabled. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
intr0x60_handle_msi_extra_handler_while_eq_disabled_5:
INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
#endif /* INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED */

intr0x60_handle_piu_msi_5_enable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! EN is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_ADDR
                        +PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_5_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ba   intr0x60_handle_msi_extra_handler
    nop
#endif /* INTR0x60_MSI_5_NUM */


#ifdef INTR0x60_MSI_6_NUM
    /************ Handle MSI 6 ***********/
intr0x60_handle_piu_msi_6:
!WIP:    /* Check whether this thread matches this INO */
!WIP:    cmp  %g1/*tid*/, INTR0x60_MONDO_XXX_THREAD
!WIP:    bne  intr0x60_handle_piu_bad_thread
!WIP:    nop
    /* Clear the interrupt */
    /* MSI Clear reg. */
intr0x60_handle_piu_msi_6_clear_eqwr:
    set	 1, %g4
    sllx %g4, 62, %g4           ! EQWR_N is bit 62
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_ADDR
                        +PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_6_NUM),
                 %g7, %g5)
    stx  %g4, [%g5]			! clear EQWR in MSI map reg.
    membar #Sync

intr0x60_handle_piu_msi_6_disable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! DIS is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_CLEAR_ADDR
                        +PCI_E_EV_QUE_CTL_CLEAR_STEP*INTR0x60_MSI_6_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ! Set Event Queue Head = Event Queue Tail
intr0x60_handle_piu_msi_6_reset_eq_head:
    best_set_reg(mpeval(PCI_E_EV_QUE_TAIL_ADDR
                        +PCI_E_EV_QUE_TAIL_STEP*INTR0x60_MSI_6_EQN),
                 %g7, %g5)
    ldx  [%g5], %g6
    best_set_reg(mpeval(PCI_E_EV_QUE_HEAD_ADDR
                        +PCI_E_EV_QUE_HEAD_STEP*INTR0x60_MSI_6_EQN),
                 %g7, %g5)
    stx  %g6, [%g5]

intr0x60_handle_piu_msi_6_clear_int:
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR
                        +(4+INTR0x60_MSI_6_EQN)*PCI_E_INT_CLEAR_STEP),
                 %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the mondo busy flag is still asserted. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_6_EXTRA_HANDLER_WHILE_BUSY
intr0x60_handle_msi_6_extra_handler_while_busy:
INTR0x60_MSI_6_EXTRA_HANDLER_WHILE_BUSY
#endif /* INTR0x60_MSI_6_EXTRA_HANDLER_WHILE_BUSY */

intr0x60_handle_piu_msi_6_clear_mondo_busy:
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the event queue is disabled. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
intr0x60_handle_msi_extra_handler_while_eq_disabled_6:
INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
#endif /* INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED */

intr0x60_handle_piu_msi_6_enable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! EN is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_ADDR
                        +PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_6_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ba   intr0x60_handle_msi_extra_handler
    nop
#endif /* INTR0x60_MSI_6_NUM */


#ifdef INTR0x60_MSI_7_NUM
    /************ Handle MSI 7 ***********/
intr0x60_handle_piu_msi_7:
!WIP:    /* Check whether this thread matches this INO */
!WIP:    cmp  %g1/*tid*/, INTR0x60_MONDO_XXX_THREAD
!WIP:    bne  intr0x60_handle_piu_bad_thread
!WIP:    nop
    /* Clear the interrupt */
    /* MSI Clear reg. */
intr0x60_handle_piu_msi_7_clear_eqwr:
    set	 1, %g4
    sllx %g4, 62, %g4           ! EQWR_N is bit 62
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_ADDR
                        +PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_7_NUM),
                 %g7, %g5)
    stx  %g4, [%g5]			! clear EQWR in MSI map reg.
    membar #Sync

intr0x60_handle_piu_msi_7_disable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! DIS is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_CLEAR_ADDR
                        +PCI_E_EV_QUE_CTL_CLEAR_STEP*INTR0x60_MSI_7_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ! Set Event Queue Head = Event Queue Tail
intr0x60_handle_piu_msi_7_reset_eq_head:
    best_set_reg(mpeval(PCI_E_EV_QUE_TAIL_ADDR
                        +PCI_E_EV_QUE_TAIL_STEP*INTR0x60_MSI_7_EQN),
                 %g7, %g5)
    ldx  [%g5], %g6
    best_set_reg(mpeval(PCI_E_EV_QUE_HEAD_ADDR
                        +PCI_E_EV_QUE_HEAD_STEP*INTR0x60_MSI_7_EQN),
                 %g7, %g5)
    stx  %g6, [%g5]

intr0x60_handle_piu_msi_7_clear_int:
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR
                        +(4+INTR0x60_MSI_7_EQN)*PCI_E_INT_CLEAR_STEP),
                 %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the mondo busy flag is still asserted. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_7_EXTRA_HANDLER_WHILE_BUSY
intr0x60_handle_msi_7_extra_handler_while_busy:
INTR0x60_MSI_7_EXTRA_HANDLER_WHILE_BUSY
#endif /* INTR0x60_MSI_7_EXTRA_HANDLER_WHILE_BUSY */

intr0x60_handle_piu_msi_7_clear_mondo_busy:
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra MSI handler from the user that needs to be
     * executed while the event queue is disabled. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
intr0x60_handle_msi_extra_handler_while_eq_disabled_7:
INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
#endif /* INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED */

intr0x60_handle_piu_msi_7_enable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! EN is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_ADDR
                        +PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_7_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ba   intr0x60_handle_msi_extra_handler
    nop
#endif /* INTR0x60_MSI_7_NUM */




    /* Include any extra MSI handler from the user */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
intr0x60_handle_msi_extra_handler:
#ifdef INTR0x60_MSI_EXTRA_HANDLER
INTR0x60_MSI_EXTRA_HANDLER
#endif /* INTR0x60_MSI_EXTRA_HANDLER */

intr0x60_handle_piu_msi_retry:
    /* Retry the instruction that was trapped */
    retry


#ifdef INTR0x60_PM_PME_EQN
    /************ Handle PM_PME ***********/
intr0x60_handle_piu_pm_pme:
!WIP:    /* Check whether this thread matches this INO */
!WIP:    cmp  %g1/*tid*/, INTR0x60_MONDO_XXX_THREAD
!WIP:    bne  intr0x60_handle_piu_bad_thread
!WIP:    nop
    /* Clear the interrupt */

intr0x60_handle_piu_pm_pme_disable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! DIS is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_CLEAR_ADDR
                        +PCI_E_EV_QUE_CTL_CLEAR_STEP*INTR0x60_PM_PME_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ! Set Event Queue Head = Event Queue Tail
intr0x60_handle_piu_pm_pme_reset_eq_head:
    best_set_reg(mpeval(PCI_E_EV_QUE_TAIL_ADDR
                        +PCI_E_EV_QUE_TAIL_STEP*INTR0x60_PM_PME_EQN),
                 %g7, %g5)
    ldx  [%g5], %g6
    best_set_reg(mpeval(PCI_E_EV_QUE_HEAD_ADDR
                        +PCI_E_EV_QUE_HEAD_STEP*INTR0x60_PM_PME_EQN),
                 %g7, %g5)
    stx  %g6, [%g5]

intr0x60_handle_piu_pm_pme_clear_int:
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR
                        +(4+INTR0x60_PM_PME_EQN)*PCI_E_INT_CLEAR_STEP),
                 %g5, %g4)
    stx  %g0, [%g4]

intr0x60_handle_piu_pm_pme_clear_mondo_busy:
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra PM_PME handler from the user that needs to be
     * executed while the event queue is disabled. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_PM_PME_EXTRA_HANDLER_WHILE_EQ_DISABLED
intr0x60_handle_pm_pme_extra_handler_while_eq_disabled:
INTR0x60_PM_PME_EXTRA_HANDLER_WHILE_EQ_DISABLED
#endif /* INTR0x60_PM_PME_EXTRA_HANDLER_WHILE_EQ_DISABLED */

intr0x60_handle_piu_pm_pme_enable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! EN is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_ADDR
                        +PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_PM_PME_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    /* Include any extra PM_PME handler from the user */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
intr0x60_handle_pm_pme_extra_handler:
#ifdef INTR0x60_PM_PME_EXTRA_HANDLER
INTR0x60_PM_PME_EXTRA_HANDLER
#endif /* INTR0x60_PM_PME_EXTRA_HANDLER */

intr0x60_handle_piu_pm_pme_retry:
    /* Retry the instruction that was trapped */
    retry
#endif /* INTR0x60_PM_PME_EQN */


#ifdef INTR0x60_PME_TO_ACK_EQN
    /************ Handle PME_TO_ACK ***********/
intr0x60_handle_piu_pme_to_ack:
!WIP:    /* Check whether this thread matches this INO */
!WIP:    cmp  %g1/*tid*/, INTR0x60_MONDO_XXX_THREAD
!WIP:    bne  intr0x60_handle_piu_bad_thread
!WIP:    nop
    /* Clear the interrupt */

intr0x60_handle_piu_pme_to_ack_disable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! DIS is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_CLEAR_ADDR
                        +PCI_E_EV_QUE_CTL_CLEAR_STEP*INTR0x60_PME_TO_ACK_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    ! Set Event Queue Head = Event Queue Tail
intr0x60_handle_piu_pme_to_ack_reset_eq_head:
    best_set_reg(mpeval(PCI_E_EV_QUE_TAIL_ADDR
                        +PCI_E_EV_QUE_TAIL_STEP*INTR0x60_PME_TO_ACK_EQN),
                 %g7, %g5)
    ldx  [%g5], %g6
    best_set_reg(mpeval(PCI_E_EV_QUE_HEAD_ADDR
                        +PCI_E_EV_QUE_HEAD_STEP*INTR0x60_PME_TO_ACK_EQN),
                 %g7, %g5)
    stx  %g6, [%g5]

intr0x60_handle_piu_pme_to_ack_clear_int:
    best_set_reg(mpeval(PCI_E_INT_CLEAR_ADDR
                        +(4+INTR0x60_PME_TO_ACK_EQN)*PCI_E_INT_CLEAR_STEP),
                 %g5, %g4)
    stx  %g0, [%g4]

intr0x60_handle_piu_pme_to_ack_clear_mondo_busy:
    best_set_reg(MONDO_INT_ABUSY, %g5, %g4)
    stx  %g0, [%g4]

    /* Include any extra PME_TO_ACK handler from the user that needs to be
     * executed while the event queue is disabled. */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
#ifdef INTR0x60_PME_TO_ACK_EXTRA_HANDLER_WHILE_EQ_DISABLED
intr0x60_handle_pme_to_ack_extra_handler_while_eq_disabled:
INTR0x60_PME_TO_ACK_EXTRA_HANDLER_WHILE_EQ_DISABLED
#endif /* INTR0x60_PME_TO_ACK_EXTRA_HANDLER_WHILE_EQ_DISABLED */

intr0x60_handle_piu_pme_to_ack_enable_eq:
    set  1, %g4
    sllx %g4, 44, %g4           ! EN is bit 44
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_ADDR
                        +PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_PME_TO_ACK_EQN),
                 %g7, %g5)
    stx  %g4, [%g5]

    /* Include any extra PME_TO_ACK handler from the user */
    /* The code can assume that %g1 is the thread,
     * %g2 is the vector, and
     * %g3 is the INO */
intr0x60_handle_pme_to_ack_extra_handler:
#ifdef INTR0x60_PME_TO_ACK_EXTRA_HANDLER
INTR0x60_PME_TO_ACK_EXTRA_HANDLER
#endif /* INTR0x60_PME_TO_ACK_EXTRA_HANDLER */

intr0x60_handle_piu_pme_to_ack_retry:
    /* Retry the instruction that was trapped */
    retry
#endif /* INTR0x60_PME_TO_ACK_EQN */


intr0x60_handle_piu_bad_thread:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_piu_bad_thread)) -> printf("ERROR: Mondo delivered to wrong thread",*,1)
    EXIT_BAD
#endif /* INTR0x60_MONDO_IV */


#if (INTR0x60_SSI_ERR_IV != INTR0x60_BAD_IV)
/************************************************************************/
/* Handle SSI parity error interrupts */

intr0x60_handle_ssi_err:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_ssi_err)) -> printf("INFO: SSI parity error interrupt received",*,1)
    /* Make sure that this thread is the right one */
    best_set_reg(INTR0x60_SSI_ERR_THREAD, %g7, %g4)
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, %g4
#else
    cmp  %g1, %g4
#endif
    bne  intr0x60_handle_ssi_err_bad_thread
    nop

    /* Include any extra SSI parity error handler from the user */
    /* The code can assume that %g1 is the thread and %g2 is the vector */
#ifdef INTR0x60_SSI_ERR_EXTRA_HANDLER
intr0x60_handle_ssi_err_extra_handler:
INTR0x60_SSI_ERR_EXTRA_HANDLER
#endif /* INTR0x60_SSI_ERR_EXTRA_HANDLER */

intr0x60_handle_ssi_err_retry:
    /* Retry the instruction that was trapped */
    retry

intr0x60_handle_ssi_err_bad_thread:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_ssi_err_bad_thread)) -> printf("ERROR: SSI parity error interrupt received on unexpected thread",*,1)
    EXIT_BAD
#endif /* (INTR0x60_SSI_ERR_IV != INTR0x60_BAD_IV) */


#if (INTR0x60_SSI_INT_IV != INTR0x60_BAD_IV)
/************************************************************************/
/* Handle SSI_EXT_INT_L interrupts */

intr0x60_handle_ssi_int:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_ssi_int)) -> printf("INFO: SSI_EXT_INT_L interrupt received",*,1)
    /* Make sure that this thread is the right one */
    best_set_reg(INTR0x60_SSI_INT_THREAD, %g7, %g4)
#ifdef PORTABLE_CORE
    and  %g1, 0x7, %g7
    cmp  %g7, %g4
#else
    cmp  %g1, %g4
#endif
    bne  intr0x60_handle_ssi_int_bad_thread
    nop

    /* Include any extra SSI_EXT_INT_L handler from the user */
    /* The code can assume that %g1 is the thread and %g2 is the vector */
#ifdef INTR0x60_SSI_INT_EXTRA_HANDLER
intr0x60_handle_ssi_int_extra_handler:
INTR0x60_SSI_INT_EXTRA_HANDLER
#endif /* INTR0x60_SSI_INT_EXTRA_HANDLER */

intr0x60_handle_ssi_int_retry:
    /* Retry the instruction that was trapped */
    retry

intr0x60_handle_ssi_int_bad_thread:
    !$EV trig_pc_d(1, @VA(.HTRAPS.intr0x60_handle_ssi_int_bad_thread)) -> printf("ERROR: SSI_EXT_INT_L interrupt received on unexpected thread",*,1)
    EXIT_BAD
#endif /* (INTR0x60_SSI_INT_IV != INTR0x60_BAD_IV) */




/*
 * Need to have some tables to identify the source of the interrupt
 * and whether it is expected for this thread.
 *
 * intr0x60_ivn_to_ig has one byte per interrupt vector number (0-63),
 *     which indicates the interrupt group, encoded as
 *          0 - unused (error)
 *          1 - cross-call
 *          2 - SSI error
 *          3 - SSI_EXT_INT_L
 *          4 - NIU
 *          5 - PIU mondo
 */

.data
intr0x60_ivn_to_ig:

#ifdef INTR0x60_CC_IV_0
#define INTR0x60_CC_IV_0_CHECK (INTR0x60_CC_IV_0 == `$1')
#else
#define INTR0x60_CC_IV_0_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_1
#define INTR0x60_CC_IV_1_CHECK (INTR0x60_CC_IV_1 == `$1')
#else
#define INTR0x60_CC_IV_1_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_2
#define INTR0x60_CC_IV_2_CHECK (INTR0x60_CC_IV_2 == `$1')
#else
#define INTR0x60_CC_IV_2_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_3
#define INTR0x60_CC_IV_3_CHECK (INTR0x60_CC_IV_3 == `$1')
#else
#define INTR0x60_CC_IV_3_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_4
#define INTR0x60_CC_IV_4_CHECK (INTR0x60_CC_IV_4 == `$1')
#else
#define INTR0x60_CC_IV_4_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_5
#define INTR0x60_CC_IV_5_CHECK (INTR0x60_CC_IV_5 == `$1')
#else
#define INTR0x60_CC_IV_5_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_6
#define INTR0x60_CC_IV_6_CHECK (INTR0x60_CC_IV_6 == `$1')
#else
#define INTR0x60_CC_IV_6_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_7
#define INTR0x60_CC_IV_7_CHECK (INTR0x60_CC_IV_7 == `$1')
#else
#define INTR0x60_CC_IV_7_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_8
#define INTR0x60_CC_IV_8_CHECK (INTR0x60_CC_IV_8 == `$1')
#else
#define INTR0x60_CC_IV_8_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_9
#define INTR0x60_CC_IV_9_CHECK (INTR0x60_CC_IV_9 == `$1')
#else
#define INTR0x60_CC_IV_9_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_10
#define INTR0x60_CC_IV_10_CHECK (INTR0x60_CC_IV_10 == `$1')
#else
#define INTR0x60_CC_IV_10_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_11
#define INTR0x60_CC_IV_11_CHECK (INTR0x60_CC_IV_11 == `$1')
#else
#define INTR0x60_CC_IV_11_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_12
#define INTR0x60_CC_IV_12_CHECK (INTR0x60_CC_IV_12 == `$1')
#else
#define INTR0x60_CC_IV_12_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_13
#define INTR0x60_CC_IV_13_CHECK (INTR0x60_CC_IV_13 == `$1')
#else
#define INTR0x60_CC_IV_13_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_14
#define INTR0x60_CC_IV_14_CHECK (INTR0x60_CC_IV_14 == `$1')
#else
#define INTR0x60_CC_IV_14_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_15
#define INTR0x60_CC_IV_15_CHECK (INTR0x60_CC_IV_15 == `$1')
#else
#define INTR0x60_CC_IV_15_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_16
#define INTR0x60_CC_IV_16_CHECK (INTR0x60_CC_IV_16 == `$1')
#else
#define INTR0x60_CC_IV_16_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_17
#define INTR0x60_CC_IV_17_CHECK (INTR0x60_CC_IV_17 == `$1')
#else
#define INTR0x60_CC_IV_17_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_18
#define INTR0x60_CC_IV_18_CHECK (INTR0x60_CC_IV_18 == `$1')
#else
#define INTR0x60_CC_IV_18_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_19
#define INTR0x60_CC_IV_19_CHECK (INTR0x60_CC_IV_19 == `$1')
#else
#define INTR0x60_CC_IV_19_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_20
#define INTR0x60_CC_IV_20_CHECK (INTR0x60_CC_IV_20 == `$1')
#else
#define INTR0x60_CC_IV_20_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_21
#define INTR0x60_CC_IV_21_CHECK (INTR0x60_CC_IV_21 == `$1')
#else
#define INTR0x60_CC_IV_21_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_22
#define INTR0x60_CC_IV_22_CHECK (INTR0x60_CC_IV_22 == `$1')
#else
#define INTR0x60_CC_IV_22_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_23
#define INTR0x60_CC_IV_23_CHECK (INTR0x60_CC_IV_23 == `$1')
#else
#define INTR0x60_CC_IV_23_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_24
#define INTR0x60_CC_IV_24_CHECK (INTR0x60_CC_IV_24 == `$1')
#else
#define INTR0x60_CC_IV_24_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_25
#define INTR0x60_CC_IV_25_CHECK (INTR0x60_CC_IV_25 == `$1')
#else
#define INTR0x60_CC_IV_25_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_26
#define INTR0x60_CC_IV_26_CHECK (INTR0x60_CC_IV_26 == `$1')
#else
#define INTR0x60_CC_IV_26_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_27
#define INTR0x60_CC_IV_27_CHECK (INTR0x60_CC_IV_27 == `$1')
#else
#define INTR0x60_CC_IV_27_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_28
#define INTR0x60_CC_IV_28_CHECK (INTR0x60_CC_IV_28 == `$1')
#else
#define INTR0x60_CC_IV_28_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_29
#define INTR0x60_CC_IV_29_CHECK (INTR0x60_CC_IV_29 == `$1')
#else
#define INTR0x60_CC_IV_29_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_30
#define INTR0x60_CC_IV_30_CHECK (INTR0x60_CC_IV_30 == `$1')
#else
#define INTR0x60_CC_IV_30_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_31
#define INTR0x60_CC_IV_31_CHECK (INTR0x60_CC_IV_31 == `$1')
#else
#define INTR0x60_CC_IV_31_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_32
#define INTR0x60_CC_IV_32_CHECK (INTR0x60_CC_IV_32 == `$1')
#else
#define INTR0x60_CC_IV_32_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_33
#define INTR0x60_CC_IV_33_CHECK (INTR0x60_CC_IV_33 == `$1')
#else
#define INTR0x60_CC_IV_33_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_34
#define INTR0x60_CC_IV_34_CHECK (INTR0x60_CC_IV_34 == `$1')
#else
#define INTR0x60_CC_IV_34_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_35
#define INTR0x60_CC_IV_35_CHECK (INTR0x60_CC_IV_35 == `$1')
#else
#define INTR0x60_CC_IV_35_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_36
#define INTR0x60_CC_IV_36_CHECK (INTR0x60_CC_IV_36 == `$1')
#else
#define INTR0x60_CC_IV_36_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_37
#define INTR0x60_CC_IV_37_CHECK (INTR0x60_CC_IV_37 == `$1')
#else
#define INTR0x60_CC_IV_37_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_38
#define INTR0x60_CC_IV_38_CHECK (INTR0x60_CC_IV_38 == `$1')
#else
#define INTR0x60_CC_IV_38_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_39
#define INTR0x60_CC_IV_39_CHECK (INTR0x60_CC_IV_39 == `$1')
#else
#define INTR0x60_CC_IV_39_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_40
#define INTR0x60_CC_IV_40_CHECK (INTR0x60_CC_IV_40 == `$1')
#else
#define INTR0x60_CC_IV_40_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_41
#define INTR0x60_CC_IV_41_CHECK (INTR0x60_CC_IV_41 == `$1')
#else
#define INTR0x60_CC_IV_41_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_42
#define INTR0x60_CC_IV_42_CHECK (INTR0x60_CC_IV_42 == `$1')
#else
#define INTR0x60_CC_IV_42_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_43
#define INTR0x60_CC_IV_43_CHECK (INTR0x60_CC_IV_43 == `$1')
#else
#define INTR0x60_CC_IV_43_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_44
#define INTR0x60_CC_IV_44_CHECK (INTR0x60_CC_IV_44 == `$1')
#else
#define INTR0x60_CC_IV_44_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_45
#define INTR0x60_CC_IV_45_CHECK (INTR0x60_CC_IV_45 == `$1')
#else
#define INTR0x60_CC_IV_45_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_46
#define INTR0x60_CC_IV_46_CHECK (INTR0x60_CC_IV_46 == `$1')
#else
#define INTR0x60_CC_IV_46_CHECK (0)
#endif

#ifdef INTR0x60_CC_IV_47
#define INTR0x60_CC_IV_47_CHECK (INTR0x60_CC_IV_47 == `$1')
#else
#define INTR0x60_CC_IV_47_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_0
#define INTR0x60_NIU_RX_IV_0_CHECK (INTR0x60_NIU_RX_IV_0 == `$1')
#else
#define INTR0x60_NIU_RX_IV_0_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_1
#define INTR0x60_NIU_RX_IV_1_CHECK (INTR0x60_NIU_RX_IV_1 == `$1')
#else
#define INTR0x60_NIU_RX_IV_1_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_2
#define INTR0x60_NIU_RX_IV_2_CHECK (INTR0x60_NIU_RX_IV_2 == `$1')
#else
#define INTR0x60_NIU_RX_IV_2_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_3
#define INTR0x60_NIU_RX_IV_3_CHECK (INTR0x60_NIU_RX_IV_3 == `$1')
#else
#define INTR0x60_NIU_RX_IV_3_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_4
#define INTR0x60_NIU_RX_IV_4_CHECK (INTR0x60_NIU_RX_IV_4 == `$1')
#else
#define INTR0x60_NIU_RX_IV_4_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_5
#define INTR0x60_NIU_RX_IV_5_CHECK (INTR0x60_NIU_RX_IV_5 == `$1')
#else
#define INTR0x60_NIU_RX_IV_5_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_6
#define INTR0x60_NIU_RX_IV_6_CHECK (INTR0x60_NIU_RX_IV_6 == `$1')
#else
#define INTR0x60_NIU_RX_IV_6_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_7
#define INTR0x60_NIU_RX_IV_7_CHECK (INTR0x60_NIU_RX_IV_7 == `$1')
#else
#define INTR0x60_NIU_RX_IV_7_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_8
#define INTR0x60_NIU_RX_IV_8_CHECK (INTR0x60_NIU_RX_IV_8 == `$1')
#else
#define INTR0x60_NIU_RX_IV_8_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_9
#define INTR0x60_NIU_RX_IV_9_CHECK (INTR0x60_NIU_RX_IV_9 == `$1')
#else
#define INTR0x60_NIU_RX_IV_9_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_10
#define INTR0x60_NIU_RX_IV_10_CHECK (INTR0x60_NIU_RX_IV_10 == `$1')
#else
#define INTR0x60_NIU_RX_IV_10_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_11
#define INTR0x60_NIU_RX_IV_11_CHECK (INTR0x60_NIU_RX_IV_11 == `$1')
#else
#define INTR0x60_NIU_RX_IV_11_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_12
#define INTR0x60_NIU_RX_IV_12_CHECK (INTR0x60_NIU_RX_IV_12 == `$1')
#else
#define INTR0x60_NIU_RX_IV_12_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_13
#define INTR0x60_NIU_RX_IV_13_CHECK (INTR0x60_NIU_RX_IV_13 == `$1')
#else
#define INTR0x60_NIU_RX_IV_13_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_14
#define INTR0x60_NIU_RX_IV_14_CHECK (INTR0x60_NIU_RX_IV_14 == `$1')
#else
#define INTR0x60_NIU_RX_IV_14_CHECK (0)
#endif

#ifdef INTR0x60_NIU_RX_IV_15
#define INTR0x60_NIU_RX_IV_15_CHECK (INTR0x60_NIU_RX_IV_15 == `$1')
#else
#define INTR0x60_NIU_RX_IV_15_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_0
#define INTR0x60_NIU_TX_IV_0_CHECK (INTR0x60_NIU_TX_IV_0 == `$1')
#else
#define INTR0x60_NIU_TX_IV_0_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_1
#define INTR0x60_NIU_TX_IV_1_CHECK (INTR0x60_NIU_TX_IV_1 == `$1')
#else
#define INTR0x60_NIU_TX_IV_1_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_2
#define INTR0x60_NIU_TX_IV_2_CHECK (INTR0x60_NIU_TX_IV_2 == `$1')
#else
#define INTR0x60_NIU_TX_IV_2_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_3
#define INTR0x60_NIU_TX_IV_3_CHECK (INTR0x60_NIU_TX_IV_3 == `$1')
#else
#define INTR0x60_NIU_TX_IV_3_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_4
#define INTR0x60_NIU_TX_IV_4_CHECK (INTR0x60_NIU_TX_IV_4 == `$1')
#else
#define INTR0x60_NIU_TX_IV_4_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_5
#define INTR0x60_NIU_TX_IV_5_CHECK (INTR0x60_NIU_TX_IV_5 == `$1')
#else
#define INTR0x60_NIU_TX_IV_5_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_6
#define INTR0x60_NIU_TX_IV_6_CHECK (INTR0x60_NIU_TX_IV_6 == `$1')
#else
#define INTR0x60_NIU_TX_IV_6_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_7
#define INTR0x60_NIU_TX_IV_7_CHECK (INTR0x60_NIU_TX_IV_7 == `$1')
#else
#define INTR0x60_NIU_TX_IV_7_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_8
#define INTR0x60_NIU_TX_IV_8_CHECK (INTR0x60_NIU_TX_IV_8 == `$1')
#else
#define INTR0x60_NIU_TX_IV_8_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_9
#define INTR0x60_NIU_TX_IV_9_CHECK (INTR0x60_NIU_TX_IV_9 == `$1')
#else
#define INTR0x60_NIU_TX_IV_9_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_10
#define INTR0x60_NIU_TX_IV_10_CHECK (INTR0x60_NIU_TX_IV_10 == `$1')
#else
#define INTR0x60_NIU_TX_IV_10_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_11
#define INTR0x60_NIU_TX_IV_11_CHECK (INTR0x60_NIU_TX_IV_11 == `$1')
#else
#define INTR0x60_NIU_TX_IV_11_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_12
#define INTR0x60_NIU_TX_IV_12_CHECK (INTR0x60_NIU_TX_IV_12 == `$1')
#else
#define INTR0x60_NIU_TX_IV_12_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_13
#define INTR0x60_NIU_TX_IV_13_CHECK (INTR0x60_NIU_TX_IV_13 == `$1')
#else
#define INTR0x60_NIU_TX_IV_13_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_14
#define INTR0x60_NIU_TX_IV_14_CHECK (INTR0x60_NIU_TX_IV_14 == `$1')
#else
#define INTR0x60_NIU_TX_IV_14_CHECK (0)
#endif

#ifdef INTR0x60_NIU_TX_IV_15
#define INTR0x60_NIU_TX_IV_15_CHECK (INTR0x60_NIU_TX_IV_15 == `$1')
#else
#define INTR0x60_NIU_TX_IV_15_CHECK (0)
#endif

#if (INTR0x60_SSI_ERR_IV != INTR0x60_BAD_IV)
#define INTR0x60_SSI_ERR_IV_CHECK (INTR0x60_SSI_ERR_IV == `$1')
#else
#define INTR0x60_SSI_ERR_IV_CHECK (0)
#endif

#if (INTR0x60_SSI_INT_IV != INTR0x60_BAD_IV)
#define INTR0x60_SSI_INT_IV_CHECK (INTR0x60_SSI_INT_IV == `$1')
#else
#define INTR0x60_SSI_INT_IV_CHECK (0)
#endif

#ifdef INTR0x60_MONDO_IV
#define INTR0x60_MONDO_IV_CHECK (INTR0x60_MONDO_IV == `$1')
#else
#define INTR0x60_MONDO_IV_CHECK (0)
#endif

/* Note: Need to put INTR0x60_IG_* names on a separate line
 * because the *_CHECK macros may contain a half-quote which
 * would prevent cpp from doing the macro replacement */
define(`INTR0x60_IVN_TO_IG',
       `ifelse(eval(   INTR0x60_CC_IV_0_CHECK
                    || INTR0x60_CC_IV_1_CHECK
                    || INTR0x60_CC_IV_2_CHECK
                    || INTR0x60_CC_IV_3_CHECK
                    || INTR0x60_CC_IV_4_CHECK
                    || INTR0x60_CC_IV_5_CHECK
                    || INTR0x60_CC_IV_6_CHECK
                    || INTR0x60_CC_IV_7_CHECK
                    || INTR0x60_CC_IV_8_CHECK
                    || INTR0x60_CC_IV_9_CHECK
                    || INTR0x60_CC_IV_10_CHECK
                    || INTR0x60_CC_IV_11_CHECK
                    || INTR0x60_CC_IV_12_CHECK
                    || INTR0x60_CC_IV_13_CHECK
                    || INTR0x60_CC_IV_14_CHECK
                    || INTR0x60_CC_IV_15_CHECK
                    || INTR0x60_CC_IV_16_CHECK
                    || INTR0x60_CC_IV_17_CHECK
                    || INTR0x60_CC_IV_18_CHECK
                    || INTR0x60_CC_IV_19_CHECK
                    || INTR0x60_CC_IV_20_CHECK
                    || INTR0x60_CC_IV_21_CHECK
                    || INTR0x60_CC_IV_22_CHECK
                    || INTR0x60_CC_IV_23_CHECK
                    || INTR0x60_CC_IV_24_CHECK
                    || INTR0x60_CC_IV_25_CHECK
                    || INTR0x60_CC_IV_26_CHECK
                    || INTR0x60_CC_IV_27_CHECK
                    || INTR0x60_CC_IV_28_CHECK
                    || INTR0x60_CC_IV_29_CHECK
                    || INTR0x60_CC_IV_30_CHECK
                    || INTR0x60_CC_IV_31_CHECK
                    || INTR0x60_CC_IV_32_CHECK
                    || INTR0x60_CC_IV_33_CHECK
                    || INTR0x60_CC_IV_34_CHECK
                    || INTR0x60_CC_IV_35_CHECK
                    || INTR0x60_CC_IV_36_CHECK
                    || INTR0x60_CC_IV_37_CHECK
                    || INTR0x60_CC_IV_38_CHECK
                    || INTR0x60_CC_IV_39_CHECK
                    || INTR0x60_CC_IV_40_CHECK
                    || INTR0x60_CC_IV_41_CHECK
                    || INTR0x60_CC_IV_42_CHECK
                    || INTR0x60_CC_IV_43_CHECK
                    || INTR0x60_CC_IV_44_CHECK
                    || INTR0x60_CC_IV_45_CHECK
                    || INTR0x60_CC_IV_46_CHECK
                    || INTR0x60_CC_IV_47_CHECK), 1,
                                         INTR0x60_IG_CC,
               eval( INTR0x60_SSI_ERR_IV_CHECK ), 1,
                                         INTR0x60_IG_SSI_ERR,
               eval( INTR0x60_SSI_INT_IV_CHECK ), 1,
                                         INTR0x60_IG_SSI_INT,
               eval( INTR0x60_MONDO_IV_CHECK   ), 1,
                                         INTR0x60_IG_PIU,
               eval(   INTR0x60_NIU_RX_IV_0_CHECK
                    || INTR0x60_NIU_RX_IV_1_CHECK
                    || INTR0x60_NIU_RX_IV_2_CHECK
                    || INTR0x60_NIU_RX_IV_3_CHECK
                    || INTR0x60_NIU_RX_IV_4_CHECK
                    || INTR0x60_NIU_RX_IV_5_CHECK
                    || INTR0x60_NIU_RX_IV_6_CHECK
                    || INTR0x60_NIU_RX_IV_7_CHECK
                    || INTR0x60_NIU_RX_IV_8_CHECK
                    || INTR0x60_NIU_RX_IV_9_CHECK
                    || INTR0x60_NIU_RX_IV_10_CHECK
                    || INTR0x60_NIU_RX_IV_11_CHECK
                    || INTR0x60_NIU_RX_IV_12_CHECK
                    || INTR0x60_NIU_RX_IV_13_CHECK
                    || INTR0x60_NIU_RX_IV_14_CHECK
                    || INTR0x60_NIU_RX_IV_15_CHECK), 1,
                                         INTR0x60_IG_NIU_RX,
               eval(   INTR0x60_NIU_TX_IV_0_CHECK
                    || INTR0x60_NIU_TX_IV_1_CHECK
                    || INTR0x60_NIU_TX_IV_2_CHECK
                    || INTR0x60_NIU_TX_IV_3_CHECK
                    || INTR0x60_NIU_TX_IV_4_CHECK
                    || INTR0x60_NIU_TX_IV_5_CHECK
                    || INTR0x60_NIU_TX_IV_6_CHECK
                    || INTR0x60_NIU_TX_IV_7_CHECK
                    || INTR0x60_NIU_TX_IV_8_CHECK
                    || INTR0x60_NIU_TX_IV_9_CHECK
                    || INTR0x60_NIU_TX_IV_10_CHECK
                    || INTR0x60_NIU_TX_IV_11_CHECK
                    || INTR0x60_NIU_TX_IV_12_CHECK
                    || INTR0x60_NIU_TX_IV_13_CHECK
                    || INTR0x60_NIU_TX_IV_14_CHECK
                    || INTR0x60_NIU_TX_IV_15_CHECK), 1,
                                         INTR0x60_IG_NIU_TX,
               INTR0x60_IG_UNUSED)'
       )dnl

    .byte INTR0x60_IVN_TO_IG(0)
    .byte INTR0x60_IVN_TO_IG(1)
    .byte INTR0x60_IVN_TO_IG(2)
    .byte INTR0x60_IVN_TO_IG(3)
    .byte INTR0x60_IVN_TO_IG(4)
    .byte INTR0x60_IVN_TO_IG(5)
    .byte INTR0x60_IVN_TO_IG(6)
    .byte INTR0x60_IVN_TO_IG(7)
    .byte INTR0x60_IVN_TO_IG(8)
    .byte INTR0x60_IVN_TO_IG(9)
    .byte INTR0x60_IVN_TO_IG(10)
    .byte INTR0x60_IVN_TO_IG(11)
    .byte INTR0x60_IVN_TO_IG(12)
    .byte INTR0x60_IVN_TO_IG(13)
    .byte INTR0x60_IVN_TO_IG(14)
    .byte INTR0x60_IVN_TO_IG(15)
    .byte INTR0x60_IVN_TO_IG(16)
    .byte INTR0x60_IVN_TO_IG(17)
    .byte INTR0x60_IVN_TO_IG(18)
    .byte INTR0x60_IVN_TO_IG(19)
    .byte INTR0x60_IVN_TO_IG(20)
    .byte INTR0x60_IVN_TO_IG(21)
    .byte INTR0x60_IVN_TO_IG(22)
    .byte INTR0x60_IVN_TO_IG(23)
    .byte INTR0x60_IVN_TO_IG(24)
    .byte INTR0x60_IVN_TO_IG(25)
    .byte INTR0x60_IVN_TO_IG(26)
    .byte INTR0x60_IVN_TO_IG(27)
    .byte INTR0x60_IVN_TO_IG(28)
    .byte INTR0x60_IVN_TO_IG(29)
    .byte INTR0x60_IVN_TO_IG(30)
    .byte INTR0x60_IVN_TO_IG(31)
    .byte INTR0x60_IVN_TO_IG(32)
    .byte INTR0x60_IVN_TO_IG(33)
    .byte INTR0x60_IVN_TO_IG(34)
    .byte INTR0x60_IVN_TO_IG(35)
    .byte INTR0x60_IVN_TO_IG(36)
    .byte INTR0x60_IVN_TO_IG(37)
    .byte INTR0x60_IVN_TO_IG(38)
    .byte INTR0x60_IVN_TO_IG(39)
    .byte INTR0x60_IVN_TO_IG(40)
    .byte INTR0x60_IVN_TO_IG(41)
    .byte INTR0x60_IVN_TO_IG(42)
    .byte INTR0x60_IVN_TO_IG(43)
    .byte INTR0x60_IVN_TO_IG(44)
    .byte INTR0x60_IVN_TO_IG(45)
    .byte INTR0x60_IVN_TO_IG(46)
    .byte INTR0x60_IVN_TO_IG(47)
    .byte INTR0x60_IVN_TO_IG(48)
    .byte INTR0x60_IVN_TO_IG(49)
    .byte INTR0x60_IVN_TO_IG(50)
    .byte INTR0x60_IVN_TO_IG(51)
    .byte INTR0x60_IVN_TO_IG(52)
    .byte INTR0x60_IVN_TO_IG(53)
    .byte INTR0x60_IVN_TO_IG(54)
    .byte INTR0x60_IVN_TO_IG(55)
    .byte INTR0x60_IVN_TO_IG(56)
    .byte INTR0x60_IVN_TO_IG(57)
    .byte INTR0x60_IVN_TO_IG(58)
    .byte INTR0x60_IVN_TO_IG(59)
    .byte INTR0x60_IVN_TO_IG(60)
    .byte INTR0x60_IVN_TO_IG(61)
    .byte INTR0x60_IVN_TO_IG(62)
    .byte INTR0x60_IVN_TO_IG(63)
undefine(`INTR0x60_IVN_TO_IG')dnl
