/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: rx_p0p1_MULTI_2DMA_rand_88.s
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
#define  FAIR_PKT_COUNT  ((RXMAC_PKTCNT) - (RXMAC_PKTCNT%8))

.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop
# 94 "diag.j.pp"
!
! Thread 0 Start
!
!
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
!  Init DMA Channel 6 @@@@@@@@@@@@@@@@@@@@@@@@@@@@
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

P_NIU_RxInitDma_0:
	setx    TX_CS, %g1, %g2
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxInitDma_0)) -> NIU_InitRxDma(6, RX_DESC_RING_LENGTH, RX_COMPL_RING_LEN, RBR_CONFIG_B_DATA, RX_INITIAL_KICK, 0x0, NIU_RX_MULTI_DMA)
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
	setx    0x6, %g1, %o0
	setx    0x6, %g1, %o1
	setx    RX_DESC_RING_LENGTH, %g1, %o2
	setx    RX_COMPL_RING_LEN, %g1, %o3
	setx    RBR_CONFIG_B_DATA, %g1, %o4
	setx    RX_INITIAL_KICK, %g1, %o5
	call    NiuInitRxDma
	nop
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
!  Init DMA Channel 7 @@@@@@@@@@@@@@@@@@@@@@@@@@@@
!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

P_NIU_RxInitDma_1:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxInitDma_1)) -> NIU_InitRxDma(7, RX_DESC_RING_LENGTH, RX_COMPL_RING_LEN, RBR_CONFIG_B_DATA, RX_INITIAL_KICK, 0x0, NIU_RX_MULTI_DMA)
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
	setx    0x7, %g1, %o0
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
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Rx_pktcnt_loop)) -> NIU_RxGenPkt(MAC_ID, 0, RXMAC_PKTCNT, 0x41,0x1, NIU_RX_MULTI_DMA, 1)
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


test_passed:
	nop
        EXIT_GOOD
# 218 "diag.j.pp"

/************************************************************************
   Test case data start
************************************************************************/
!SECTION       SetRngConfig_init data_va=0x100000000
!attr_data {
!	Name = SetRngConfig_init,
!	hypervisor,
!	compressimage
!	}
!.data
!SetRngConfig_init:
!        .xword 0x0060452301000484

SECTION       SetRxLogMask1_init data_va=0x200000100
attr_data {
	Name = SetRxLogMask1_init,
	hypervisor,
	compressimage
	}
.data
SetRxLogMask1_init:
        .xword 0x0060452301000484

SECTION       SetRxLogVal1_init data_va=0x200000200
attr_data {
        Name = SetRxLogVal1_init,
        hypervisor,
        compressimage
        }
.data
SetRxLogVal1_init:
        .xword 0x0060452301000484

SECTION       SetRxLogRelo1_init data_va=0x200000300
attr_data {
        Name = SetRxLogRelo1_init,
        hypervisor,
        compressimage
        }
.data
SetRxLogRelo1_init:
        .xword 0x0060452301000484

SECTION       SetRxLogPgVld_init data_va=0x200000400
attr_data {
        Name = SetRxLogPgVld_init,
        hypervisor,
        compressimage
        }
.data
SetRxLogPgVld_init:
        .xword 0x0060452301000484
SECTION       SetRbrConfig_A_init data_va=0x200000500
attr_data {
        Name = SetRbrConfig_A_init,
        hypervisor,
        compressimage
        }
.data
SetRbrConfig_A_init:
        .xword 0x0060452301000484
SECTION       SetRbrConfig_B_init data_va=0x200000600
attr_data {
        Name = SetRbrConfig_B_init,
        hypervisor,
        compressimage
        }
.data
SetRbrConfig_B_init:
        .xword 0x0060452301000484
SECTION       SetRcrConfig_A_init data_va=0x200000700
attr_data {
        Name = SetRcrConfig_A_init,
        hypervisor,
        compressimage
        }
.data
SetRcrConfig_A_init:
        .xword 0x0060452301000484
SECTION       SetRxDmaCfig_1_0_init data_va=0x200000800
attr_data {
        Name = SetRxDmaCfig_1_0_init,
        hypervisor,
        compressimage
        }
.data
SetRxDmaCfig_1_0_init:
        .xword 0x0060452301000484
SECTION       SetRxdmaCfig2Start_init data_va=0x200000900
attr_data {
        Name = SetRxdmaCfig2Start_init,
        hypervisor,
        compressimage
        }
.data
SetRxdmaCfig2Start_init:
        .xword 0x0060452301000484
SECTION       SetRxDmaCfig_1_1_init data_va=0x200000a00
attr_data {
        Name = SetRxDmaCfig_1_1_init,
        hypervisor,
        compressimage
        }
.data
SetRxDmaCfig_1_1_init:
        .xword 0x0060452301000484
# 331 "diag.j.pp"
SECTION       SetRxRingKick_init data_va=0x200000b00
attr_data {
        Name = SetRxRingKick_init,
        hypervisor,
        compressimage
        }
.data
SetRxRingKick_init:
        .xword 0x0060452301000484

SECTION       SetRxLogMask2_init data_va=0x200000c00
attr_data {   
        Name = SetRxLogMask2_init,
        hypervisor,
        compressimage
        }
.data   
SetRxLogMask2_init:
        .xword 0x0060452301000484

SECTION       SetRxLogVal2_init data_va=0x200000d00
attr_data {
        Name = SetRxLogVal2_init,
        hypervisor,
        compressimage
        }
.data
SetRxLogVal2_init:
        .xword 0x0060452301000484

SECTION       SetRxLogRelo2_init data_va=0x200000e00
attr_data {
        Name = SetRxLogRelo2_init,
        hypervisor,
        compressimage
        }
.data
SetRxLogRelo2_init:
        .xword 0x0060452301000484
# 374 "diag.j.pp"

#if 0
#endif
