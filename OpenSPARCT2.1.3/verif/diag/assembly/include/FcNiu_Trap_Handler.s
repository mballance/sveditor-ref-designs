/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: FcNiu_Trap_Handler.s
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
#include "niu_defines.h"
#include "ncu_defines.h"
#include "niu_macros.h"
/* ********************************************************************	*/
/* NIU Tx DMA and Rx-DMA initialization for TRAPS 			*/
/* ********************************************************************	*/
HTrap_NIU_TxDma_Init:
	save
	nop
HTrap_NIU_TxDMAActivate:
        setx    MAC_ID, %g1, %o0                        ! 1st Parameter
        setx    SetTxDMAActive_list, %g1, %o1           ! 2st parameter
        call    SetTxDMAActive
        nop                                             ! $EV trig_pc_d(1, @VA(.MAIN.HTrap_NIU_TxDMAActivate)) -> NIU_TxDMAActivate (MAC_ID, TxDmaActive_list)

HTrap_NIU_AddTxChannels :
        nop                                             ! $EV trig_pc_d(1, @VA(.MAIN.HTrap_NIU_AddTxChannels)) -> NIU_AddTxChannels(MAC_ID, NIU_TxDmaNoUE)

        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5            ! Just for delay
        nop

HTrap_NIU_SetTxMaxBurst :
        setx    NIU_TxDmaNo,    %g1, %o0                ! 1st parameter :
        setx    SetTxMaxBurst_Data, %g1, %o1            ! 2nd parameter
        call    SetTxMaxBurst
        nop                                             ! $EV trig_pc_d(1, @VA(.MAIN.HTrap_NIU_SetTxMaxBurst)) -> NIU_SetTxMaxBurst (MAC_ID, NIU_TxDmaNoUE, TxMaxBurst_Data)

        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5            ! Just for delay
        nop

HTrap_NIU_InitTxDma:
        setx    NIU_TxDmaNo,    %g1, %o0                ! 1st parameter :
        nop                                             ! $EV trig_pc_d(1, @VA(.MAIN.HTrap_NIU_InitTxDma)) -> NIU_InitTxDma (MAC_ID, NIU_TxDmaNoUE, NIU_Xlate_On)
        call    InitTxDma
        nop

        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5            ! Just for delay
        nop

	ret
	restore
HTrap_NIU_TxDma_Init_Done:

/* ********************************************************************	*/

HTrap_NIU_RxDma_Init:
	save
	nop
HTrap_NIU_RxInitDma:
        nop             !$EV trig_pc_d(1, @VA(.MAIN.HTrap_NIU_RxInitDma)) -> NIU_InitRxDma(RXDMA_CHNL, RX_DESC_RING_LENGTH, RX_COMPL_RING_LEN,, RBR_CONFIG_B_DATA_UE, RX_INITIAL_KICK, NIU_Xlate_On)

        setx    0x5, %g1, %g4                   ! Delay for Vera to complete
HTrap_delay_loop_Rx:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, HTrap_delay_loop_Rx
        nop

        nop
        setx    RXDMA_CHNL, %g1, %o0
        setx    RX_DESC_RING_LENGTH, %g1, %o1
        setx    RX_COMPL_RING_LEN, %g1, %o2
        setx    RBR_CONFIG_B_DATA, %g1, %o3
        setx    RX_INITIAL_KICK, %g1, %o4
        call    NiuInitRxDma
        nop
	
	ret
	restore
HTrap_NIU_RxDma_Init_Done:

/* ********************************************************************	*/
/* ISR for kicking in Tx packets					*/
/* ********************************************************************	*/
HTrap_NIU_Tx:
	save
	nop

HTrap_NIU_Tx_PktConfig:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.HTrap_NIU_Tx_PktConfig)) -> pktGenConfig(MAC_ID, FRAME_TYPE, FRAME_CLASS, HTRAP_NIU_TX_PKT_LEN)

HTrap_NIU_Tx_Gen_Packet:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.HTrap_NIU_Tx_Gen_Packet)) -> TxPktGen(MAC_ID, NIU_TxDmaNoUE, HTRAP_NIU_TX_PKT_CNT)
	nop			

        setx    0x5, %g1, %g4
HTrap_NIU_delay_loop_tmp:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, HTrap_NIU_delay_loop_tmp
        nop


HTrap_SetTxRingKick:
        setx    0x100000100, %g1, %g2		! $EV trig_pc_d(1, @VA(.MAIN.HTrap_SetTxRingKick)) -> NIU_SetTxRingKick(MAC_ID, NIU_TxDmaNoUE)
	setx    NIU_TxDmaNo,    %g1, %o0 
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g3    
        nop
        mulx     %o0, 0x200, %g5
        setx	TX_RING_KICK_Addr, %g1, %g2
        add     %g2, %g5, %g2
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

HTrap_SetTxCs :
	setx    NIU_TxDmaNo,    %g1, %o0
	setx	TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
        setx    TX_CS_Addr, %g1, %g2
        add     %g2, %g5, %g2
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

	ba	HTrap_NIU_Tx_Done
	nop

HTrap_NIU_Tx_Passed:
        nop                     ! $EV trig_pc_d(1, @VA(.MAIN.test_passed_tx)) -> NIU_EXIT_chk(MAC_ID)
        EXIT_GOOD

HTrap_NIU_Tx_Done:
	ret
	restore


/* ********************************************************************	*/
/* ISR for kicking in Rx packets					*/
/* ********************************************************************	*/
HTrap_NIU_Rx:
	save
	nop

HTrap_NIU_RxPkt_Conf:
        nop             !$EV trig_pc_d(1, @VA(.MAIN.HTrap_NIU_RxPkt_Conf)) -> NIU_RxPktConf(HTRAP_NIU_RXMAC_PKTCNT)
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5    ! Just for Delay
        nop

HTrap_NIU_Rx_GenPkt:
        setx    HTRAP_NIU_RXMAC_PKTCNT, %g1, %g6          ! Packet count
        nop
HTrap_NIU_Rx_pktcnt_loop:
        nop             !$EV trig_pc_d(1, @VA(.MAIN.HTrap_NIU_Rx_pktcnt_loop)) -> NIU_RxGenPkt(MAC_ID, RXDMA_CHNL, 1, HTRAP_NIU_MAC_PKT_LEN, 1)
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5    ! just for delay
        nop
        dec     %g6
        brnz    %g6, HTrap_NIU_Rx_pktcnt_loop
        nop

	ret
	restore

HTrap_NIU_Rx_Done:
/* ********************************************************************	*/
/* Setup NCU for NIU Traps						*/
/* ********************************************************************	*/
HTrap_NCU_Setup:
	save
	nop
HTrap_Clear_All_Ints:
        rdpr    %pstate, %g7
        xor     %g7, 0x2, %g7           ! Reset interrupt enable
        wrpr    %g7, %pstate

HTrap_NCU_Init_MAN:
        ! Initially set all the Interrupt Management Registers
        ! Later will set all those not used to have a different vector number

        setx    INT_MAN, %g1, %g2       ! %g2 = INT_MAN reg. addr.
        setx    INT_MAN_COUNT, %g1, %g4 ! %g4 = INT_MAN reg. count value
        set     1, %g5                  ! %g5 = value to write to INT_MAN reg.

HTrap_NCU_Init_Man_loop:
        stx     %g5, [%g2]
        add     %g2, INT_MAN_STEP, %g2
        cmp     %g4, 1
        bne     HTrap_NCU_Init_Man_loop
        add     %g4, -1, %g4

/* Initialize the NIU for TX DMA interrupt. */

        NIU_TX_LD_IM0_INTR_ON_MARK( NIU_TxDmaNo, %g1, %g2, %g3, %g4, 0 )

        ! Enable interrupts

HTrap_Int_En:
        rdpr    %pstate, %g7
        or      %g7, 0x2, %g7           ! Set interrupt enable
        wrpr    %g7, %pstate

HTrap_NCU_Setup_Done:
	ret
	restore
/* ********************************************************************	*/
/* Trap code                                                            */
/* ******************************************************************** */

NIU_Trap_Handler:
        
        setx    0x300000000, %l2, %l6
        ld      [%l6], %l5
        add     %l5, 1, %l5
        st      %l5, [%l6]
        membar  #Sync
        
        ! Clear the interrupt in the core
        ldxa    [%g0]ASI_SWVR_INTR_R, %l3
        
        setx    TX_CS, %g1, %g2                 ! TX_CS, Tx DMA channel 0
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g1    ! Reset MK
        nop

        setx    LDGIMGN, %g1, %g2               ! logical device group 0
        setx    0x80000001, %g1, %g3
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop
#ifdef	KICK_NIU_TX
	call	HTrap_NIU_Tx
	nop
#endif

#ifdef	KICK_NIU_RX
	call	HTrap_NIU_Rx
	nop
#endif

NIU_Trap_Handler_Done:
        jmpl    %o7+0x8, %g0
        nop     

/* ******************************************************************** */
