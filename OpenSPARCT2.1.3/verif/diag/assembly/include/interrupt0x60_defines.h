/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt0x60_defines.h
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
#ifndef INTERRUPT0x60_DEFINES_H
#define INTERRUPT0x60_DEFINES_H 1

#define H_HT0_Interrupt_0x60
/* Note: Must preserve %o7, so save it temporarily in %g7 */
#define My_HT0_Interrupt_0x60 \
        mov     %o7, %g7; \
        call    intr0x60_handler; \
        nop


/*
 * This is tightly linked with interrupt0x60_init.s
 *
 * Here are the supported CPP macros.  In all cases,
 * <I> stands for an index, allowing multiple uniquely-named macros.
 * <IVN> stands for an interrupt vector number, 0-63.
 * <M> stands for PIU mondo number (20-59, 62, 63).
 * <T> stands for a thread number (0-63).
 *
 *   INTR0x60_BAD_IV=<IVN>
 *         If defined, interrupt vector <IVN> is used in INT_MAN
 *         and MONDO_INT_VEC for any interrupts that are not allowed.
 *         If not defined, interrupt vector 9 will be used.
 *
 *   INTR0x60_BAD_THREAD=<T>
 *         If defined, thread <T> is used in INT_MAN
 *         for any interrupts that are not allowed.
 *         If not defined, thread 0 will be used.
 *
 *
 *
 *   INTR0x60_CC_IV_<I>=<IVN>  (<I> = 0-47)
 *         If defined, interrupt vector <IVN> is permitted to be used
 *         for cross-call interrupts. (Max of 48 interrupt vectors can
 *         be used for this purpose; could be increased if needed.)
 *
 *   INTR0x60_CC_DEST_ALL
 *         If defined, allow cross-call interrupts to all threads.
 *         If not defined, check the target thread against
 *         INTR0x60_CC_DEST_<T>
 *
 *   INTR0x60_CC_DEST_<T>
 *         Ignored if INTR0x60_CC_DEST_ALL is defined.
 *         If defined to a non-zero value,
 *         allow cross-call interrupts to thread <T>
 *         If not defined, or defined as zero,
 *         do not allow cross-call interrupts to thread <T>
 *
 *   INTR0x60_CC_EXTRA_HANDLER
 *         If defined (as assembler code), the code will be executed
 *         at the end of the trap handler in hyperprivileged mode.
 *         The code can assume %g1 is the current thread,
 *         and %g2 is the received interrupt vector number.
 *
 *
 *
 *   INTR0x60_MONDO_IV=<IVN>
 *         If defined, interrupt vector <IVN> is used for mondo interrupts
 *         (INTx, MSI, PCIe power management).  If not defined, mondo
 *         interrupts will be assigned to INTR0x60_BAD_IV.
 *
 *    INTR0x60_MONDO_<M>_V=1
 *         If defined to a non-zero value, mondo <M> will be dispatched to
 *         a thread.  Otherwise, mondo <M> will not be dispatched.  Used to
 *         set up the PIU Interrupt Mapping Registers.
 *
 *    INTR0x60_MONDO_<M>_MODE=1
 *         If defined to a non-zero value, mondo <M> will bear data (MDO_MODE).
 *         Otherwise, mondo <M> will not bear data.  Used to set up
 *         the PIU Interrupt Mapping Registers.
 *
 *    INTR0x60_MONDO_BAD_THREAD=<T>
 *         If defined, any unused mondo will be assigned to thread <T>.
 *         Otherwise, any unused mondo will be assigned to INTR0x60_BAD_THREAD.
 *         Used to set up the PIU Interrupt Mapping Registers when
 *         INTR0x60_MONDO_<M>_THREAD is not defined.
 *
 *    INTR0x60_MONDO_<M>_THREAD=<T>
 *         If defined, mondo <M> will be assigned to thread <T>.
 *         Otherwise, mondo <M> will be assigned to INTR0x60_MONDO_BAD_THREAD.
 *         Used to set up the PIU Interrupt Mapping Registers.
 *
 *    INTR0x60_MONDO_<M>_CNTRL=<N>  (<N> = 0-3)
 *         If defined, mondo <M> will be assigned to interrupt controller <N>.
 *         Otherwise, mondo <M> will be assigned to interrupt controller 0.
 *         Used to set up the PIU Interrupt Mapping Registers.
 *
 *    INTR0x60_MONDO_<M>_DMAEPT_ENGINE=<N>  (<N> = 1-4)
 *         Unused for Denali endpoint; used for DMAEPT/PEP (FC_NO_PEU_VERA).
 *         If defined, mondo <M> will be generated by DMA engine <N>.
 *         Default is 1+modulo(<M>,4).
 *         Used when clearing INTX.
 *
 *    INTR0x60_MSI_<I>_NUM=<MSI>  (<I> = 0-7, <MSI> = 0-255)
 *    INTR0x60_MSI_<I>_EQN=<EQN>  (<I> = 0-7, <EQN> = 0-35)
 *         If defined, MSI <MSI> will be written to event queue <EQN>.
 *         Otherwise, MSI <MSI> will be treated as an error.
 *         Note that INTR0x60_MONDO_<M>_* must be defined, where
 *         <M> is equal to <EQN> plus 24.
 *         Used to set up the PIU MSI Mapping Registers.
 *
 *    INTR0x60_PM_PME_EQN=<EQN>  (<EQN> = 0-35)
 *         If defined, PM_PME messages will be written to event queue <EQN>.
 *         Otherwise, PM_PME messages will be treated as an error.
 *         Note that INTR0x60_MONDO_<M>_* must be defined, where
 *         <M> is equal to <EQN> plus 24.
 *         Used to set up the PIU PM_PME Mapping Registers.
 *
 *    INTR0x60_PME_TO_ACK_EQN=<EQN>  (<EQN> = 0-35)
 *         If defined, PME_TO_ACK messages will be written to event queue <EQN>.
 *         Otherwise, PME_TO_ACK messages will be treated as an error.
 *         Note that INTR0x60_MONDO_<M>_* must be defined, where
 *         <M> is equal to <EQN> plus 24.
 *         Used to set up the PIU PME_TO_ACK Mapping Registers.
 *
 *    INTR0x60_EVENT_QUEUE_BASE
 *         Label of data area for the event queue.
 *         Must be 512KB aligned (19 lowest bits must be 0).
 *         Must be defined if using MSI, PM_PME or PME_TO_ACK.
 *
 *    INTR0x60_MSI_START_ADDRESS
 *         Starting PCI-E address for MSI messages.
 *         Must be 64KB aligned (16 lowest bits must be 0).
 *         Must be defined if using MSI.
 *
 *    INTR0x60_INTX_DEASSERT_TIMEOUT
 *         Maximum number of iterations while waiting for
 *         the interrupt status bit in PCI_E_INTX_STATUS_ADDR
 *         to be cleared after requesting the PCI-E endpoint
 *         to send the deassert message.
 *
 *    INTR0x60_INT<x>_EXTRA_HANDLER (<x> = A, B, C or D)
 *         If defined (as assembler code), the code will be executed
 *         at the end of the trap handler in hyperprivileged mode.
 *         The code can assume %g1 is the current thread, and
 *         %g2 is the received interrupt vector number.
 *
 *    INTR0x60_MSI_<I>_EXTRA_HANDLER_WHILE_BUSY
 *         If defined (as assembler code), the code will be executed
 *         in the trap handler in hyperprivileged mode while the
 *         mondo busy flag (MONDO_INT_ABUSY) is still asserted.
 *         The code can assume %g1 is the current thread,
 *         %g2 is the received interrupt vector number, and
 *         %g3 is the mondo number.
 *
 *    INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED
 *         If defined (as assembler code), the code will be executed
 *         in the trap handler in hyperprivileged mode while the
 *         event queue is disabled.
 *         The code can assume %g1 is the current thread,
 *         %g2 is the received interrupt vector number, and
 *         %g3 is the mondo number.
 *
 *    INTR0x60_MSI_EXTRA_HANDLER
 *         If defined (as assembler code), the code will be executed
 *         at the end of the trap handler in hyperprivileged mode.
 *         The code can assume %g1 is the current thread,
 *         %g2 is the received interrupt vector number, and
 *         %g3 is the mondo number.
 *
 *    INTR0x60_PM_PME_EXTRA_HANDLER_WHILE_EQ_DISABLED
 *         If defined (as assembler code), the code will be executed
 *         in the trap handler in hyperprivileged mode while the
 *         event queue is disabled.
 *         The code can assume %g1 is the current thread,
 *         %g2 is the received interrupt vector number, and
 *         %g3 is the mondo number.
 *
 *    INTR0x60_PM_PME_EXTRA_HANDLER
 *         If defined (as assembler code), the code will be executed
 *         at the end of the trap handler in hyperprivileged mode.
 *         The code can assume %g1 is the current thread,
 *         %g2 is the received interrupt vector number, and
 *         %g3 is the mondo number.
 *
 *    INTR0x60_PME_TO_ACK_EXTRA_HANDLER_WHILE_EQ_DISABLED
 *         If defined (as assembler code), the code will be executed
 *         in the trap handler in hyperprivileged mode while the
 *         event queue is disabled.
 *         The code can assume %g1 is the current thread,
 *         %g2 is the received interrupt vector number, and
 *         %g3 is the mondo number.
 *
 *    INTR0x60_PME_TO_ACK_EXTRA_HANDLER
 *         If defined (as assembler code), the code will be executed
 *         at the end of the trap handler in hyperprivileged mode.
 *         The code can assume %g1 is the current thread,
 *         %g2 is the received interrupt vector number, and
 *         %g3 is the mondo number.
 *
 *
 *
 *   INTR0x60_NIU_RX_IV_<I>=<IVN>  (<I> = 0-15)
 *         If defined, interrupts coming from NIU Logical Device Group <IVN>
 *         are permitted and will be assigned to interrupt vector <IVN>.
 *         The interrupt must be caused by RX DMA.
 *         (Max of 16 interrupt vectors can be used for this purpose;
 *         could be increased if needed.)
 *         NOTE: The interrupt vector number is always the same
 *               as the Logical Device Group.  The System Interrupt
 *               Data register in the NIU for the LDG will be
 *               initialized to <IVN>+64
 *
 *   INTR0x60_NIU_RX_DMA_<I>=<N>  (<I> = 0-15; <N> = 0-15)
 *         Must be defined if INTR0x60_NIU_RX_IV_<I> is defined (same <I>).
 *         Interrupts coming from NIU RX DMA Channel <N>
 *         will be assigned to the NIU Logical Device Group specified
 *         by INTR0x60_NIU_RX_IV_<I> (same <I>).
 *
 *   INTR0x60_NIU_RX_THREAD_<I>=<T>  (<I> = 0-15)
 *         If defined, interrupts coming from NIU Logical Device Group
 *         specified by INTR0x60_NIU_RX_IV_<I> (same <I>) will be sent to
 *         thread <T>.  If not defined, those interrupts
 *         will be sent to INTR0x60_NIU_BAD_THREAD.
 *
 *   INTR0x60_NIU_RX_EXTRA_HANDLER
 *         If defined (as assembler code), the code will be executed
 *         at the end of the trap handler in hyperprivileged mode.
 *         The code can assume %g1 is the current thread,
 *         %g2 is the received interrupt vector number, and
 *         %g3 is the RX DMA channel number.
 *
 *   INTR0x60_NIU_RX_FATAL_HANDLER
 *         If defined (as assembler code), the code will be executed
 *         (in hyperprivileged mode) as soon as the trap handler
 *         determines that the NIU RX interrupt was caused by a
 *         fatal error.  The code must finish with a "retry" instruction.
 *         The code can assume %g1 is the current thread,
 *         %g2 is the received interrupt vector number,
 *         %g3 is the RX DMA channel number,
 *         %g4 is the address of the RX_DMA_CTL_STAT register, and
 *         %g5 is the value of the RX_DMA_CTL_STAT register.
 *
 *   INTR0x60_NIU_RX_CLEAR_FATAL_FOR_TSOTOOL
 *         If defined, and the trap handler determines that the
 *         NIU RX interrupt was caused by a fatal error, the RX DMA
 *         channel will be reset in a way that is compatible with
 *         the tsotool NIU RX interrupt macro.  Afterward, the
 *         INTR0x60_NIU_RX_EXTRA_HANDLER code (if any) will be executed.
 *         INTR0x60_NIU_RX_FATAL_HANDLER preempts this macro.
 *   If the trap handler determines that an NIU RX interrupt was
 *   caused by a fatal error and neither INTR0x60_NIU_RX_FATAL_HANDLER
 *   nor INTR0x60_NIU_RX_CLEAR_FATAL_FOR_TSOTOOL are defined, then the
 *   trap handler will execute EXIT_BAD.
 *
 *
 *
 *   INTR0x60_NIU_TX_IV_<I>=<IVN>  (<I> = 0-15)
 *         If defined, interrupts coming from NIU Logical Device Group <IVN>
 *         are permitted and will be assigned to interrupt vector <IVN>.
 *         The interrupt must be caused by TX DMA.
 *         (Max of 16 interrupt vectors can be used for this purpose;
 *         could be increased if needed.)
 *         NOTE: The interrupt vector number is always the same
 *               as the Logical Device Group.  The System Interrupt
 *               Data register in the NIU for the LDG will be
 *               initialized to <IVN>+64
 *
 *   INTR0x60_NIU_TX_DMA_<I>=<N>  (<I> = 0-15; <N> = 0-15)
 *         Must be defined if INTR0x60_NIU_TX_IV_<I> is defined (same <I>).
 *         Interrupts coming from NIU TX DMA Channel <N>
 *         will be assigned to the NIU Logical Device Group specified
 *         by INTR0x60_NIU_TX_IV_<I> (same <I>).
 *
 *   INTR0x60_NIU_TX_THREAD_<I>=<T>  (<I> = 0-15)
 *         If defined, interrupts coming from NIU Logical Device Group
 *         specified by INTR0x60_NIU_TX_IV_<I> (same <I>) will be sent to
 *         thread <T>.  If not defined, those interrupts
 *         will be sent to INTR0x60_NIU_BAD_THREAD.
 *
 *   INTR0x60_NIU_TX_EXTRA_HANDLER
 *         If defined (as assembler code), the code will be executed
 *         at the end of the trap handler in hyperprivileged mode.
 *         The code can assume %g1 is the current thread,
 *         %g2 is the received interrupt vector number, and
 *         %g3 is the TX DMA channel number.
 *
 *
 *
 *   INTR0x60_SSI_ERR_IV=<IVN>
 *         If defined, interrupt vector <IVN> is used for SSI error
 *         interrupts.  If not defined, SSI error interrupts will
 *         be assigned to INTR0x60_BAD_IV.
 *
 *   INTR0x60_SSI_ERR_THREAD=<T>
 *         If defined, thread <T> is used for SSI error
 *         interrupts.  If not defined, SSI error interrupts will
 *         be assigned to INTR0x60_BAD_THREAD.
 *
 *   INTR0x60_SSI_ERR_EXTRA_HANDLER
 *         If defined (as assembler code), the code will be executed
 *         at the end of the trap handler in hyperprivileged mode.
 *         The code can assume %g1 is the current thread, and
 *         %g2 is the received interrupt vector number
 *
 *
 *
 *   INTR0x60_SSI_INT_IV=<IVN>
 *         If defined, interrupt vector <IVN> is used for SSI_EXT_INT_L
 *         interrupts.  If not defined, SSI_EXT_INT_L interrupts will
 *         be assigned to INTR0x60_BAD_IV.
 *
 *   INTR0x60_SSI_INT_THREAD=<T>
 *         If defined, thread <T> is used for SSI_EXT_INT_L
 *         interrupts.  If not defined, SSI_EXT_INT_L interrupts will
 *         be assigned to INTR0x60_BAD_THREAD.
 *
 *   INTR0x60_SSI_INT_EXTRA_HANDLER
 *         If defined (as assembler code), the code will be executed
 *         at the end of the trap handler in hyperprivileged mode.
 *         The code can assume %g1 is the current thread, and
 *         %g2 is the received interrupt vector number
 *
 */

#ifndef INTR0x60_BAD_IV
#define INTR0x60_BAD_IV 9
#endif /* INTR0x60_BAD_IV */

#ifndef INTR0x60_BAD_THREAD
#define INTR0x60_BAD_THREAD 0
#endif /* INTR0x60_BAD_THREAD */

#ifndef INTR0x60_MONDO_BAD_THREAD
#define INTR0x60_MONDO_BAD_THREAD INTR0x60_BAD_THREAD
#endif /* INTR0x60_MONDO_BAD_THREAD */

#ifndef INTR0x60_NIU_BAD_THREAD
#define INTR0x60_NIU_BAD_THREAD   INTR0x60_BAD_THREAD
#endif /* INTR0x60_NIU_BAD_THREAD */


/****************************************/
#ifndef INTR0x60_SSI_ERR_IV
#define INTR0x60_SSI_ERR_IV INTR0x60_BAD_IV
#endif /* INTR0x60_SSI_ERR_IV */

#ifndef INTR0x60_SSI_ERR_THREAD
#define INTR0x60_SSI_ERR_THREAD INTR0x60_BAD_THREAD
#endif /* INTR0x60_SSI_ERR_THREAD */

#ifndef INTR0x60_SSI_INT_IV
#define INTR0x60_SSI_INT_IV INTR0x60_BAD_IV
#endif /* INTR0x60_SSI_INT_IV */

#ifndef INTR0x60_SSI_INT_THREAD
#define INTR0x60_SSI_INT_THREAD INTR0x60_BAD_THREAD
#endif /* INTR0x60_SSI_INT_THREAD */



/****************************************/
#if INTR0x60_MONDO_20_MODE
#define INTR0x60_MONDO_20_MODE 1
#else
#define INTR0x60_MONDO_20_MODE 0
#endif /* INTR0x60_MONDO_20_MODE */

#if INTR0x60_MONDO_20_V
#define INTR0x60_MONDO_20_V 1
#else
#define INTR0x60_MONDO_20_V 0
#endif /* INTR0x60_MONDO_20_V */

#ifndef INTR0x60_MONDO_20_THREAD
#define INTR0x60_MONDO_20_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_20_THREAD */

#ifndef INTR0x60_MONDO_20_CNTRL
#define INTR0x60_MONDO_20_CNTRL 0
#endif /* INTR0x60_MONDO_20_CNTRL */

#ifndef INTR0x60_MONDO_20_DMAEPT_ENGINE
#define INTR0x60_MONDO_20_DMAEPT_ENGINE 1
#endif /* INTR0x60_MONDO_20_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_21_MODE
#define INTR0x60_MONDO_21_MODE 1
#else
#define INTR0x60_MONDO_21_MODE 0
#endif /* INTR0x60_MONDO_21_MODE */

#if INTR0x60_MONDO_21_V
#define INTR0x60_MONDO_21_V 1
#else
#define INTR0x60_MONDO_21_V 0
#endif /* INTR0x60_MONDO_21_V */

#ifndef INTR0x60_MONDO_21_THREAD
#define INTR0x60_MONDO_21_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_21_THREAD */

#ifndef INTR0x60_MONDO_21_CNTRL
#define INTR0x60_MONDO_21_CNTRL 0
#endif /* INTR0x60_MONDO_21_CNTRL */

#ifndef INTR0x60_MONDO_21_DMAEPT_ENGINE
#define INTR0x60_MONDO_21_DMAEPT_ENGINE 2
#endif /* INTR0x60_MONDO_21_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_22_MODE
#define INTR0x60_MONDO_22_MODE 1
#else
#define INTR0x60_MONDO_22_MODE 0
#endif /* INTR0x60_MONDO_22_MODE */

#if INTR0x60_MONDO_22_V
#define INTR0x60_MONDO_22_V 1
#else
#define INTR0x60_MONDO_22_V 0
#endif /* INTR0x60_MONDO_22_V */

#ifndef INTR0x60_MONDO_22_THREAD
#define INTR0x60_MONDO_22_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_22_THREAD */

#ifndef INTR0x60_MONDO_22_CNTRL
#define INTR0x60_MONDO_22_CNTRL 0
#endif /* INTR0x60_MONDO_22_CNTRL */

#ifndef INTR0x60_MONDO_22_DMAEPT_ENGINE
#define INTR0x60_MONDO_22_DMAEPT_ENGINE 3
#endif /* INTR0x60_MONDO_22_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_23_MODE
#define INTR0x60_MONDO_23_MODE 1
#else
#define INTR0x60_MONDO_23_MODE 0
#endif /* INTR0x60_MONDO_23_MODE */

#if INTR0x60_MONDO_23_V
#define INTR0x60_MONDO_23_V 1
#else
#define INTR0x60_MONDO_23_V 0
#endif /* INTR0x60_MONDO_23_V */

#ifndef INTR0x60_MONDO_23_THREAD
#define INTR0x60_MONDO_23_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_23_THREAD */

#ifndef INTR0x60_MONDO_23_CNTRL
#define INTR0x60_MONDO_23_CNTRL 0
#endif /* INTR0x60_MONDO_23_CNTRL */

#ifndef INTR0x60_MONDO_23_DMAEPT_ENGINE
#define INTR0x60_MONDO_23_DMAEPT_ENGINE 4
#endif /* INTR0x60_MONDO_23_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_24_MODE
#define INTR0x60_MONDO_24_MODE 1
#else
#define INTR0x60_MONDO_24_MODE 0
#endif /* INTR0x60_MONDO_24_MODE */

#if INTR0x60_MONDO_24_V
#define INTR0x60_MONDO_24_V 1
#else
#define INTR0x60_MONDO_24_V 0
#endif /* INTR0x60_MONDO_24_V */

#ifndef INTR0x60_MONDO_24_THREAD
#define INTR0x60_MONDO_24_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_24_THREAD */

#ifndef INTR0x60_MONDO_24_CNTRL
#define INTR0x60_MONDO_24_CNTRL 0
#endif /* INTR0x60_MONDO_24_CNTRL */

#ifndef INTR0x60_MONDO_24_DMAEPT_ENGINE
#define INTR0x60_MONDO_24_DMAEPT_ENGINE 1
#endif /* INTR0x60_MONDO_24_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_25_MODE
#define INTR0x60_MONDO_25_MODE 1
#else
#define INTR0x60_MONDO_25_MODE 0
#endif /* INTR0x60_MONDO_25_MODE */

#if INTR0x60_MONDO_25_V
#define INTR0x60_MONDO_25_V 1
#else
#define INTR0x60_MONDO_25_V 0
#endif /* INTR0x60_MONDO_25_V */

#ifndef INTR0x60_MONDO_25_THREAD
#define INTR0x60_MONDO_25_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_25_THREAD */

#ifndef INTR0x60_MONDO_25_CNTRL
#define INTR0x60_MONDO_25_CNTRL 0
#endif /* INTR0x60_MONDO_25_CNTRL */

#ifndef INTR0x60_MONDO_25_DMAEPT_ENGINE
#define INTR0x60_MONDO_25_DMAEPT_ENGINE 2
#endif /* INTR0x60_MONDO_25_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_26_MODE
#define INTR0x60_MONDO_26_MODE 1
#else
#define INTR0x60_MONDO_26_MODE 0
#endif /* INTR0x60_MONDO_26_MODE */

#if INTR0x60_MONDO_26_V
#define INTR0x60_MONDO_26_V 1
#else
#define INTR0x60_MONDO_26_V 0
#endif /* INTR0x60_MONDO_26_V */

#ifndef INTR0x60_MONDO_26_THREAD
#define INTR0x60_MONDO_26_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_26_THREAD */

#ifndef INTR0x60_MONDO_26_CNTRL
#define INTR0x60_MONDO_26_CNTRL 0
#endif /* INTR0x60_MONDO_26_CNTRL */

#ifndef INTR0x60_MONDO_26_DMAEPT_ENGINE
#define INTR0x60_MONDO_26_DMAEPT_ENGINE 3
#endif /* INTR0x60_MONDO_26_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_27_MODE
#define INTR0x60_MONDO_27_MODE 1
#else
#define INTR0x60_MONDO_27_MODE 0
#endif /* INTR0x60_MONDO_27_MODE */

#if INTR0x60_MONDO_27_V
#define INTR0x60_MONDO_27_V 1
#else
#define INTR0x60_MONDO_27_V 0
#endif /* INTR0x60_MONDO_27_V */

#ifndef INTR0x60_MONDO_27_THREAD
#define INTR0x60_MONDO_27_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_27_THREAD */

#ifndef INTR0x60_MONDO_27_CNTRL
#define INTR0x60_MONDO_27_CNTRL 0
#endif /* INTR0x60_MONDO_27_CNTRL */

#ifndef INTR0x60_MONDO_27_DMAEPT_ENGINE
#define INTR0x60_MONDO_27_DMAEPT_ENGINE 4
#endif /* INTR0x60_MONDO_27_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_28_MODE
#define INTR0x60_MONDO_28_MODE 1
#else
#define INTR0x60_MONDO_28_MODE 0
#endif /* INTR0x60_MONDO_28_MODE */

#if INTR0x60_MONDO_28_V
#define INTR0x60_MONDO_28_V 1
#else
#define INTR0x60_MONDO_28_V 0
#endif /* INTR0x60_MONDO_28_V */

#ifndef INTR0x60_MONDO_28_THREAD
#define INTR0x60_MONDO_28_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_28_THREAD */

#ifndef INTR0x60_MONDO_28_CNTRL
#define INTR0x60_MONDO_28_CNTRL 0
#endif /* INTR0x60_MONDO_28_CNTRL */

#ifndef INTR0x60_MONDO_28_DMAEPT_ENGINE
#define INTR0x60_MONDO_28_DMAEPT_ENGINE 1
#endif /* INTR0x60_MONDO_28_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_29_MODE
#define INTR0x60_MONDO_29_MODE 1
#else
#define INTR0x60_MONDO_29_MODE 0
#endif /* INTR0x60_MONDO_29_MODE */

#if INTR0x60_MONDO_29_V
#define INTR0x60_MONDO_29_V 1
#else
#define INTR0x60_MONDO_29_V 0
#endif /* INTR0x60_MONDO_29_V */

#ifndef INTR0x60_MONDO_29_THREAD
#define INTR0x60_MONDO_29_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_29_THREAD */

#ifndef INTR0x60_MONDO_29_CNTRL
#define INTR0x60_MONDO_29_CNTRL 0
#endif /* INTR0x60_MONDO_29_CNTRL */

#ifndef INTR0x60_MONDO_29_DMAEPT_ENGINE
#define INTR0x60_MONDO_29_DMAEPT_ENGINE 2
#endif /* INTR0x60_MONDO_29_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_30_MODE
#define INTR0x60_MONDO_30_MODE 1
#else
#define INTR0x60_MONDO_30_MODE 0
#endif /* INTR0x60_MONDO_30_MODE */

#if INTR0x60_MONDO_30_V
#define INTR0x60_MONDO_30_V 1
#else
#define INTR0x60_MONDO_30_V 0
#endif /* INTR0x60_MONDO_30_V */

#ifndef INTR0x60_MONDO_30_THREAD
#define INTR0x60_MONDO_30_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_30_THREAD */

#ifndef INTR0x60_MONDO_30_CNTRL
#define INTR0x60_MONDO_30_CNTRL 0
#endif /* INTR0x60_MONDO_30_CNTRL */

#ifndef INTR0x60_MONDO_30_DMAEPT_ENGINE
#define INTR0x60_MONDO_30_DMAEPT_ENGINE 3
#endif /* INTR0x60_MONDO_30_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_31_MODE
#define INTR0x60_MONDO_31_MODE 1
#else
#define INTR0x60_MONDO_31_MODE 0
#endif /* INTR0x60_MONDO_31_MODE */

#if INTR0x60_MONDO_31_V
#define INTR0x60_MONDO_31_V 1
#else
#define INTR0x60_MONDO_31_V 0
#endif /* INTR0x60_MONDO_31_V */

#ifndef INTR0x60_MONDO_31_THREAD
#define INTR0x60_MONDO_31_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_31_THREAD */

#ifndef INTR0x60_MONDO_31_CNTRL
#define INTR0x60_MONDO_31_CNTRL 0
#endif /* INTR0x60_MONDO_31_CNTRL */

#ifndef INTR0x60_MONDO_31_DMAEPT_ENGINE
#define INTR0x60_MONDO_31_DMAEPT_ENGINE 4
#endif /* INTR0x60_MONDO_31_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_32_MODE
#define INTR0x60_MONDO_32_MODE 1
#else
#define INTR0x60_MONDO_32_MODE 0
#endif /* INTR0x60_MONDO_32_MODE */

#if INTR0x60_MONDO_32_V
#define INTR0x60_MONDO_32_V 1
#else
#define INTR0x60_MONDO_32_V 0
#endif /* INTR0x60_MONDO_32_V */

#ifndef INTR0x60_MONDO_32_THREAD
#define INTR0x60_MONDO_32_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_32_THREAD */

#ifndef INTR0x60_MONDO_32_CNTRL
#define INTR0x60_MONDO_32_CNTRL 0
#endif /* INTR0x60_MONDO_32_CNTRL */

#ifndef INTR0x60_MONDO_32_DMAEPT_ENGINE
#define INTR0x60_MONDO_32_DMAEPT_ENGINE 1
#endif /* INTR0x60_MONDO_32_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_33_MODE
#define INTR0x60_MONDO_33_MODE 1
#else
#define INTR0x60_MONDO_33_MODE 0
#endif /* INTR0x60_MONDO_33_MODE */

#if INTR0x60_MONDO_33_V
#define INTR0x60_MONDO_33_V 1
#else
#define INTR0x60_MONDO_33_V 0
#endif /* INTR0x60_MONDO_33_V */

#ifndef INTR0x60_MONDO_33_THREAD
#define INTR0x60_MONDO_33_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_33_THREAD */

#ifndef INTR0x60_MONDO_33_CNTRL
#define INTR0x60_MONDO_33_CNTRL 0
#endif /* INTR0x60_MONDO_33_CNTRL */

#ifndef INTR0x60_MONDO_33_DMAEPT_ENGINE
#define INTR0x60_MONDO_33_DMAEPT_ENGINE 2
#endif /* INTR0x60_MONDO_33_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_34_MODE
#define INTR0x60_MONDO_34_MODE 1
#else
#define INTR0x60_MONDO_34_MODE 0
#endif /* INTR0x60_MONDO_34_MODE */

#if INTR0x60_MONDO_34_V
#define INTR0x60_MONDO_34_V 1
#else
#define INTR0x60_MONDO_34_V 0
#endif /* INTR0x60_MONDO_34_V */

#ifndef INTR0x60_MONDO_34_THREAD
#define INTR0x60_MONDO_34_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_34_THREAD */

#ifndef INTR0x60_MONDO_34_CNTRL
#define INTR0x60_MONDO_34_CNTRL 0
#endif /* INTR0x60_MONDO_34_CNTRL */

#ifndef INTR0x60_MONDO_34_DMAEPT_ENGINE
#define INTR0x60_MONDO_34_DMAEPT_ENGINE 3
#endif /* INTR0x60_MONDO_34_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_35_MODE
#define INTR0x60_MONDO_35_MODE 1
#else
#define INTR0x60_MONDO_35_MODE 0
#endif /* INTR0x60_MONDO_35_MODE */

#if INTR0x60_MONDO_35_V
#define INTR0x60_MONDO_35_V 1
#else
#define INTR0x60_MONDO_35_V 0
#endif /* INTR0x60_MONDO_35_V */

#ifndef INTR0x60_MONDO_35_THREAD
#define INTR0x60_MONDO_35_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_35_THREAD */

#ifndef INTR0x60_MONDO_35_CNTRL
#define INTR0x60_MONDO_35_CNTRL 0
#endif /* INTR0x60_MONDO_35_CNTRL */

#ifndef INTR0x60_MONDO_35_DMAEPT_ENGINE
#define INTR0x60_MONDO_35_DMAEPT_ENGINE 4
#endif /* INTR0x60_MONDO_35_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_36_MODE
#define INTR0x60_MONDO_36_MODE 1
#else
#define INTR0x60_MONDO_36_MODE 0
#endif /* INTR0x60_MONDO_36_MODE */

#if INTR0x60_MONDO_36_V
#define INTR0x60_MONDO_36_V 1
#else
#define INTR0x60_MONDO_36_V 0
#endif /* INTR0x60_MONDO_36_V */

#ifndef INTR0x60_MONDO_36_THREAD
#define INTR0x60_MONDO_36_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_36_THREAD */

#ifndef INTR0x60_MONDO_36_CNTRL
#define INTR0x60_MONDO_36_CNTRL 0
#endif /* INTR0x60_MONDO_36_CNTRL */

#ifndef INTR0x60_MONDO_36_DMAEPT_ENGINE
#define INTR0x60_MONDO_36_DMAEPT_ENGINE 1
#endif /* INTR0x60_MONDO_36_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_37_MODE
#define INTR0x60_MONDO_37_MODE 1
#else
#define INTR0x60_MONDO_37_MODE 0
#endif /* INTR0x60_MONDO_37_MODE */

#if INTR0x60_MONDO_37_V
#define INTR0x60_MONDO_37_V 1
#else
#define INTR0x60_MONDO_37_V 0
#endif /* INTR0x60_MONDO_37_V */

#ifndef INTR0x60_MONDO_37_THREAD
#define INTR0x60_MONDO_37_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_37_THREAD */

#ifndef INTR0x60_MONDO_37_CNTRL
#define INTR0x60_MONDO_37_CNTRL 0
#endif /* INTR0x60_MONDO_37_CNTRL */

#ifndef INTR0x60_MONDO_37_DMAEPT_ENGINE
#define INTR0x60_MONDO_37_DMAEPT_ENGINE 2
#endif /* INTR0x60_MONDO_37_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_38_MODE
#define INTR0x60_MONDO_38_MODE 1
#else
#define INTR0x60_MONDO_38_MODE 0
#endif /* INTR0x60_MONDO_38_MODE */

#if INTR0x60_MONDO_38_V
#define INTR0x60_MONDO_38_V 1
#else
#define INTR0x60_MONDO_38_V 0
#endif /* INTR0x60_MONDO_38_V */

#ifndef INTR0x60_MONDO_38_THREAD
#define INTR0x60_MONDO_38_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_38_THREAD */

#ifndef INTR0x60_MONDO_38_CNTRL
#define INTR0x60_MONDO_38_CNTRL 0
#endif /* INTR0x60_MONDO_38_CNTRL */

#ifndef INTR0x60_MONDO_38_DMAEPT_ENGINE
#define INTR0x60_MONDO_38_DMAEPT_ENGINE 3
#endif /* INTR0x60_MONDO_38_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_39_MODE
#define INTR0x60_MONDO_39_MODE 1
#else
#define INTR0x60_MONDO_39_MODE 0
#endif /* INTR0x60_MONDO_39_MODE */

#if INTR0x60_MONDO_39_V
#define INTR0x60_MONDO_39_V 1
#else
#define INTR0x60_MONDO_39_V 0
#endif /* INTR0x60_MONDO_39_V */

#ifndef INTR0x60_MONDO_39_THREAD
#define INTR0x60_MONDO_39_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_39_THREAD */

#ifndef INTR0x60_MONDO_39_CNTRL
#define INTR0x60_MONDO_39_CNTRL 0
#endif /* INTR0x60_MONDO_39_CNTRL */

#ifndef INTR0x60_MONDO_39_DMAEPT_ENGINE
#define INTR0x60_MONDO_39_DMAEPT_ENGINE 4
#endif /* INTR0x60_MONDO_39_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_40_MODE
#define INTR0x60_MONDO_40_MODE 1
#else
#define INTR0x60_MONDO_40_MODE 0
#endif /* INTR0x60_MONDO_40_MODE */

#if INTR0x60_MONDO_40_V
#define INTR0x60_MONDO_40_V 1
#else
#define INTR0x60_MONDO_40_V 0
#endif /* INTR0x60_MONDO_40_V */

#ifndef INTR0x60_MONDO_40_THREAD
#define INTR0x60_MONDO_40_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_40_THREAD */

#ifndef INTR0x60_MONDO_40_CNTRL
#define INTR0x60_MONDO_40_CNTRL 0
#endif /* INTR0x60_MONDO_40_CNTRL */

#ifndef INTR0x60_MONDO_40_DMAEPT_ENGINE
#define INTR0x60_MONDO_40_DMAEPT_ENGINE 1
#endif /* INTR0x60_MONDO_40_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_41_MODE
#define INTR0x60_MONDO_41_MODE 1
#else
#define INTR0x60_MONDO_41_MODE 0
#endif /* INTR0x60_MONDO_41_MODE */

#if INTR0x60_MONDO_41_V
#define INTR0x60_MONDO_41_V 1
#else
#define INTR0x60_MONDO_41_V 0
#endif /* INTR0x60_MONDO_41_V */

#ifndef INTR0x60_MONDO_41_THREAD
#define INTR0x60_MONDO_41_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_41_THREAD */

#ifndef INTR0x60_MONDO_41_CNTRL
#define INTR0x60_MONDO_41_CNTRL 0
#endif /* INTR0x60_MONDO_41_CNTRL */

#ifndef INTR0x60_MONDO_41_DMAEPT_ENGINE
#define INTR0x60_MONDO_41_DMAEPT_ENGINE 2
#endif /* INTR0x60_MONDO_41_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_42_MODE
#define INTR0x60_MONDO_42_MODE 1
#else
#define INTR0x60_MONDO_42_MODE 0
#endif /* INTR0x60_MONDO_42_MODE */

#if INTR0x60_MONDO_42_V
#define INTR0x60_MONDO_42_V 1
#else
#define INTR0x60_MONDO_42_V 0
#endif /* INTR0x60_MONDO_42_V */

#ifndef INTR0x60_MONDO_42_THREAD
#define INTR0x60_MONDO_42_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_42_THREAD */

#ifndef INTR0x60_MONDO_42_CNTRL
#define INTR0x60_MONDO_42_CNTRL 0
#endif /* INTR0x60_MONDO_42_CNTRL */

#ifndef INTR0x60_MONDO_42_DMAEPT_ENGINE
#define INTR0x60_MONDO_42_DMAEPT_ENGINE 3
#endif /* INTR0x60_MONDO_42_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_43_MODE
#define INTR0x60_MONDO_43_MODE 1
#else
#define INTR0x60_MONDO_43_MODE 0
#endif /* INTR0x60_MONDO_43_MODE */

#if INTR0x60_MONDO_43_V
#define INTR0x60_MONDO_43_V 1
#else
#define INTR0x60_MONDO_43_V 0
#endif /* INTR0x60_MONDO_43_V */

#ifndef INTR0x60_MONDO_43_THREAD
#define INTR0x60_MONDO_43_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_43_THREAD */

#ifndef INTR0x60_MONDO_43_CNTRL
#define INTR0x60_MONDO_43_CNTRL 0
#endif /* INTR0x60_MONDO_43_CNTRL */

#ifndef INTR0x60_MONDO_43_DMAEPT_ENGINE
#define INTR0x60_MONDO_43_DMAEPT_ENGINE 4
#endif /* INTR0x60_MONDO_43_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_44_MODE
#define INTR0x60_MONDO_44_MODE 1
#else
#define INTR0x60_MONDO_44_MODE 0
#endif /* INTR0x60_MONDO_44_MODE */

#if INTR0x60_MONDO_44_V
#define INTR0x60_MONDO_44_V 1
#else
#define INTR0x60_MONDO_44_V 0
#endif /* INTR0x60_MONDO_44_V */

#ifndef INTR0x60_MONDO_44_THREAD
#define INTR0x60_MONDO_44_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_44_THREAD */

#ifndef INTR0x60_MONDO_44_CNTRL
#define INTR0x60_MONDO_44_CNTRL 0
#endif /* INTR0x60_MONDO_44_CNTRL */

#ifndef INTR0x60_MONDO_44_DMAEPT_ENGINE
#define INTR0x60_MONDO_44_DMAEPT_ENGINE 1
#endif /* INTR0x60_MONDO_44_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_45_MODE
#define INTR0x60_MONDO_45_MODE 1
#else
#define INTR0x60_MONDO_45_MODE 0
#endif /* INTR0x60_MONDO_45_MODE */

#if INTR0x60_MONDO_45_V
#define INTR0x60_MONDO_45_V 1
#else
#define INTR0x60_MONDO_45_V 0
#endif /* INTR0x60_MONDO_45_V */

#ifndef INTR0x60_MONDO_45_THREAD
#define INTR0x60_MONDO_45_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_45_THREAD */

#ifndef INTR0x60_MONDO_45_CNTRL
#define INTR0x60_MONDO_45_CNTRL 0
#endif /* INTR0x60_MONDO_45_CNTRL */

#ifndef INTR0x60_MONDO_45_DMAEPT_ENGINE
#define INTR0x60_MONDO_45_DMAEPT_ENGINE 2
#endif /* INTR0x60_MONDO_45_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_46_MODE
#define INTR0x60_MONDO_46_MODE 1
#else
#define INTR0x60_MONDO_46_MODE 0
#endif /* INTR0x60_MONDO_46_MODE */

#if INTR0x60_MONDO_46_V
#define INTR0x60_MONDO_46_V 1
#else
#define INTR0x60_MONDO_46_V 0
#endif /* INTR0x60_MONDO_46_V */

#ifndef INTR0x60_MONDO_46_THREAD
#define INTR0x60_MONDO_46_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_46_THREAD */

#ifndef INTR0x60_MONDO_46_CNTRL
#define INTR0x60_MONDO_46_CNTRL 0
#endif /* INTR0x60_MONDO_46_CNTRL */

#ifndef INTR0x60_MONDO_46_DMAEPT_ENGINE
#define INTR0x60_MONDO_46_DMAEPT_ENGINE 3
#endif /* INTR0x60_MONDO_46_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_47_MODE
#define INTR0x60_MONDO_47_MODE 1
#else
#define INTR0x60_MONDO_47_MODE 0
#endif /* INTR0x60_MONDO_47_MODE */

#if INTR0x60_MONDO_47_V
#define INTR0x60_MONDO_47_V 1
#else
#define INTR0x60_MONDO_47_V 0
#endif /* INTR0x60_MONDO_47_V */

#ifndef INTR0x60_MONDO_47_THREAD
#define INTR0x60_MONDO_47_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_47_THREAD */

#ifndef INTR0x60_MONDO_47_CNTRL
#define INTR0x60_MONDO_47_CNTRL 0
#endif /* INTR0x60_MONDO_47_CNTRL */

#ifndef INTR0x60_MONDO_47_DMAEPT_ENGINE
#define INTR0x60_MONDO_47_DMAEPT_ENGINE 4
#endif /* INTR0x60_MONDO_47_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_48_MODE
#define INTR0x60_MONDO_48_MODE 1
#else
#define INTR0x60_MONDO_48_MODE 0
#endif /* INTR0x60_MONDO_48_MODE */

#if INTR0x60_MONDO_48_V
#define INTR0x60_MONDO_48_V 1
#else
#define INTR0x60_MONDO_48_V 0
#endif /* INTR0x60_MONDO_48_V */

#ifndef INTR0x60_MONDO_48_THREAD
#define INTR0x60_MONDO_48_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_48_THREAD */

#ifndef INTR0x60_MONDO_48_CNTRL
#define INTR0x60_MONDO_48_CNTRL 0
#endif /* INTR0x60_MONDO_48_CNTRL */

#ifndef INTR0x60_MONDO_48_DMAEPT_ENGINE
#define INTR0x60_MONDO_48_DMAEPT_ENGINE 1
#endif /* INTR0x60_MONDO_48_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_49_MODE
#define INTR0x60_MONDO_49_MODE 1
#else
#define INTR0x60_MONDO_49_MODE 0
#endif /* INTR0x60_MONDO_49_MODE */

#if INTR0x60_MONDO_49_V
#define INTR0x60_MONDO_49_V 1
#else
#define INTR0x60_MONDO_49_V 0
#endif /* INTR0x60_MONDO_49_V */

#ifndef INTR0x60_MONDO_49_THREAD
#define INTR0x60_MONDO_49_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_49_THREAD */

#ifndef INTR0x60_MONDO_49_CNTRL
#define INTR0x60_MONDO_49_CNTRL 0
#endif /* INTR0x60_MONDO_49_CNTRL */

#ifndef INTR0x60_MONDO_49_DMAEPT_ENGINE
#define INTR0x60_MONDO_49_DMAEPT_ENGINE 2
#endif /* INTR0x60_MONDO_49_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_50_MODE
#define INTR0x60_MONDO_50_MODE 1
#else
#define INTR0x60_MONDO_50_MODE 0
#endif /* INTR0x60_MONDO_50_MODE */

#if INTR0x60_MONDO_50_V
#define INTR0x60_MONDO_50_V 1
#else
#define INTR0x60_MONDO_50_V 0
#endif /* INTR0x60_MONDO_50_V */

#ifndef INTR0x60_MONDO_50_THREAD
#define INTR0x60_MONDO_50_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_50_THREAD */

#ifndef INTR0x60_MONDO_50_CNTRL
#define INTR0x60_MONDO_50_CNTRL 0
#endif /* INTR0x60_MONDO_50_CNTRL */

#ifndef INTR0x60_MONDO_50_DMAEPT_ENGINE
#define INTR0x60_MONDO_50_DMAEPT_ENGINE 3
#endif /* INTR0x60_MONDO_50_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_51_MODE
#define INTR0x60_MONDO_51_MODE 1
#else
#define INTR0x60_MONDO_51_MODE 0
#endif /* INTR0x60_MONDO_51_MODE */

#if INTR0x60_MONDO_51_V
#define INTR0x60_MONDO_51_V 1
#else
#define INTR0x60_MONDO_51_V 0
#endif /* INTR0x60_MONDO_51_V */

#ifndef INTR0x60_MONDO_51_THREAD
#define INTR0x60_MONDO_51_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_51_THREAD */

#ifndef INTR0x60_MONDO_51_CNTRL
#define INTR0x60_MONDO_51_CNTRL 0
#endif /* INTR0x60_MONDO_51_CNTRL */

#ifndef INTR0x60_MONDO_51_DMAEPT_ENGINE
#define INTR0x60_MONDO_51_DMAEPT_ENGINE 4
#endif /* INTR0x60_MONDO_51_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_52_MODE
#define INTR0x60_MONDO_52_MODE 1
#else
#define INTR0x60_MONDO_52_MODE 0
#endif /* INTR0x60_MONDO_52_MODE */

#if INTR0x60_MONDO_52_V
#define INTR0x60_MONDO_52_V 1
#else
#define INTR0x60_MONDO_52_V 0
#endif /* INTR0x60_MONDO_52_V */

#ifndef INTR0x60_MONDO_52_THREAD
#define INTR0x60_MONDO_52_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_52_THREAD */

#ifndef INTR0x60_MONDO_52_CNTRL
#define INTR0x60_MONDO_52_CNTRL 0
#endif /* INTR0x60_MONDO_52_CNTRL */

#ifndef INTR0x60_MONDO_52_DMAEPT_ENGINE
#define INTR0x60_MONDO_52_DMAEPT_ENGINE 1
#endif /* INTR0x60_MONDO_52_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_53_MODE
#define INTR0x60_MONDO_53_MODE 1
#else
#define INTR0x60_MONDO_53_MODE 0
#endif /* INTR0x60_MONDO_53_MODE */

#if INTR0x60_MONDO_53_V
#define INTR0x60_MONDO_53_V 1
#else
#define INTR0x60_MONDO_53_V 0
#endif /* INTR0x60_MONDO_53_V */

#ifndef INTR0x60_MONDO_53_THREAD
#define INTR0x60_MONDO_53_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_53_THREAD */

#ifndef INTR0x60_MONDO_53_CNTRL
#define INTR0x60_MONDO_53_CNTRL 0
#endif /* INTR0x60_MONDO_53_CNTRL */

#ifndef INTR0x60_MONDO_53_DMAEPT_ENGINE
#define INTR0x60_MONDO_53_DMAEPT_ENGINE 2
#endif /* INTR0x60_MONDO_53_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_54_MODE
#define INTR0x60_MONDO_54_MODE 1
#else
#define INTR0x60_MONDO_54_MODE 0
#endif /* INTR0x60_MONDO_54_MODE */

#if INTR0x60_MONDO_54_V
#define INTR0x60_MONDO_54_V 1
#else
#define INTR0x60_MONDO_54_V 0
#endif /* INTR0x60_MONDO_54_V */

#ifndef INTR0x60_MONDO_54_THREAD
#define INTR0x60_MONDO_54_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_54_THREAD */

#ifndef INTR0x60_MONDO_54_CNTRL
#define INTR0x60_MONDO_54_CNTRL 0
#endif /* INTR0x60_MONDO_54_CNTRL */

#ifndef INTR0x60_MONDO_54_DMAEPT_ENGINE
#define INTR0x60_MONDO_54_DMAEPT_ENGINE 3
#endif /* INTR0x60_MONDO_54_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_55_MODE
#define INTR0x60_MONDO_55_MODE 1
#else
#define INTR0x60_MONDO_55_MODE 0
#endif /* INTR0x60_MONDO_55_MODE */

#if INTR0x60_MONDO_55_V
#define INTR0x60_MONDO_55_V 1
#else
#define INTR0x60_MONDO_55_V 0
#endif /* INTR0x60_MONDO_55_V */

#ifndef INTR0x60_MONDO_55_THREAD
#define INTR0x60_MONDO_55_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_55_THREAD */

#ifndef INTR0x60_MONDO_55_CNTRL
#define INTR0x60_MONDO_55_CNTRL 0
#endif /* INTR0x60_MONDO_55_CNTRL */

#ifndef INTR0x60_MONDO_55_DMAEPT_ENGINE
#define INTR0x60_MONDO_55_DMAEPT_ENGINE 4
#endif /* INTR0x60_MONDO_55_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_56_MODE
#define INTR0x60_MONDO_56_MODE 1
#else
#define INTR0x60_MONDO_56_MODE 0
#endif /* INTR0x60_MONDO_56_MODE */

#if INTR0x60_MONDO_56_V
#define INTR0x60_MONDO_56_V 1
#else
#define INTR0x60_MONDO_56_V 0
#endif /* INTR0x60_MONDO_56_V */

#ifndef INTR0x60_MONDO_56_THREAD
#define INTR0x60_MONDO_56_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_56_THREAD */

#ifndef INTR0x60_MONDO_56_CNTRL
#define INTR0x60_MONDO_56_CNTRL 0
#endif /* INTR0x60_MONDO_56_CNTRL */

#ifndef INTR0x60_MONDO_56_DMAEPT_ENGINE
#define INTR0x60_MONDO_56_DMAEPT_ENGINE 1
#endif /* INTR0x60_MONDO_56_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_57_MODE
#define INTR0x60_MONDO_57_MODE 1
#else
#define INTR0x60_MONDO_57_MODE 0
#endif /* INTR0x60_MONDO_57_MODE */

#if INTR0x60_MONDO_57_V
#define INTR0x60_MONDO_57_V 1
#else
#define INTR0x60_MONDO_57_V 0
#endif /* INTR0x60_MONDO_57_V */

#ifndef INTR0x60_MONDO_57_THREAD
#define INTR0x60_MONDO_57_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_57_THREAD */

#ifndef INTR0x60_MONDO_57_CNTRL
#define INTR0x60_MONDO_57_CNTRL 0
#endif /* INTR0x60_MONDO_57_CNTRL */

#ifndef INTR0x60_MONDO_57_DMAEPT_ENGINE
#define INTR0x60_MONDO_57_DMAEPT_ENGINE 2
#endif /* INTR0x60_MONDO_57_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_58_MODE
#define INTR0x60_MONDO_58_MODE 1
#else
#define INTR0x60_MONDO_58_MODE 0
#endif /* INTR0x60_MONDO_58_MODE */

#if INTR0x60_MONDO_58_V
#define INTR0x60_MONDO_58_V 1
#else
#define INTR0x60_MONDO_58_V 0
#endif /* INTR0x60_MONDO_58_V */

#ifndef INTR0x60_MONDO_58_THREAD
#define INTR0x60_MONDO_58_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_58_THREAD */

#ifndef INTR0x60_MONDO_58_CNTRL
#define INTR0x60_MONDO_58_CNTRL 0
#endif /* INTR0x60_MONDO_58_CNTRL */

#ifndef INTR0x60_MONDO_58_DMAEPT_ENGINE
#define INTR0x60_MONDO_58_DMAEPT_ENGINE 3
#endif /* INTR0x60_MONDO_58_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_59_MODE
#define INTR0x60_MONDO_59_MODE 1
#else
#define INTR0x60_MONDO_59_MODE 0
#endif /* INTR0x60_MONDO_59_MODE */

#if INTR0x60_MONDO_59_V
#define INTR0x60_MONDO_59_V 1
#else
#define INTR0x60_MONDO_59_V 0
#endif /* INTR0x60_MONDO_59_V */

#ifndef INTR0x60_MONDO_59_THREAD
#define INTR0x60_MONDO_59_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_59_THREAD */

#ifndef INTR0x60_MONDO_59_CNTRL
#define INTR0x60_MONDO_59_CNTRL 0
#endif /* INTR0x60_MONDO_59_CNTRL */

#ifndef INTR0x60_MONDO_59_DMAEPT_ENGINE
#define INTR0x60_MONDO_59_DMAEPT_ENGINE 4
#endif /* INTR0x60_MONDO_59_DMAEPT_ENGINE */


/****************************************/
#if INTR0x60_MONDO_62_MODE
#define INTR0x60_MONDO_62_MODE 1
#else
#define INTR0x60_MONDO_62_MODE 0
#endif /* INTR0x60_MONDO_62_MODE */

#if INTR0x60_MONDO_62_V
#define INTR0x60_MONDO_62_V 1
#else
#define INTR0x60_MONDO_62_V 0
#endif /* INTR0x60_MONDO_62_V */

#ifndef INTR0x60_MONDO_62_THREAD
#define INTR0x60_MONDO_62_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_62_THREAD */

#ifndef INTR0x60_MONDO_62_CNTRL
#define INTR0x60_MONDO_62_CNTRL 0
#endif /* INTR0x60_MONDO_62_CNTRL */



/****************************************/
#if INTR0x60_MONDO_63_MODE
#define INTR0x60_MONDO_63_MODE 1
#else
#define INTR0x60_MONDO_63_MODE 0
#endif /* INTR0x60_MONDO_63_MODE */

#if INTR0x60_MONDO_63_V
#define INTR0x60_MONDO_63_V 1
#else
#define INTR0x60_MONDO_63_V 0
#endif /* INTR0x60_MONDO_63_V */

#ifndef INTR0x60_MONDO_63_THREAD
#define INTR0x60_MONDO_63_THREAD INTR0x60_MONDO_BAD_THREAD
#endif /* INTR0x60_MONDO_63_THREAD */

#ifndef INTR0x60_MONDO_63_CNTRL
#define INTR0x60_MONDO_63_CNTRL 0
#endif /* INTR0x60_MONDO_63_CNTRL */



#ifndef INTR0x60_INTX_DEASSERT_TIMEOUT
#define INTR0x60_INTX_DEASSERT_TIMEOUT 1000
#endif /* INTR0x60_INTX_DEASSERT_TIMEOUT */


/****************************************/
#define INTR0x60_IG_UNUSED  0
#define INTR0x60_IG_CC      1
#define INTR0x60_IG_SSI_ERR 2
#define INTR0x60_IG_SSI_INT 3
#define INTR0x60_IG_NIU_RX  4
#define INTR0x60_IG_NIU_TX  5
#define INTR0x60_IG_PIU     6

#endif /* INTERRUPT0x60_DEFINES_H */
