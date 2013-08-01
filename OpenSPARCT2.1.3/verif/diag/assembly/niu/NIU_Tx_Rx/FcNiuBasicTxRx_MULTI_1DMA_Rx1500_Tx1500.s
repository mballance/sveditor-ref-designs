/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: FcNiuBasicTxRx_MULTI_1DMA_Rx1500_Tx1500.s
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
#define  TX_FAIR_PKT_CNT  (NIU_TX_PKT_CNT / 2)
#define  FAIR_PKT_COUNT  ((RXMAC_PKTCNT) - (RXMAC_PKTCNT%8))

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	mov	0x1, %g4

	ta	T_RD_THID
	nop
	cmp	%g4, %o1		! Check if its thread1
	be	thread_1		!
	nop
	brz	%o1, thread_Tx		! Execute thread_0
	nop
	cmp	%g4, %o1		! Send the remaining threads to good-end, if any.
	bne	RX_test_passed		!
	nop

!
! Thread 0 Start
!
!
thread_Tx:
!#include "niu_init.h"
!thread_0:
	nop
	wr      %g0, ASI_CMP_CORE, %asi
	mov	0x2, %g4
	stxa 	%g4, [ASI_CMP_CORE_RUNNING_W1S]%asi	! Start Thread_1
	nop

Init_flow:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig(MAC_ID, FRAME_TYPE, FRAME_CLASS, NIU_TX_PKT_LEN_P0, NIU_TX_MULTI_PORT, NIU_TX_PKT_LEN_P1)

P_TxDMAActivate:
	setx	MAC_ID, %g1, %o0	         ! 1st Parameter
        setx    SetTxDMAActive_list, %g1, %o1    ! 2st parameter
	setx    NIU_TX_MULTI_PORT, %g1, %o2
	setx    NIU_TX_MULTI_DMA_P0, %g1, %o3
	setx    NIU_TX_MULTI_DMA_P1, %g1, %o4
        call    SetTxDMAActive
	nop			! $EV trig_pc_d(1, @VA(.MAIN.P_TxDMAActivate)) -> NIU_TxDMAActivate (MAC_ID, TxDmaActive_list, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)

P_AddTxChannels :
	nop			! $EV trig_pc_d(1, @VA(.MAIN.P_AddTxChannels)) -> NIU_AddTxChannels(MAC_ID, NIU_TxDmaNoUE, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5		! Just for delay
	nop

P_SetTxMaxBurst :
	setx	NIU_TxDmaNo,	%g1, %o0		! 1st parameter : 
        setx  	SetTxMaxBurst_Data, %g1, %o1		! 2nd parameter
	setx    NIU_TX_MULTI_PORT, %g1, %o2
	setx    NIU_TX_MULTI_DMA_P0, %g1, %o3
	setx    NIU_TX_MULTI_DMA_P1, %g1, %o4
	call	SetTxMaxBurst
	nop		! $EV trig_pc_d(1, @VA(.MAIN.P_SetTxMaxBurst)) -> NIU_SetTxMaxBurst (MAC_ID, NIU_TxDmaNoUE, TxMaxBurst_Data, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5		! Just for delay
	nop

        nop
	setx    NIU_TX_MULTI_PORT, %g1, %o2
	setx    NIU_TX_MULTI_DMA_P0, %g1, %o3
	setx    NIU_TX_MULTI_DMA_P1, %g1, %o4
	call	InitTxDma
	nop	
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5		! Just for delay
	nop

Gen_Packet:
	nop		! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> TxPktGen(MAC_ID, NIU_TxDmaNoUE,NIU_TX_PKT_CNT, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	nop			

        setx    0x50, %g1, %g4
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
        setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2		! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_0)) -> NIU_SetTxRingKick(0, 0, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	setx    0x0,            %g1, %o0 
        ldx     [%g2]                  , %g3    
        nop
        mulx     %o0, 0x200, %g5
        setx	TX_RING_KICK_Addr, %g1, %g2
        add     %g2, %g5, %g2
	setx    0x800,            %g1, %g3 
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

SetTxCs_0 :
	setx    0x0,            %g1, %o0
	setx	TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
        setx    TX_CS_Addr, %g1, %g2
        add     %g2, %g5, %g2
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

SetTxRingKick_1:
        setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2		! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick_1)) -> NIU_SetTxRingKick(1, 8, NIU_TX_MULTI_PORT, NIU_TX_MULTI_DMA_P0, NIU_TX_MULTI_DMA_P1)
	setx    0x8,            %g1, %o0 
        ldx     [%g2]                  , %g3    
        nop
        mulx     %o0, 0x200, %g5
        setx	TX_RING_KICK_Addr, %g1, %g2
        add     %g2, %g5, %g2
	setx    0x800,            %g1, %g3 
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

SetTxCs_1 :
	setx    0x8,            %g1, %o0
	setx	TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
        setx    TX_CS_Addr, %g1, %g2
        add     %g2, %g5, %g2
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop


#ifdef JUMBO_FRAME_EN		/* Extra Delay for Jumbo packets to go out */
	setx	loop_count, %g1, %g4
delay_loop:
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g5
	nop
	nop
	nop
	nop
	dec	%g4
	brnz	%g4, delay_loop
	nop
#endif

NIUTx_Pkt_Cnt_Chk_P0:
	setx    0x0, %g1, %o0                 ! MAC PORT
!       setx    0x8, %g1, %o1                 ! PKT CNT
        setx    TX_FAIR_PKT_CNT, %g1, %o1        ! PKT CNT
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
        setx    TX_FAIR_PKT_CNT, %g1, %o1        ! PKT CNT
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

TX_test_passed:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.TX_test_passed)) -> NIU_EXIT_chk(0)
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.TX_test_passed)) -> NIU_EXIT_chk(1)
        EXIT_GOOD

!.global test_failed
!test_failed:
!	nop
!        EXIT_BAD

    
!
! Thread 1 Start
!
!
thread_1:

/************************************************************************
   NIU RX Template Port 0 ---> DMA 0                            
                   Port 1 ---> DMA 1                              
 ************************************************************************/

!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
!  Init DMA Channel 0 @@@@@@@@@@@@@@@@@@@@@@@@@@@@
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

P_NIU_RxInitDma_0:
	setx    TX_CS, %g1, %g2
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxInitDma_0)) -> NIU_InitRxDma(0, RX_DESC_RING_LENGTH, RX_COMPL_RING_LEN, RBR_CONFIG_B_DATA, RX_INITIAL_KICK, 0x0, NIU_RX_MULTI_DMA)
        setx    0x5, %g1, %g4
delay_loop_Rx_0:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_Rx_0
        nop

	nop
	setx    0x0, %g1, %o0
	setx    0x0, %g1, %o1
	setx    RX_DESC_RING_LENGTH, %g1, %o2
	setx    RX_COMPL_RING_LEN, %g1, %o3
	setx    RBR_CONFIG_B_DATA, %g1, %o4
	setx    RX_INITIAL_KICK, %g1, %o5
	call    NiuInitRxDma
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
!  Init DMA Channel 1 @@@@@@@@@@@@@@@@@@@@@@@@@@@@
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

P_NIU_RxInitDma_1:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxInitDma_1)) -> NIU_InitRxDma(1, RX_DESC_RING_LENGTH, RX_COMPL_RING_LEN, RBR_CONFIG_B_DATA, RX_INITIAL_KICK, 0x0, NIU_RX_MULTI_DMA)
        setx    0x5, %g1, %g4
delay_loop_Rx_1:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_Rx_1
        nop

	nop
	setx    0x1, %g1, %o0
	setx    RX_DESC_RING_LENGTH, %g1, %o2
	setx    RX_COMPL_RING_LEN, %g1, %o3
	setx    RBR_CONFIG_B_DATA, %g1, %o4
	setx    RX_INITIAL_KICK, %g1, %o5
	setx    NIU_RX_MULTI_DMA, %g1, %o6
	call    NiuInitRxDma
	nop
P0_NIU_RxPkt_Conf:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P0_NIU_RxPkt_Conf)) -> NIU_RxPktConf(RXMAC_PKTCNT,0)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop
P1_NIU_RxPkt_Conf:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P1_NIU_RxPkt_Conf)) -> NIU_RxPktConf(RXMAC_PKTCNT,1)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop
P_NIU_Rx_GenPkt:
	setx    RXMAC_PKTCNT, %g1, %g6
	nop
Rx_pktcnt_loop:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Rx_pktcnt_loop)) -> NIU_RxGenPkt(MAC_ID, 0, RXMAC_PKTCNT, 0x5dc,0x1, NIU_RX_MULTI_DMA, 1)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop
	nop
	nop
	nop

delay_loop0:
        mulx    %o1, 0x200, %g4
        setx    RCR_STAT_A, %g7, %g2
        add     %g2, %g4, %g2
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g4

        mulx    %o0, 0x200, %g5
        setx    RCR_STAT_A, %g7, %g2
        add     %g2, %g5, %g2
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5

        add     %g5, %g4, %g5
        cmp     %g5, FAIR_PKT_COUNT
        bne     delay_loop0
        nop


RX_test_passed:
	nop
        EXIT_GOOD


/************************************************************************/

SECTION       SetRxLogMask1_init data_va=0x200000100
attr_data {
	Name = SetRxLogMask1_init,
	hypervisor,
	compressimage
	}
.data
SetRxLogMask1_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetRxLogVal1_init data_va=0x200000200
attr_data {
        Name = SetRxLogVal1_init,
        hypervisor,
        compressimage
        }
.data
SetRxLogVal1_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetRxLogRelo1_init data_va=0x200000300
attr_data {
        Name = SetRxLogRelo1_init,
        hypervisor,
        compressimage
        }
.data
SetRxLogRelo1_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetRxLogPgVld_init data_va=0x200000400
attr_data {
        Name = SetRxLogPgVld_init,
        hypervisor,
        compressimage
        }
.data
SetRxLogPgVld_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetRbrConfig_A_init data_va=0x200000500
attr_data {
        Name = SetRbrConfig_A_init,
        hypervisor,
        compressimage
        }
.data
SetRbrConfig_A_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetRbrConfig_B_init data_va=0x200000600
attr_data {
        Name = SetRbrConfig_B_init,
        hypervisor,
        compressimage
        }
.data
SetRbrConfig_B_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetRcrConfig_A_init data_va=0x200000700
attr_data {
        Name = SetRcrConfig_A_init,
        hypervisor,
        compressimage
        }
.data
SetRcrConfig_A_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetRxDmaCfig_1_0_init data_va=0x200000800
attr_data {
        Name = SetRxDmaCfig_1_0_init,
        hypervisor,
        compressimage
        }
.data
SetRxDmaCfig_1_0_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetRxdmaCfig2Start_init data_va=0x200000900
attr_data {
        Name = SetRxdmaCfig2Start_init,
        hypervisor,
        compressimage
        }
.data
SetRxdmaCfig2Start_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetRxDmaCfig_1_1_init data_va=0x200000a00
attr_data {
        Name = SetRxDmaCfig_1_1_init,
        hypervisor,
        compressimage
        }
.data
SetRxDmaCfig_1_1_init:
        .xword 0x0060452301000484

/************************************************************************/

SECTION       SetRxRingKick_init data_va=0x200000b00
attr_data {
        Name = SetRxRingKick_init,
        hypervisor,
        compressimage
        }
.data
SetRxRingKick_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetRxLogMask2_init data_va=0x200000c00
attr_data {   
        Name = SetRxLogMask2_init,
        hypervisor,
        compressimage
        }
.data   
SetRxLogMask2_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetRxLogVal2_init data_va=0x200000d00
attr_data {
        Name = SetRxLogVal2_init,
        hypervisor,
        compressimage
        }
.data
SetRxLogVal2_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetRxLogRelo2_init data_va=0x200000e00
attr_data {
        Name = SetRxLogRelo2_init,
        hypervisor,
        compressimage
        }
.data
SetRxLogRelo2_init:
        .xword 0x0060452301000484

/************************************************************************/

/************************************************************************
   Test case data start
 ************************************************************************/
/* These initialization is temporary, as there looks some bug in mempli */

SECTION       SetRngConfig_init data_va=0x100000000
attr_data {
	Name = SetRngConfig_init,
	hypervisor,
	compressimage
	}
.data
SetRngConfig_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxRingKick_init data_va=0x100000100
attr_data {
	Name = SetTxRingKick_init,
	hypervisor,
	compressimage
	}
.data
SetTxRingKick_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxLPMask1_init data_va=0x100000200
attr_data {
        Name = SetTxLPMask1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPMask1_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxLPValue1_init data_va=0x100000300
attr_data {
        Name = SetTxLPValue1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValue1_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxLPRELOC1_init data_va=0x100000400
attr_data {
        Name = SetTxLPRELOC1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPRELOC1_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetTxLPMask2_init data_va=0x100000500
attr_data {
        Name = SetTxLPMask2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPMask2_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetTxLPValue2_init data_va=0x100000600
attr_data {
        Name = SetTxLPValue2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValue2_init:
        .xword 0x0060452301000484

/************************************************************************/
SECTION       SetTxLPRELOC2_init data_va=0x100000700
attr_data {
        Name = SetTxLPRELOC2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPRELOC2_init:
        .xword 0x0060452301000484

/************************************************************************/
SECTION       SetTxLPValid_init data_va=0x100000800
attr_data {
        Name = SetTxLPValid_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValid_init:
        .xword 0x0060452301000484

/************************************************************************/
