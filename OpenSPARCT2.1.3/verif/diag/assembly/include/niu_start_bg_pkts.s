/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_start_bg_pkts.s
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
#if defined(ENABLE_BG_NIU_RX) && !defined(ENABLE_NIU_BG_RX) 
#define ENABLE_NIU_BG_RX
#endif /* ENABLE_BG_NIU_RX */


#ifdef ENABLE_NIU_BG_RX
enable_bg_niu_rx:
    ldxa  [%g0] ASI_INTR_ID, %g7      ! Get the thread number
changequote([, ])dnl
    cmp   %g7, M4_master_tid
changequote(`,')dnl
    bne   %xcc, enable_bg_niu_rx_end
    nop

enable_bg_niu_rx_trigger_NIU_InitRxDma:
!$EV trig_pc_d(1, @VA(.RED_EXT_SEC.enable_bg_niu_rx_trigger_NIU_InitRxDma)) -> NIU_InitRxDma(RXDMA_CHNL, RX_DESC_RING_LENGTH, RX_COMPL_RING_LEN, RBR_CONFIG_B_DATA, RX_INITIAL_KICK, NIU_Xlate_On)

    mov    0x5, %l0                   ! Delay for Vera to complete
enable_bg_niu_rx_delay_loop:
    nop
    nop
    nop
    nop
    dec     %l0
    brnz    %l0, enable_bg_niu_rx_delay_loop
    nop

enable_bg_niu_rx_call_NiuInitRxDma:
    setx    RXDMA_CHNL, %l7, %o0
    setx    RX_DESC_RING_LENGTH, %l7, %o1
    setx    RX_COMPL_RING_LEN, %l7, %o2
    setx    RBR_CONFIG_B_DATA, %l7, %o3
    setx    RX_INITIAL_KICK, %l7, %o4
    call    NiuInitRxDma
    nop

enable_bg_niu_rx_trigger_NIU_RxPktConf:
        nop
!$EV trig_pc_d(1, @VA(.RED_EXT_SEC.enable_bg_niu_rx_trigger_NIU_RxPktConf)) -> NIU_RxPktConf(RXMAC_PKTCNT, MAC_ID)

enable_bg_niu_rx_trigger_NIU_RxGenPkt:
        nop
!$EV trig_pc_d(1, @VA(.RED_EXT_SEC.enable_bg_niu_rx_trigger_NIU_RxGenPkt)) -> NIU_RxGenPkt(MAC_ID, RXDMA_CHNL, RXMAC_PKTCNT, MAC_PKT_LEN)

enable_bg_niu_rx_end:
#endif /* ENABLE_NIU_BG_RX */


#ifdef ENABLE_NIU_BG_TX
enable_niu_bg_tx:
    ldxa  [%g0] ASI_INTR_ID, %g7      ! Get the thread number
changequote([, ])dnl
    cmp   %g7, M4_master_tid
changequote(`,')dnl
    bne   %xcc, enable_niu_bg_tx_end
    nop

#ifndef NIU_BG_TX_MAC_ID
#define NIU_BG_TX_MAC_ID MAC_ID
#endif // NIU_BG_TX_MAC_ID

#ifndef NIU_BG_TX_PKT_LEN
#define NIU_BG_TX_PKT_LEN TX_PKT_LEN
#endif // NIU_BG_TX_PKT_LEN

#ifndef NIU_BG_TX_PKT_COUNT
#define NIU_BG_TX_PKT_COUNT NIU_TX_PKT_CNT
#endif // NIU_BG_TX_PKT_COUNT

#ifndef NIU_BG_TX_MAX_BURST_LEN
#define NIU_BG_TX_MAX_BURST_LEN SetTxMaxBurst_Data
#endif // NIU_BG_TX_MAX_BURST_LEN

#define NIU_BG_TX_DMA_ACTIVE_LIST eval(1<<INTR0x60_NIU_TX_DMA_0)
#define NIU_BG_TX_DMA_NUM_HEX     eval(INTR0x60_NIU_TX_DMA_0, 16)

enable_niu_bg_tx_Initflow:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.enable_niu_bg_tx_Initflow)) -> pktGenConfig(NIU_BG_TX_MAC_ID, FRAME_TYPE, FRAME_CLASS, NIU_BG_TX_PKT_LEN,0,0,1)
    nop

enable_niu_bg_tx_TxDMAActivate:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.enable_niu_bg_tx_TxDMAActivate)) -> NIU_TxDMAActivate (NIU_BG_TX_MAC_ID, eval(NIU_BG_TX_DMA_ACTIVE_LIST,16), 0, 0, 0, 1)
    set     NIU_BG_TX_MAC_ID, %o0
    set     NIU_BG_TX_DMA_ACTIVE_LIST, %o1
    call    SetTxDMAActive
    nop

enable_niu_bg_tx_AddTxChannels: 
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.enable_niu_bg_tx_AddTxChannels)) -> NIU_AddTxChannels(NIU_BG_TX_MAC_ID, NIU_BG_TX_DMA_NUM_HEX, 0, 0, 0, 1)
    nop

enable_niu_bg_tx_SetTxMaxBurst :
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.enable_niu_bg_tx_SetTxMaxBurst)) -> NIU_SetTxMaxBurst (NIU_BG_TX_MAC_ID, NIU_BG_TX_DMA_NUM_HEX, eval(NIU_BG_TX_MAX_BURST_LEN,16), 0, 0, 0, 1)
    best_set_reg(INTR0x60_NIU_TX_DMA_0, %l7, %o0)        ! 1st parameter
    best_set_reg(NIU_BG_TX_MAX_BURST_LEN, %l7, %o1)      ! 2nd parameter
    call SetTxMaxBurst

enable_niu_bg_tx_InitTxDma:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.enable_niu_bg_tx_InitTxDma)) -> NIU_InitTxDma (NIU_BG_TX_MAC_ID, NIU_BG_TX_DMA_NUM_HEX, NIU_Xlate_On, 0, 0, 0, 1)
    best_set_reg(INTR0x60_NIU_TX_DMA_0, %l7, %o0)        ! 1st parameter
    call    InitTxDma
    nop

enable_niu_bg_tx_Gen_Packet:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.enable_niu_bg_tx_Gen_Packet)) -> TxPktGen(NIU_BG_TX_MAC_ID, NIU_BG_TX_DMA_NUM_HEX, NIU_BG_TX_PKT_COUNT, 0, 0, 0, 1)
        /* Small delay loop to wait for packets to be written to DRAM */
        best_set_reg(NIU_BG_TX_PKT_COUNT, %l7, %l0)
enable_niu_bg_tx_Gen_Packet_loop:
        brnz    %l0, enable_niu_bg_tx_Gen_Packet_loop
        dec     %l0

enable_niu_bg_tx_SetTxRingKick:
! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.enable_niu_bg_tx_SetTxRingKick)) -> NIU_SetTxRingKick(NIU_BG_TX_MAC_ID, NIU_BG_TX_DMA_NUM_HEX, 0, 0, 0, 1)
        best_set_reg(NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %l7, %l2)
#ifdef FC_NO_PEU_VERA
        ! PEP does not support 64-bit access, so use two 32-bit loads
        lduw    [%l2], %l3
        lduw    [%l2+4], %l7
        sllx    %l3, 32, %l3
        add     %l7, %l3, %l3
#else // FC_NO_PEU_VERA
        ldx    [%l2], %l3
#endif // FC_NO_PEU_VERA
        best_set_reg(mpeval(TX_RING_KICK_Addr+(INTR0x60_NIU_TX_DMA_0*0x200)), %l7, %l2)
        stxa    %l3, [%l2]ASI_PRIMARY_LITTLE

enable_niu_bg_tx_SetTxCs:
        best_set_reg(TX_CS_Data, %l7, %l3)
        best_set_reg(mpeval(TX_CS_Addr+(INTR0x60_NIU_TX_DMA_0*0x200)), %l7, %l2)
        stxa    %l3, [%l2]ASI_PRIMARY_LITTLE

enable_niu_bg_tx_end:
#endif /* ENABLE_NIU_BG_TX */
