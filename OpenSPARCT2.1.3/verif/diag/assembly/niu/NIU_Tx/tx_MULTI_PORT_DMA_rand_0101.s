/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tx_MULTI_PORT_DMA_rand_0101.s
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
!#define  FAIR_PKT_CNT  ((NIU_TX_PKT_CNT) - (NIU_TX_PKT_CNT%8))

.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop
# 85 "diag.j.pp"
!
! Thread 0 Start
!
!
!thread_0:

Init_flow:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig(MAC_ID, FRAME_TYPE, FRAME_CLASS, 40, NIU_TX_MULTI_PORT, 90)

P_TxDMAActivate:
	setx    MAC_ID, %g1, %o0
	setx    0x1, %g1, %o1
	setx    NIU_TX_MULTI_PORT, %g1, %o2
	setx    NIU_TX_MULTI_DMA_P0, %g1, %o3
	setx    NIU_TX_MULTI_DMA_P1, %g1, %o4
	call    SetTxDMAActive
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_TxDMAActivate)) -> NIU_TxDMAActivate (MAC_ID, 1, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
 

P_AddTxChannels:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_AddTxChannels)) -> NIU_AddTxChannels(MAC_ID, 0, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

P_SetTxMaxBurst:
	setx    0x0, %g1, %o0
	setx    SetTxMaxBurst_Data, %g1, %o1
	setx    NIU_TX_MULTI_PORT, %g1, %o2
	setx    NIU_TX_MULTI_DMA_P0, %g1, %o3
	setx    NIU_TX_MULTI_DMA_P1, %g1, %o4
	call    SetTxMaxBurst
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_SetTxMaxBurst)) -> NIU_SetTxMaxBurst (MAC_ID, 0, TxMaxBurst_Data, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop







        nop
	setx    NIU_TX_MULTI_PORT, %g1, %o2
	setx    NIU_TX_MULTI_DMA_P0, %g1, %o3
	setx    NIU_TX_MULTI_DMA_P1, %g1, %o4
        call    InitTxDma
        nop
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop

Gen_Packet:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> TxPktGen(MAC_ID, 0, NIU_TX_PKT_CNT, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
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

SetTxRingKick_0:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_0)) -> NIU_SetTxRingKick(0, 0, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	setx    0x0,    %g1, %o0
!       setx    NIU_TX_MULTI_PORT, %g1, %o2
!      	setx    NIU_TX_MULTI_DMA_P0, %g1, %o3
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_0:
	setx    0x0, %g1, %o0
	setx    TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa     %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxRingKick_1:
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_1)) -> NIU_SetTxRingKick(1, 8, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	setx    0x8,    %g1, %o0
!       setx    NIU_TX_MULTI_PORT, %g1, %o2
!       setx    NIU_TX_MULTI_DMA_P1, %g1, %o4
	ldx     [%g2]                  , %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs_8:
	setx    0x8, %g1, %o0
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


NIUTx_Pkt_Cnt_Chk_P0:
	setx    0x0, %g1, %o0                 ! MAC PORT
!       setx    0x8, %g1, %o1                 ! PKT CNT
        setx    FAIR_PKT_CNT, %g1, %o1        ! PKT CNT
	call    NiuTx_check_pkt_cnt
	nop

        setx    loop_count, %g1, %g4
delay_loop_end_p0:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_end_p0
        nop

NIUTx_Pkt_Cnt_Chk_P1:
	setx    0x1, %g1, %o0                 ! MAC PORT
!       setx    0x8, %g1, %o1                 ! PKT CNT
        setx    FAIR_PKT_CNT, %g1, %o1        ! PKT CNT
	call    NiuTx_check_pkt_cnt
	nop

        setx    loop_count, %g1, %g4
delay_loop_end_p1:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_end_p1
        nop

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
# 315 "diag.j.pp"

#if 0
#endif
