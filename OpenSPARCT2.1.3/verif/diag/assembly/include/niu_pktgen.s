/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_pktgen.s
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
SECTION .HTRAPS
.text
#ifdef ENABLE_NIU_BG_TX
.global NIU_PktGenTx
NIU_PktGenTx:
	save

NIU_PktGenTx_Initflow:
! $EV trig_pc_d(1, @VA(.HTRAPS.NIU_PktGenTx_Initflow)) -> pktGenConfig(NIU_BG_TX_MAC_ID, FRAME_TYPE, FRAME_CLASS,NIU_BG_TX_PKT_LEN,0,0,1)
    nop

NIU_PktGenTx_Gen_Packet:
! $EV trig_pc_d(1, @VA(.HTRAPS.NIU_PktGenTx_Gen_Packet)) -> TxPktGen(NIU_BG_TX_MAC_ID, NIU_BG_TX_DMA_NUM_HEX, NIU_BG_TX_PKT_COUNT, 0, 0, 0, 1)
        /* Small delay loop to wait for packets to be written to DRAM */
        best_set_reg(NIU_BG_TX_PKT_COUNT, %l7, %l0)
NIU_PktGenTx_Gen_Packet_loop:
        brnz    %l0, NIU_PktGenTx_Gen_Packet_loop
        dec     %l0

NIU_PktGenTx_SetTxRingKick:
! $EV trig_pc_d(1, @VA(.HTRAPS.NIU_PktGenTx_SetTxRingKick)) -> NIU_SetTxRingKick(NIU_BG_TX_MAC_ID, NIU_BG_TX_DMA_NUM_HEX, 0, 0, 0, 1)
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

NIU_PktGenTx_SetTxCs:
        best_set_reg(TX_CS_Data, %l7, %l3)
        best_set_reg(mpeval(TX_CS_Addr+(INTR0x60_NIU_TX_DMA_0*0x200)), %l7, %l2)
        stxa    %l3, [%l2]ASI_PRIMARY_LITTLE
	ret
	restore
#endif /* ENABLE_NIU_BG_TX */



/***************************************************************************
* NIU_PktRcv:
*   Kick off another set of RX packets
***************************************************************************/

NIU_PktRcv:
	nop

P_NIU_Rx_GenPkt:
!$EV trig_pc_d(1, @VA(.HTRAPS.P_NIU_Rx_GenPkt)) -> NIU_RxGenPkt(MAC_ID, RXDMA_CHNL, RXMAC_PKTCNT, MAC_PKT_LEN, 0, 0, 1)

	retl
	nop
