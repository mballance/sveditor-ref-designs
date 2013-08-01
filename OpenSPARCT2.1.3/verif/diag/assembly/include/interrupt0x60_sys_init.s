/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt0x60_sys_init.s
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
#include "ncu_defines.h"

#if defined(INTR0x60_NIU_RX_IV_0) || defined(INTR0x60_NIU_TX_IV_0)
#include "niu_defines.h"
#include "niu_macros.h"
#endif /*defined(INTR0x60_NIU_RX_IV_0) || defined(INTR0x60_NIU_TX_IV_0)*/


intr0x60_sys_init:

#ifdef PORTABLE_CORE
    ldxa  [%g0] ASI_INTR_ID, %l7
    and   %l7, 0x38, %l7                ! %l7 = core ID, not thread ID
#endif

#if defined(INTR0x60_INITIALIZE_INT_MAN) || (INTR0x60_SSI_ERR_IV != INTR0x60_BAD_IV) || (INTR0x60_SSI_INT_IV != INTR0x60_BAD_IV)
    ! Initialize the Interrupt Management Registers
intr0x60_sys_init_int_man:
    best_set_reg(INT_MAN, %l1, %l2)     ! %l2 = INT_MAN reg. addr.

intr0x60_sys_init_int_man_0:
    best_set_reg(mpeval((INTR0x60_BAD_THREAD<<8)+INTR0x60_BAD_IV), %l0, %l1)
#ifdef PORTABLE_CORE
    setx  0x3800, %l0, %l6
    andn  %l1, %l6, %l1
    sllx  %l7, 8, %l6
    or    %l1, %l6, %l1                 ! Use core ID of core running on
#endif
    stx  %l1, [%l2]

intr0x60_sys_init_int_man_ssi_err:
    add  %l2, INT_MAN_STEP, %l2
    best_set_reg(mpeval((INTR0x60_SSI_ERR_THREAD<<8)+INTR0x60_SSI_ERR_IV),
                 %l0, %l1)
#ifdef PORTABLE_CORE
    setx  0x3800, %l0, %l6
    andn  %l1, %l6, %l1
    sllx  %l7, 8, %l6
    or    %l1, %l6, %l1                 ! Use core ID of core running on
#endif
    stx  %l1, [%l2]
intr0x60_sys_init_enable_ssi_error_interrupts:
#include "ssi_defines.h"
    best_set_reg(SSI_TIMEOUT_ADDR, %l0, %l3)
    best_set_reg(SSI_TIMEOUT_ERREN_MASK, %l0, %l1)
    ldx  [%l3],%l0
    or   %l0, %l1, %l1
    stx  %l1, [%l3]

intr0x60_sys_init_int_man_ssi_int:
    add  %l2, INT_MAN_STEP, %l2
    best_set_reg(mpeval((INTR0x60_SSI_INT_THREAD<<8)+INTR0x60_SSI_INT_IV),
                 %l0, %l1)
#ifdef PORTABLE_CORE
    setx  0x3800, %l0, %l6
    andn  %l1, %l6, %l1
    sllx  %l7, 8, %l6
    or    %l1, %l6, %l1                 ! Use core ID of core running on
#endif
    stx  %l1, [%l2]
#endif /* INTR0x60_INITIALIZE_INT_MAN or SSI_ERR or SSI_INT */



#ifdef INTR0x60_NIU_RX_IV_0
intr0x60_sys_init_int_man_niu_rx_0:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_0)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_0<<8)+INTR0x60_NIU_RX_IV_0),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_0,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_0,
                                eval(64 + INTR0x60_NIU_RX_IV_0), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_0 */

#ifdef INTR0x60_NIU_RX_IV_1
intr0x60_sys_init_int_man_niu_rx_1:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_1)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_1<<8)+INTR0x60_NIU_RX_IV_1),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_1,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_1,
                                eval(64 + INTR0x60_NIU_RX_IV_1), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_1 */

#ifdef INTR0x60_NIU_RX_IV_2
intr0x60_sys_init_int_man_niu_rx_2:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_2)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_2<<8)+INTR0x60_NIU_RX_IV_2),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_2,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_2,
                                eval(64 + INTR0x60_NIU_RX_IV_2), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_2 */

#ifdef INTR0x60_NIU_RX_IV_3
intr0x60_sys_init_int_man_niu_rx_3:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_3)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_3<<8)+INTR0x60_NIU_RX_IV_3),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_3,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_3,
                                eval(64 + INTR0x60_NIU_RX_IV_3), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_3 */

#ifdef INTR0x60_NIU_RX_IV_4
intr0x60_sys_init_int_man_niu_rx_4:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_4)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_4<<8)+INTR0x60_NIU_RX_IV_4),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_4,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_4,
                                eval(64 + INTR0x60_NIU_RX_IV_4), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_4 */

#ifdef INTR0x60_NIU_RX_IV_5
intr0x60_sys_init_int_man_niu_rx_5:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_5)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_5<<8)+INTR0x60_NIU_RX_IV_5),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_5,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_5,
                                eval(64 + INTR0x60_NIU_RX_IV_5), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_5 */

#ifdef INTR0x60_NIU_RX_IV_6
intr0x60_sys_init_int_man_niu_rx_6:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_6)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_6<<8)+INTR0x60_NIU_RX_IV_6),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_6,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_6,
                                eval(64 + INTR0x60_NIU_RX_IV_6), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_6 */

#ifdef INTR0x60_NIU_RX_IV_7
intr0x60_sys_init_int_man_niu_rx_7:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_7)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_7<<8)+INTR0x60_NIU_RX_IV_7),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_7,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_7,
                                eval(64 + INTR0x60_NIU_RX_IV_7), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_7 */

#ifdef INTR0x60_NIU_RX_IV_8
intr0x60_sys_init_int_man_niu_rx_8:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_8)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_8<<8)+INTR0x60_NIU_RX_IV_8),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_8,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_8,
                                eval(64 + INTR0x60_NIU_RX_IV_8), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_8 */

#ifdef INTR0x60_NIU_RX_IV_9
intr0x60_sys_init_int_man_niu_rx_9:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_9)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_9<<8)+INTR0x60_NIU_RX_IV_9),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_9,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_9,
                                eval(64 + INTR0x60_NIU_RX_IV_9), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_9 */

#ifdef INTR0x60_NIU_RX_IV_10
intr0x60_sys_init_int_man_niu_rx_10:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_10)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_10<<8)+INTR0x60_NIU_RX_IV_10),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_10,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_10,
                                eval(64 + INTR0x60_NIU_RX_IV_10), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_10 */

#ifdef INTR0x60_NIU_RX_IV_11
intr0x60_sys_init_int_man_niu_rx_11:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_11)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_11<<8)+INTR0x60_NIU_RX_IV_11),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_11,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_11,
                                eval(64 + INTR0x60_NIU_RX_IV_11), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_11 */

#ifdef INTR0x60_NIU_RX_IV_12
intr0x60_sys_init_int_man_niu_rx_12:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_12)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_12<<8)+INTR0x60_NIU_RX_IV_12),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_12,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_12,
                                eval(64 + INTR0x60_NIU_RX_IV_12), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_12 */

#ifdef INTR0x60_NIU_RX_IV_13
intr0x60_sys_init_int_man_niu_rx_13:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_13)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_13<<8)+INTR0x60_NIU_RX_IV_13),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_13,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_13,
                                eval(64 + INTR0x60_NIU_RX_IV_13), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_13 */

#ifdef INTR0x60_NIU_RX_IV_14
intr0x60_sys_init_int_man_niu_rx_14:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_14)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_14<<8)+INTR0x60_NIU_RX_IV_14),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_14,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_14,
                                eval(64 + INTR0x60_NIU_RX_IV_14), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_14 */

#ifdef INTR0x60_NIU_RX_IV_15
intr0x60_sys_init_int_man_niu_rx_15:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_RX_IV_15)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_RX_THREAD_15<<8)+INTR0x60_NIU_RX_IV_15),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_RX_NO_SYS_INIT
    ! Initialize the NIU for RX DMA interrupt.
    NIU_RX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_RX_DMA_15,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_RX_IV_15,
                                eval(64 + INTR0x60_NIU_RX_IV_15), %l5 )
#endif
#endif /* INTR0x60_NIU_RX_IV_15 */



#ifdef INTR0x60_NIU_TX_IV_0
intr0x60_sys_init_int_man_niu_tx_0:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_0)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_0<<8)+INTR0x60_NIU_TX_IV_0),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_0,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_0,
                                eval(64 + INTR0x60_NIU_TX_IV_0) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_0 */

#ifdef INTR0x60_NIU_TX_IV_1
intr0x60_sys_init_int_man_niu_tx_1:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_1)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_1<<8)+INTR0x60_NIU_TX_IV_1),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_1,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_1,
                                eval(64 + INTR0x60_NIU_TX_IV_1) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_1 */

#ifdef INTR0x60_NIU_TX_IV_2
intr0x60_sys_init_int_man_niu_tx_2:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_2)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_2<<8)+INTR0x60_NIU_TX_IV_2),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_2,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_2,
                                eval(64 + INTR0x60_NIU_TX_IV_2) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_2 */

#ifdef INTR0x60_NIU_TX_IV_3
intr0x60_sys_init_int_man_niu_tx_3:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_3)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_3<<8)+INTR0x60_NIU_TX_IV_3),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_3,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_3,
                                eval(64 + INTR0x60_NIU_TX_IV_3) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_3 */

#ifdef INTR0x60_NIU_TX_IV_4
intr0x60_sys_init_int_man_niu_tx_4:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_4)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_4<<8)+INTR0x60_NIU_TX_IV_4),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_4,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_4,
                                eval(64 + INTR0x60_NIU_TX_IV_4) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_4 */

#ifdef INTR0x60_NIU_TX_IV_5
intr0x60_sys_init_int_man_niu_tx_5:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_5)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_5<<8)+INTR0x60_NIU_TX_IV_5),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_5,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_5,
                                eval(64 + INTR0x60_NIU_TX_IV_5) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_5 */

#ifdef INTR0x60_NIU_TX_IV_6
intr0x60_sys_init_int_man_niu_tx_6:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_6)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_6<<8)+INTR0x60_NIU_TX_IV_6),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_6,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_6,
                                eval(64 + INTR0x60_NIU_TX_IV_6) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_6 */

#ifdef INTR0x60_NIU_TX_IV_7
intr0x60_sys_init_int_man_niu_tx_7:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_7)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_7<<8)+INTR0x60_NIU_TX_IV_7),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_7,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_7,
                                eval(64 + INTR0x60_NIU_TX_IV_7) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_7 */

#ifdef INTR0x60_NIU_TX_IV_8
intr0x60_sys_init_int_man_niu_tx_8:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_8)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_8<<8)+INTR0x60_NIU_TX_IV_8),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_8,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_8,
                                eval(64 + INTR0x60_NIU_TX_IV_8) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_8 */

#ifdef INTR0x60_NIU_TX_IV_9
intr0x60_sys_init_int_man_niu_tx_9:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_9)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_9<<8)+INTR0x60_NIU_TX_IV_9),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_9,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_9,
                                eval(64 + INTR0x60_NIU_TX_IV_9) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_9 */

#ifdef INTR0x60_NIU_TX_IV_10
intr0x60_sys_init_int_man_niu_tx_10:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_10)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_10<<8)+INTR0x60_NIU_TX_IV_10),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_10,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_10,
                                eval(64 + INTR0x60_NIU_TX_IV_10) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_10 */

#ifdef INTR0x60_NIU_TX_IV_11
intr0x60_sys_init_int_man_niu_tx_11:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_11)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_11<<8)+INTR0x60_NIU_TX_IV_11),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_11,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_11,
                                eval(64 + INTR0x60_NIU_TX_IV_11) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_11 */

#ifdef INTR0x60_NIU_TX_IV_12
intr0x60_sys_init_int_man_niu_tx_12:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_12)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_12<<8)+INTR0x60_NIU_TX_IV_12),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_12,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_12,
                                eval(64 + INTR0x60_NIU_TX_IV_12) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_12 */

#ifdef INTR0x60_NIU_TX_IV_13
intr0x60_sys_init_int_man_niu_tx_13:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_13)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_13<<8)+INTR0x60_NIU_TX_IV_13),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_13,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_13,
                                eval(64 + INTR0x60_NIU_TX_IV_13) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_13 */

#ifdef INTR0x60_NIU_TX_IV_14
intr0x60_sys_init_int_man_niu_tx_14:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_14)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_14<<8)+INTR0x60_NIU_TX_IV_14),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_14,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_14,
                                eval(64 + INTR0x60_NIU_TX_IV_14) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_14 */

#ifdef INTR0x60_NIU_TX_IV_15
intr0x60_sys_init_int_man_niu_tx_15:
    best_set_reg(mpeval(INT_MAN+(64+INTR0x60_NIU_TX_IV_15)*INT_MAN_STEP), %l1, %l2)
    best_set_reg(mpeval((INTR0x60_NIU_TX_THREAD_15<<8)+INTR0x60_NIU_TX_IV_15),
                 %l0, %l1)
    stx  %l1, [%l2]
#ifndef INTR0x60_NIU_TX_NO_SYS_INIT
    ! Initialize the NIU for TX DMA interrupt.
    NIU_TX_LD_IM0_INTR_ON_MARK( INTR0x60_NIU_TX_DMA_15,
                                %l1, %l2, %l3, %l4,
                                INTR0x60_NIU_TX_IV_15,
                                eval(64 + INTR0x60_NIU_TX_IV_15) )
#endif /* INTR0x60_NIU_TX_NO_SYS_INIT */
#endif /* INTR0x60_NIU_TX_IV_15 */



    ! Initialize Mondo Interrupt Vector Register
intr0x60_sys_init_mondo_int_vec:
#ifdef INTR0x60_MONDO_IV
    best_set_reg(INTR0x60_MONDO_IV, %l2, %l1)
#else
    best_set_reg(INTR0x60_BAD_IV, %l2, %l1)
#endif /* INTR0x60_MONDO_IV */
    best_set_reg(MONDO_INT_VEC, %l2, %l3)
    stx	 %l1, [%l3]

#ifdef INTR0x60_MONDO_IV
/* Mondos come from PIU, so do the appropriate initialization */
/* Need some cpp macros for PIU registers */
#include "peu_defines.h"


intr0x60_sys_init_clear_intx:
    set	 1, %l3
    best_set_reg(PCI_E_INT_A_CLEAR_ADDR, %l1, %l2)
    stx  %l3, [%l2]
    best_set_reg(PCI_E_INT_B_CLEAR_ADDR, %l1, %l2)
    stx  %l3, [%l2]
    best_set_reg(PCI_E_INT_C_CLEAR_ADDR, %l1, %l2)
    stx  %l3, [%l2]
    best_set_reg(PCI_E_INT_D_CLEAR_ADDR, %l1, %l2)
    stx  %l3, [%l2]


/* Clear the MSI registers, if any MSIs are being used */
#ifdef INTR0x60_MSI_0_NUM
intr0x60_sys_init_clear_msi:
    set  1, %l3
    sllx %l3, 62, %l3           ! EQWR_N is bit 62
    best_set_reg(PCI_E_MSI_CLEAR_ADDR, %l1, %l2)
#ifdef INTR0x60_MSI_0_NUM
intr0x60_sys_init_clear_msi_0:
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_0_NUM),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_0_NUM */
#ifdef INTR0x60_MSI_1_NUM
intr0x60_sys_init_clear_msi_1:
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_1_NUM),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_1_NUM */
#ifdef INTR0x60_MSI_2_NUM
intr0x60_sys_init_clear_msi_2:
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_2_NUM),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_2_NUM */
#ifdef INTR0x60_MSI_3_NUM
intr0x60_sys_init_clear_msi_3:
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_3_NUM),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_3_NUM */
#ifdef INTR0x60_MSI_4_NUM
intr0x60_sys_init_clear_msi_4:
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_4_NUM),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_4_NUM */
#ifdef INTR0x60_MSI_5_NUM
intr0x60_sys_init_clear_msi_5:
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_5_NUM),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_5_NUM */
#ifdef INTR0x60_MSI_6_NUM
intr0x60_sys_init_clear_msi_6:
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_6_NUM),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_6_NUM */
#ifdef INTR0x60_MSI_7_NUM
intr0x60_sys_init_clear_msi_7:
    best_set_reg(mpeval(PCI_E_MSI_CLEAR_STEP*INTR0x60_MSI_7_NUM),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_7_NUM */
#endif /* INTR0x60_MSI_0_NUM */


    ! Also clear in Interrupt Clear reg.
intr0x60_sys_init_piu_intr_clear:
    best_set_reg(PCI_E_INT_CLEAR_ADDR, %l1, %l2)
    mov  PCI_E_INT_CLEAR_COUNT, %l3
intr0x60_sys_init_piu_intr_clear_loop_top:
    stx  %g0, [%l2]
    dec  %l3
    brnz %l3,intr0x60_sys_init_piu_intr_clear_loop_top
    add  PCI_E_INT_CLEAR_STEP, %l2, %l2

/* WIP: Clear INO 62 and 63 */


/* Set up the Event Queues in PIU, if any are being used */
#ifdef INTR0x60_EVENT_QUEUE_BASE
intr0x60_sys_init_piu_eq_base_addr:
    ! First the Event Queue Base Address reg.
    ! Formatted for a bypass address.
    best_set_reg(PCI_E_EV_QUE_BASE_ADDRESS_ADDR, %l1, %l2)
    setx (INTR0x60_EVENT_QUEUE_BASE), %l1, %l3
    best_set_reg(0xfffc000000000000, %l1, %l6)
    or   %l3, %l6, %l3
    stx  %l3, [%l2]

    ! Event Queue Control Set reg.
intr0x60_sys_init_piu_eq_ctl_set_en:
    set  1, %l3
    sllx %l3, 44, %l3           ! EN is bit 44
    best_set_reg(PCI_E_EV_QUE_CTL_SET_ADDR, %l1, %l2)
#ifdef INTR0x60_MSI_0_NUM
intr0x60_sys_init_piu_eq_ctl_set_en_0:
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_0_EQN),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_0_NUM */
#ifdef INTR0x60_MSI_1_NUM
intr0x60_sys_init_piu_eq_ctl_set_en_1:
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_1_EQN),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_1_NUM */
#ifdef INTR0x60_MSI_2_NUM
intr0x60_sys_init_piu_eq_ctl_set_en_2:
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_2_EQN),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_2_NUM */
#ifdef INTR0x60_MSI_3_NUM
intr0x60_sys_init_piu_eq_ctl_set_en_3:
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_3_EQN),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_3_NUM */
#ifdef INTR0x60_MSI_4_NUM
intr0x60_sys_init_piu_eq_ctl_set_en_4:
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_4_EQN),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_4_NUM */
#ifdef INTR0x60_MSI_5_NUM
intr0x60_sys_init_piu_eq_ctl_set_en_5:
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_5_EQN),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_5_NUM */
#ifdef INTR0x60_MSI_6_NUM
intr0x60_sys_init_piu_eq_ctl_set_en_6:
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_6_EQN),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_6_NUM */
#ifdef INTR0x60_MSI_7_NUM
intr0x60_sys_init_piu_eq_ctl_set_en_7:
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_MSI_7_EQN),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_MSI_7_NUM */
#ifdef INTR0x60_PM_PME_EQN
intr0x60_sys_init_piu_eq_ctl_set_en_pm_pme:
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_PM_PME_EQN),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_PM_PME_EQN */
#ifdef INTR0x60_PME_TO_ACK_EQN
intr0x60_sys_init_piu_eq_ctl_set_en_pme_to_ack:
    best_set_reg(mpeval(PCI_E_EV_QUE_CTL_SET_STEP*INTR0x60_PME_TO_ACK_EQN),
                 %l1, %l4)
    stx  %l3, [%l2+%l4]
#endif /* INTR0x60_PME_TO_ACK_EQN */

#endif /* INTR0x60_EVENT_QUEUE_BASE */


#ifdef INTR0x60_MSI_START_ADDRESS
    ! Set up the MSI address
intr0x60_sys_init_piu_msi_addr:
    best_set_reg(INTR0x60_MSI_START_ADDRESS, %l1, %l3)
    best_set_reg(PCI_E_MSI_32_ADDRESS_ADDR, %l1, %l2)
    stx  %l3, [%l2]
    best_set_reg(PCI_E_MSI_64_ADDRESS_ADDR, %l1, %l2)
    stx  %l3, [%l2]

    ! MSI-to-Event Queue Mapping registers
intr0x60_sys_init_piu_msi_mapping:
    set  1, %l3
    sllx %l3, 63, %l3           ! V is bit 63
    best_set_reg(PCI_E_MSI_MAP_ADDR, %l1, %l2)
#ifdef INTR0x60_MSI_0_NUM
intr0x60_sys_init_piu_msi_mapping_0:
    best_set_reg(mpeval(PCI_E_MSI_MAP_STEP*INTR0x60_MSI_0_NUM),
                 %l1, %l4)
    best_set_reg(INTR0x60_MSI_0_EQN, %l1, %l5)
    add  %l3, %l5, %l5
    stx  %l5, [%l2+%l4]
#endif /* INTR0x60_MSI_0_NUM */
#ifdef INTR0x60_MSI_1_NUM
intr0x60_sys_init_piu_msi_mapping_1:
    best_set_reg(mpeval(PCI_E_MSI_MAP_STEP*INTR0x60_MSI_1_NUM),
                 %l1, %l4)
    best_set_reg(INTR0x60_MSI_1_EQN, %l1, %l5)
    add  %l3, %l5, %l5
    stx  %l5, [%l2+%l4]
#endif /* INTR0x60_MSI_1_NUM */
#ifdef INTR0x60_MSI_2_NUM
intr0x60_sys_init_piu_msi_mapping_2:
    best_set_reg(mpeval(PCI_E_MSI_MAP_STEP*INTR0x60_MSI_2_NUM),
                 %l1, %l4)
    best_set_reg(INTR0x60_MSI_2_EQN, %l1, %l5)
    add  %l3, %l5, %l5
    stx  %l5, [%l2+%l4]
#endif /* INTR0x60_MSI_2_NUM */
#ifdef INTR0x60_MSI_3_NUM
intr0x60_sys_init_piu_msi_mapping_3:
    best_set_reg(mpeval(PCI_E_MSI_MAP_STEP*INTR0x60_MSI_3_NUM),
                 %l1, %l4)
    best_set_reg(INTR0x60_MSI_3_EQN, %l1, %l5)
    add  %l3, %l5, %l5
    stx  %l5, [%l2+%l4]
#endif /* INTR0x60_MSI_3_NUM */
#ifdef INTR0x60_MSI_4_NUM
intr0x60_sys_init_piu_msi_mapping_4:
    best_set_reg(mpeval(PCI_E_MSI_MAP_STEP*INTR0x60_MSI_4_NUM),
                 %l1, %l4)
    best_set_reg(INTR0x60_MSI_4_EQN, %l1, %l5)
    add  %l3, %l5, %l5
    stx  %l5, [%l2+%l4]
#endif /* INTR0x60_MSI_4_NUM */
#ifdef INTR0x60_MSI_5_NUM
intr0x60_sys_init_piu_msi_mapping_5:
    best_set_reg(mpeval(PCI_E_MSI_MAP_STEP*INTR0x60_MSI_5_NUM),
                 %l1, %l4)
    best_set_reg(INTR0x60_MSI_5_EQN, %l1, %l5)
    add  %l3, %l5, %l5
    stx  %l5, [%l2+%l4]
#endif /* INTR0x60_MSI_5_NUM */
#ifdef INTR0x60_MSI_6_NUM
intr0x60_sys_init_piu_msi_mapping_6:
    best_set_reg(mpeval(PCI_E_MSI_MAP_STEP*INTR0x60_MSI_6_NUM),
                 %l1, %l4)
    best_set_reg(INTR0x60_MSI_6_EQN, %l1, %l5)
    add  %l3, %l5, %l5
    stx  %l5, [%l2+%l4]
#endif /* INTR0x60_MSI_6_NUM */
#ifdef INTR0x60_MSI_7_NUM
intr0x60_sys_init_piu_msi_mapping_7:
    best_set_reg(mpeval(PCI_E_MSI_MAP_STEP*INTR0x60_MSI_7_NUM),
                 %l1, %l4)
    best_set_reg(INTR0x60_MSI_7_EQN, %l1, %l5)
    add  %l3, %l5, %l5
    stx  %l5, [%l2+%l4]
#endif /* INTR0x60_MSI_7_NUM */
#endif /* INTR0x60_MSI_START_ADDRESS */

#ifdef INTR0x60_PM_PME_EQN
    ! PM_PME-to-Event Queue Mapping registers
intr0x60_sys_init_piu_pm_pme_mapping:
    set  1, %l3
    sllx %l3, 63, %l3           ! V is bit 63
    best_set_reg(PCI_E_PM_PME_MAP_ADDR, %l1, %l2)
    best_set_reg(INTR0x60_PM_PME_EQN, %l1, %l5)
    add  %l3, %l5, %l5
    stx  %l5, [%l2]
#endif /* INTR0x60_PM_PME_EQN */

#ifdef INTR0x60_PME_TO_ACK_EQN
    ! PME_TO_ACK-to-Event Queue Mapping registers
intr0x60_sys_init_piu_pme_to_ack_mapping:
    set  1, %l3
    sllx %l3, 63, %l3           ! V is bit 63
    best_set_reg(PCI_E_PME_ACK_MAP_ADDR, %l1, %l2)
    best_set_reg(INTR0x60_PME_TO_ACK_EQN, %l1, %l5)
    add  %l3, %l5, %l5
    stx  %l5, [%l2]
#endif /* INTR0x60_PME_TO_ACK_EQN */



#if INTR0x60_MONDO_20_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_20:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(20-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_20_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_20_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_20_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_20_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_20_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_21_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_21:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(21-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_21_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_21_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_21_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_21_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_21_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_22_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_22:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(22-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_22_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_22_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_22_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_22_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_22_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_23_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_23:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(23-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_23_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_23_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_23_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_23_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_23_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_24_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_24:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(24-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_24_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_24_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_24_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_24_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_24_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_25_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_25:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(25-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_25_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_25_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_25_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_25_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_25_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_26_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_26:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(26-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_26_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_26_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_26_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_26_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_26_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_27_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_27:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(27-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_27_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_27_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_27_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_27_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_27_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_28_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_28:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(28-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_28_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_28_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_28_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_28_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_28_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_29_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_29:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(29-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_29_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_29_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_29_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_29_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_29_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_30_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_30:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(30-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_30_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_30_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_30_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_30_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_30_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_31_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_31:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(31-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_31_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_31_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_31_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_31_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_31_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_32_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_32:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(32-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_32_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_32_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_32_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_32_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_32_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_33_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_33:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(33-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_33_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_33_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_33_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_33_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_33_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_34_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_34:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(34-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_34_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_34_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_34_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_34_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_34_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_35_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_35:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(35-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_35_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_35_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_35_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_35_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_35_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_36_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_36:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(36-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_36_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_36_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_36_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_36_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_36_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_37_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_37:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(37-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_37_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_37_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_37_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_37_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_37_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_38_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_38:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(38-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_38_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_38_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_38_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_38_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_38_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_39_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_39:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(39-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_39_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_39_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_39_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_39_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_39_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_40_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_40:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(40-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_40_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_40_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_40_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_40_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_40_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_41_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_41:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(41-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_41_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_41_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_41_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_41_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_41_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_42_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_42:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(42-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_42_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_42_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_42_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_42_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_42_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_43_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_43:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(43-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_43_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_43_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_43_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_43_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_43_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_44_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_44:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(44-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_44_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_44_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_44_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_44_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_44_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_45_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_45:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(45-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_45_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_45_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_45_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_45_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_45_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_46_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_46:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(46-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_46_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_46_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_46_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_46_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_46_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_47_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_47:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(47-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_47_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_47_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_47_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_47_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_47_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_48_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_48:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(48-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_48_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_48_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_48_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_48_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_48_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_49_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_49:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(49-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_49_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_49_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_49_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_49_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_49_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_50_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_50:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(50-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_50_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_50_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_50_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_50_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_50_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_51_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_51:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(51-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_51_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_51_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_51_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_51_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_51_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_52_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_52:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(52-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_52_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_52_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_52_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_52_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_52_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_53_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_53:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(53-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_53_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_53_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_53_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_53_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_53_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_54_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_54:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(54-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_54_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_54_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_54_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_54_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_54_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_55_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_55:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(55-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_55_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_55_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_55_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_55_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_55_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_56_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_56:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(56-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_56_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_56_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_56_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_56_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_56_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_57_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_57:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(57-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_57_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_57_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_57_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_57_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_57_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_58_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_58:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(58-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_58_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_58_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_58_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_58_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_58_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_59_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_59:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(59-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_59_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_59_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_59_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_59_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_59_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_62_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_62:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(62-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_62_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_62_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_62_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_62_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_62_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#if INTR0x60_MONDO_63_V || INTR0x60_INIT_ALL_PIU_INT_MAP
intr0x60_sys_init_piu_int_map_mondo_63:
    best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(63-20)),
                 %l1, %l3)
    best_set_reg(mpeval((INTR0x60_MONDO_63_MODE   << PCI_E_INT_MAP_MDO_MODE_SHIFT)+
                        (INTR0x60_MONDO_63_V      << PCI_E_INT_MAP_V_SHIFT)+
                        (INTR0x60_MONDO_63_THREAD << PCI_E_INT_MAP_THREADID_SHIFT)+
                        (1 << (INTR0x60_MONDO_63_CNTRL+PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT))),
                        %l1, %l2)
#ifdef PORTABLE_CORE
    set   0x38, %l1
    sllx  %l1, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    andn  %l2, %l1, %l2
    sllx  %l7, PCI_E_INT_MAP_THREADID_SHIFT, %l1
    or    %l1, %l2, %l2          ! Use core ID of core running on
#endif
    stx  %l2, [%l3]
#endif /* INTR0x60_MONDO_63_V || INTR0x60_INIT_ALL_PIU_INT_MAP */

#endif /* INTR0x60_MONDO_IV */
