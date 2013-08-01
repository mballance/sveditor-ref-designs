/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tx_MULTI_PORT_DMA_rand.s
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

#include "hboot.s"
#include "niu_defines.h"
#define  FAIR_PKT_CNT  (NIU_TX_PKT_CNT / 2)

.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop
!# 85 "diag.j.pp"
!
! Thread 0 Start
!
!
!thread_0:

Init_flow:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig(MAC_ID, FRAME_TYPE, FRAME_CLASS, NIU_TX_PKT_LEN_P0, NIU_TX_MULTI_PORT, NIU_TX_PKT_LEN_P1)

P_TxDMAActivate:
	set     MAC_ID,  %o0
	set     0x1,  %o1
	set     NIU_TX_MULTI_PORT, %o2
	set     NIU_TX_MULTI_DMA_P0, %o3
	set     NIU_TX_MULTI_DMA_P1, %o4
	call    SetTxDMAActive
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_TxDMAActivate)) -> NIU_TxDMAActivate (MAC_ID, 1, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
 

P_AddTxChannels:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_AddTxChannels)) -> NIU_AddTxChannels(MAC_ID, 0, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

P_SetTxMaxBurst:
	set     0x0, %o0
	set     SetTxMaxBurst_Data, %o1
	set     NIU_TX_MULTI_PORT, %o2
	set     NIU_TX_MULTI_DMA_P0, %o3
	set     NIU_TX_MULTI_DMA_P1, %o4
	call    SetTxMaxBurst
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_SetTxMaxBurst)) -> NIU_SetTxMaxBurst (MAC_ID, 0, TxMaxBurst_Data, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop







        nop
	set     NIU_TX_MULTI_PORT, %o2
	set     NIU_TX_MULTI_DMA_P0, %o3
	set     NIU_TX_MULTI_DMA_P1, %o4
        call    InitTxDma
        nop
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop

Gen_Packet:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> TxPktGen(MAC_ID, 0, NIU_TX_PKT_CNT, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	nop

        set     0x5, %g4
delay_loop_tmp:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_tmp
        nop

!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA0  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        set     0x1, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA1
        nop

SetTxRingKick_P0_0:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_0)) -> NIU_SetTxRingKick(0, 0, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x0, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_0:
	set     0x0, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA1  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA1:
        set     0x2, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA2
        nop

SetTxRingKick_P0_1:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_1)) -> NIU_SetTxRingKick(0, 1, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x1, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_1:
	set     0x1, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA2  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA2:
        set     0x4, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA3
        nop

SetTxRingKick_P0_2:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_2)) -> NIU_SetTxRingKick(0, 2, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x2, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_2:
	set     0x2, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA3  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA3:
        set     0x8, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA4
        nop

SetTxRingKick_P0_3:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_3)) -> NIU_SetTxRingKick(0, 3, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x3, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_3:
	set     0x3, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA4  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA4:
        set     0x10, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA5
        nop

SetTxRingKick_P0_4:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_4)) -> NIU_SetTxRingKick(0, 4, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x4, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_4:
	set     0x4, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA5  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA5:
        set     0x20, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA6
        nop

SetTxRingKick_P0_5:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_5)) -> NIU_SetTxRingKick(0, 5, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x5, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_5:
	set     0x5, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA6  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA6:
        set     0x40, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA7
        nop

SetTxRingKick_P0_6:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_6)) -> NIU_SetTxRingKick(0, 6, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x6, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_6:
	set     0x6, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA7  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA7:
        set     0x80, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA8
        nop

SetTxRingKick_P0_7:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_7)) -> NIU_SetTxRingKick(0, 7, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x7, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_7:
	set     0x7, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA8  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA8:
        set     0x100, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA9
        nop

SetTxRingKick_P0_8:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_8)) -> NIU_SetTxRingKick(0, 8, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x8, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_8:
	set     0x8, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA9  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA9:
        set     0x200, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA10
        nop

SetTxRingKick_P0_9:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_9)) -> NIU_SetTxRingKick(0, 9, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x9, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_9:
	set     0x9, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA10  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA10:
        set     0x400, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA11
        nop

SetTxRingKick_P0_10:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_10)) -> NIU_SetTxRingKick(0, a, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0xa, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_10:
	set     0xa, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA11  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA11:
        set     0x800, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA12
        nop

SetTxRingKick_P0_11:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_11)) -> NIU_SetTxRingKick(0, b, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0xb, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_11:
	set     0xb, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA12  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA12:
        set     0x1000, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA13
        nop

SetTxRingKick_P0_12:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_12)) -> NIU_SetTxRingKick(0, c, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0xc, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_12:
	set     0xc, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA13  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA13:
        set     0x2000, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA14
        nop

SetTxRingKick_P0_13:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_13)) -> NIU_SetTxRingKick(0, d, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0xd, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_13:
	set     0xd, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA14  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA14:
        set     0x4000, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P0_DMA15
        nop

SetTxRingKick_P0_14:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_14)) -> NIU_SetTxRingKick(0, e, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0xe, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_14:
	set     0xe, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA15  should be kicked for Port0
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P0_DMA15:
        set     0x8000, %g2
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA0
        nop

SetTxRingKick_P0_15:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P0_15)) -> NIU_SetTxRingKick(0, f, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0xf, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P0_15:
	set     0xf, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA0  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA0:
        set     0x1, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA1
        nop

SetTxRingKick_P1_0:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_0)) -> NIU_SetTxRingKick(1, 0, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x0, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_0:
	set     0x0, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA1  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA1:
        set     0x2, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA2
        nop

SetTxRingKick_P1_1:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_1)) -> NIU_SetTxRingKick(1, 1, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x1, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_1:
	set     0x1, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA2  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA2:
        set     0x4, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA3
        nop

SetTxRingKick_P1_2:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_2)) -> NIU_SetTxRingKick(1, 2, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x2, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_2:
	set     0x2, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA3  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA3:
        set     0x8, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA4
        nop

SetTxRingKick_P1_3:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_3)) -> NIU_SetTxRingKick(1, 3, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x3, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_3:
	set     0x3, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA4  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA4:
        set     0x10, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA5
        nop

SetTxRingKick_P1_4:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_4)) -> NIU_SetTxRingKick(1, 4, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x4, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_4:
	set     0x4, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA5  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA5:
        set     0x20, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA6
        nop

SetTxRingKick_P1_5:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_5)) -> NIU_SetTxRingKick(1, 5, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x5, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_5:
	set     0x5, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA6  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA6:
        set     0x40, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA7
        nop

SetTxRingKick_P1_6:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_6)) -> NIU_SetTxRingKick(1, 6, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x6, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_6:
	set     0x6, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA7  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA7:
        set     0x80, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA8
        nop

SetTxRingKick_P1_7:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_7)) -> NIU_SetTxRingKick(1, 7, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x7, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_7:
	set     0x7, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA8  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA8:
        set     0x100, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA9
        nop

SetTxRingKick_P1_8:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_8)) -> NIU_SetTxRingKick(1, 8, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x8, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_8:
	set     0x8, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA9  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA9:
        set     0x200, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA10
        nop

SetTxRingKick_P1_9:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_9)) -> NIU_SetTxRingKick(1, 9, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0x9, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_9:
	set     0x9, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA10  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA10:
        set     0x400, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA11
        nop

SetTxRingKick_P1_10:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_10)) -> NIU_SetTxRingKick(1, a, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0xa, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_10:
	set     0xa, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA11  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA11:
        set     0x800, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA12
        nop

SetTxRingKick_P1_11:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_11)) -> NIU_SetTxRingKick(1, b, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0xb, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_11:
	set     0xb, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA12  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA12:
        set     0x1000, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA13
        nop

SetTxRingKick_P1_12:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_12)) -> NIU_SetTxRingKick(1, c, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0xc, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_12:
	set     0xc, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA13  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA13:
        set     0x2000, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA14
        nop

SetTxRingKick_P1_13:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_13)) -> NIU_SetTxRingKick(1, d, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0xd, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_13:
	set     0xd, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA14  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA14:
        set     0x4000, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, CHECK_P1_DMA15
        nop

SetTxRingKick_P1_14:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_14)) -> NIU_SetTxRingKick(1, e, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0xe, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_14:
	set     0xe, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
! Find out if DMA15  should be kicked for Port1
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHECK_P1_DMA15:
        set     0x8000, %g2
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g2, %g6
        brz     %g6, DONE_CHECK_KICK_DMA
        nop

SetTxRingKick_P1_15:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_P1_15)) -> NIU_SetTxRingKick(1, f, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	set     0xf, %o0
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_P1_15:
	set     0xf, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop
DONE_CHECK_KICK_DMA:
#ifdef JUMBO_FRAME_EN
        set     loop_count, %g4
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

        set     0xffff, %g3
        set     NIU_TX_MULTI_DMA_P0, %g5
        and     %g5, %g3, %g6
        brz     %g6, NIUTx_Pkt_Cnt_Chk_P1
        nop
NIUTx_Pkt_Cnt_Chk_P0:
	set     0x0, %o0             ! MAC PORT
        set     FAIR_PKT_CNT, %o1    ! PKT CNT
	call    NiuTx_check_pkt_cnt
	nop

        set     loop_count, %g4
delay_loop_end_p0:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_end_p0
        nop

        set     0xffff, %g3
        set     NIU_TX_MULTI_DMA_P1, %g5
        and     %g5, %g3, %g6
        brz     %g6, Done_Pkt_Chk
        nop
NIUTx_Pkt_Cnt_Chk_P1:
	set     0x1, %o0             ! MAC PORT
        set     FAIR_PKT_CNT, %o1    ! PKT CNT
	call    NiuTx_check_pkt_cnt
	nop

        set     loop_count, %g4
delay_loop_end_p1:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_end_p1
        nop
Done_Pkt_Chk:
test_passed:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.test_passed)) -> NIU_EXIT_chk(0)
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.test_passed)) -> NIU_EXIT_chk(1)
        EXIT_GOOD


/************************************************************************
   Test case data start
************************************************************************/
SECTION       SetRngConfig_init data_va=0x100000000
attr_data {
	Name = SetRngConfig_init,
	hypervisor,
	compressimage
	}
.data
SetRngConfig_init:
        .xword 0x0060452301000484

SECTION       SetTxRingKick_init data_va=0x100000100
attr_data {
	Name = SetTxRingKick_init,
	hypervisor,
	compressimage
	}
.data
SetTxRingKick_init:
        .xword 0x0060452301000484

SECTION       SetTxLPMask1_init data_va=0x100000200
attr_data {
        Name = SetTxLPMask1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPMask1_init:
        .xword 0x0060452301000484

SECTION       SetTxLPValue1_init data_va=0x100000300
attr_data {
        Name = SetTxLPValue1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValue1_init:
        .xword 0x0060452301000484

SECTION       SetTxLPRELOC1_init data_va=0x100000400
attr_data {
        Name = SetTxLPRELOC1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPRELOC1_init:
        .xword 0x0060452301000484
SECTION       SetTxLPMask2_init data_va=0x100000500
attr_data {
        Name = SetTxLPMask2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPMask2_init:
        .xword 0x0060452301000484
SECTION       SetTxLPValue2_init data_va=0x100000600
attr_data {
        Name = SetTxLPValue2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValue2_init:
        .xword 0x0060452301000484

SECTION       SetTxLPRELOC2_init data_va=0x100000700
attr_data {
        Name = SetTxLPRELOC2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPRELOC2_init:
        .xword 0x0060452301000484

SECTION       SetTxLPValid_init data_va=0x100000800
attr_data {
        Name = SetTxLPValid_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValid_init:
        .xword 0x0060452301000484
!# 315 "diag.j.pp"

#if 0
#endif
