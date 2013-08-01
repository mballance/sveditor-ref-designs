/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: txrxrand_wrm.s
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
#define RCRSTAT_A_Addr		    mpeval(DMC_ADDRESS_RANGE+0x00050)
#define RBR_STAT_Addr               mpeval(DMC_ADDRESS_RANGE+0x00028)
#define SSYS_RESET_Addr             0x8900000838

#include "hboot.s"
#include "niu_defines.h"
.text
.global main
main:
        ta T_CHANGE_HPRIV
        nop
! branch to main by comparing thread id.

	ta      T_RD_THID
	mov	0x1, %g2

	setx	0x0000000000000001, %o0, %g3	! thread-group bits for the template
        cmp     %g2, %o1
	be      _FcN1_main
	nop

	setx	0x0000000000000010, %o0, %g3	! thread-group bits for the template
        brz     %o1, _FcN0_main
	and	%o1, %g3, %g1
	nop

!
! Thread 0 Start
!
!
_FcN0_main:

Init_flow:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig(MAC_ID, FRAME_TYPE, FRAME_CLASS, c8)

P_TxDMAActivate:
	setx    MAC_ID, %g1, %o0
	setx    0x8000, %g1, %o1
	call    SetTxDMAActive
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_TxDMAActivate)) -> NIU_TxDMAActivate (MAC_ID, 8000)
        setx    XMAC0_MAX_addr, %g7, %g2
 

P_AddTxChannels:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_AddTxChannels)) -> NIU_AddTxChannels(MAC_ID, f)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

P_SetTxMaxBurst:
	setx    0xf, %g1, %o0
	setx    SetTxMaxBurst_Data, %g1, %o1
	call    SetTxMaxBurst
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_SetTxMaxBurst)) -> NIU_SetTxMaxBurst (MAC_ID, f, TxMaxBurst_Data)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

P_InitTxDma:
	setx    0xf, %g1, %o0
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_InitTxDma)) -> NIU_InitTxDma (MAC_ID, f, NIU_Xlate_On)
	call    InitTxDma
	nop
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

Gen_Packet:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> TxPktGen(MAC_ID, f, 0x40,0,0,0)
	nop

        setx    0x5, %g1, %g4
delay_loop_tmp:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_tmp
        nop

SetTxRingKick:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick)) -> NIU_SetTxRingKick(MAC_ID, f)
	setx    0xf,    %g1, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs:
	setx    0xf, %g1, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

#ifdef JUMBO_FRAME_EN
        setx    loop_count, %g1, %g4
delay_loop:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop
        nop
#endif


NIUTx_Pkt_Cnt_Chk:
	setx    MAC_ID, %g1, %o0
	setx    0x40, %g1, %o1
	call    NiuTx_check_pkt_cnt
	nop

        setx    loop_count, %g1, %g4
delay_loop_end:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_end
        nop

        setx    user_data_start, %g1, %g2
        ldx     [%g2], %g3
        cmp     %g3, 0x1
        nop
        be      test_passed_tx
        nop
        setx    xmac_config0, %g7, %g2
niu_warm_reset:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g3
        and     0x00000100, %g3, %g3
        brnz    %g3,niu_warm_reset
        nop
        setx    SSYS_RESET_Addr, %g7, %g2
        setx    0x1, %g7, %g3
        stx     %g3, [%g2]
        setx    0x5, %g1, %g4
delay_loop_warm:
        ldx     [%g2], %g3
        dec     %g4
        brnz    %g4, delay_loop_warm
        nop
        call    N2_NIU_INIT
        nop
        setx    user_data_start, %g1, %g2
        setx    0x1, %g7, %g3
        stx     %g3, [%g2]
        #ba      _FcN0_main
        nop
Init_flow_1:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Init_flow_1)) -> pktGenConfig(MAC_ID, FRAME_TYPE, FRAME_CLASS, c8)

P_TxDMAActivate_1:
	setx    MAC_ID, %g1, %o0
	setx    0x8000, %g1, %o1
	call    SetTxDMAActive
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_TxDMAActivate_1)) -> NIU_TxDMAActivate (MAC_ID, 8000)
 

P_AddTxChannels_1:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_AddTxChannels_1)) -> NIU_AddTxChannels(MAC_ID, f)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

P_SetTxMaxBurst_1:
	setx    0xf, %g1, %o0
	setx    SetTxMaxBurst_Data, %g1, %o1
	call    SetTxMaxBurst
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_SetTxMaxBurst_1)) -> NIU_SetTxMaxBurst (MAC_ID, f, TxMaxBurst_Data)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

P_InitTxDma_1:
	setx    0xf, %g1, %o0
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_InitTxDma_1)) -> NIU_InitTxDma (MAC_ID, f, NIU_Xlate_On)
	call    InitTxDma
	nop
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

Gen_Packet_1:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet_1)) -> TxPktGen(MAC_ID, f, 0x40,0,0,0)
	nop

        setx    0x5, %g1, %g4
delay_loop_tmp_1:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_tmp_1
        nop

SetTxRingKick_1:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_1)) -> NIU_SetTxRingKick(MAC_ID, f)
	setx    0xf,    %g1, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_1:
	setx    0xf, %g1, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

#ifdef JUMBO_FRAME_EN
        setx    loop_count, %g1, %g4
delay_loop_1:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_1
        nop
#endif


NIUTx_Pkt_Cnt_Chk_1:
	setx    MAC_ID, %g1, %o0
	setx    0x40, %g1, %o1
	call    NiuTx_check_pkt_cnt
	nop

        setx    loop_count, %g1, %g4
delay_loop_end_1:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_end_1
        nop

test_passed_tx:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.test_passed_tx)) -> NIU_EXIT_chk(MAC_ID)
        EXIT_GOOD


_FcN1_main:

P_NIU_RxInitDma:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxInitDma)) -> NIU_InitRxDma(1, RX_DESC_RING_LENGTH, RX_COMPL_RING_LEN, RBR_CONFIG_B_DATA, RX_INITIAL_KICK, NIU_Xlate_On)
        setx    NIU_PKTGEN_CSR_EV2A_RBR_KICK, %g7, %g2
delay_loop_Rx:
        ldx     [%g2], %g5
        cmp	%g5, RX_INITIAL_KICK
        bne	delay_loop_Rx
        nop

	setx    0x1, %g1, %o0
	setx    RX_DESC_RING_LENGTH, %g1, %o1
	setx    RX_COMPL_RING_LEN, %g1, %o2
	setx    RBR_CONFIG_B_DATA, %g1, %o3
	setx    RX_INITIAL_KICK, %g1, %o4
	call    NiuInitRxDma
	nop
P_NIU_RxPkt_Conf:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxPkt_Conf)) -> NIU_RxPktConf(RXMAC_PKTCNT)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop
	setx    RXMAC_PKTCNT, %g1, %g6
        mulx	%o0, 0x200, %g5
        setx	RBR_STAT_Addr, %g7, %g2
	add	%g2, %g5, %g2
P_NIU_Rx_GenPkt:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        brz     %g5, P_NIU_Rx_GenPkt
        nop
#ifdef NIU_SYSTEMC_T2
        brnz    %g5, Rx_pktcnt_loop
        nop
#endif
        cmp     %g5, %o4     
	be      P_NIU_Rx_GenPkt
        nop
Rx_pktcnt_loop:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Rx_pktcnt_loop)) -> NIU_RxGenPkt(MAC_ID, 1, RXMAC_PKTCNT, 0x64, 0x0, RX_NIU_MULTI_DMA, 1)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

        mulx	%o0, 0x200, %g5
        setx	RCRSTAT_A_Addr, %g7, %g2
	add	%g2, %g5, %g2
delay_loop:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	cmp	%g5, RXMAC_PKTCNT - RXMAC_PKTCNT%8
	bne	delay_loop
        nop

disable_mac0:
        setx    xmac_config0, %g7, %g2
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g3
        setx    0xfffffeff, %g7, %g4
        and     %g4, %g3, %g3
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE

        setx    user_data_start, %g1, %g2
        ldx     [%g2], %g3
        cmp     %g3, 0x1
        nop
        be      test_passed
        nop
wait_wrm_done:
        ldx     [%g2], %g3
        cmp     %g3, 0x1
        nop
        bne     wait_wrm_done
        nop
#        ba      _FcN1_main
#        nop
P_NIU_RxInitDma_1:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxInitDma_1)) -> NIU_InitRxDma(1, RX_DESC_RING_LENGTH, RX_COMPL_RING_LEN, RBR_CONFIG_B_DATA, RX_INITIAL_KICK, NIU_Xlate_On)
        setx    NIU_PKTGEN_CSR_EV2A_RBR_KICK, %g7, %g2
delay_loop_Rx_1:
        ldx     [%g2], %g5
        cmp	%g5, RX_INITIAL_KICK
        bne	delay_loop_Rx_1
        nop

	setx    0x1, %g1, %o0
	setx    RX_DESC_RING_LENGTH, %g1, %o1
	setx    RX_COMPL_RING_LEN, %g1, %o2
	setx    RBR_CONFIG_B_DATA, %g1, %o3
	setx    RX_INITIAL_KICK, %g1, %o4
	call    NiuInitRxDma
	nop
P_NIU_RxPkt_Conf_1:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxPkt_Conf_1)) -> NIU_RxPktConf(RXMAC_PKTCNT)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop
	setx    RXMAC_PKTCNT, %g1, %g6
        mulx	%o0, 0x200, %g5
        setx	RBR_STAT_Addr, %g7, %g2
	add	%g2, %g5, %g2
P_NIU_Rx_GenPkt_1:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        brz     %g5, P_NIU_Rx_GenPkt_1
        nop
        cmp     %g5, %o4     
	be      P_NIU_Rx_GenPkt_1
        nop
Rx_pktcnt_loop_1:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Rx_pktcnt_loop_1)) -> NIU_RxGenPkt(MAC_ID, 1, RXMAC_PKTCNT, 0x64, 0x0, RX_NIU_MULTI_DMA, 1)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

        mulx	%o0, 0x200, %g5
        setx	RCRSTAT_A_Addr, %g7, %g2
	add	%g2, %g5, %g2
Rxdelay_loop_1:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	cmp	%g5, RXMAC_PKTCNT - RXMAC_PKTCNT%8
	bne	Rxdelay_loop_1
        nop


test_passed:
	nop
        EXIT_GOOD
# 247 "diag.j.pp"

#if 0
#endif
/************************************************************************
   Test case data start
************************************************************************/

.align  1024
.data
user_data_start:
intr_expect:
        .byte   0x0             
        .byte   0x0            
        .byte   0x0           
        .byte   0x0          
        .byte   0x0         
        .byte   0x0        
        .byte   0x0       
        .byte   0x0      
user_data_end:
.end
