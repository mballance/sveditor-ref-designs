/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_rx_uev_rand_l2siocce.s
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

#include "err_defines.h"
#include "hboot.s"
#include "niu_defines.h"
    

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop


        /******************************
		RAS
                Error Injection
        ******************************/
clear_esr_first:
        setx    SOC_ESR_REG, %l7, %i0
        stx     %g0, [%i0]

inj_err:
        nop                     !$EV trig_pc_d(0,@VA(.MAIN.inj_err)) ->IosRandErrInj(L2SIO_CCE, 10, 10)
	nop

/************************************************************************
   First call the Vera, so that values are updated in Memory and
   then read those values from assembly and program the registers
 ************************************************************************/
P_NIU_RxInitDma:
        nop             !$EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxInitDma)) -> NIU_InitRxDma(RXDMA_CHNL, RX_DESC_RING_LENGTH, RX_COMPL_RING_LEN, RBR_CONFIG_B_DATA, RX_INITIAL_KICK, NIU_Xlate_On)

        setx    0x5, %g1, %g4                   ! Delay for Vera to complete
delay_loop_Rx:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_Rx
        nop

        nop
        setx    RXDMA_CHNL, %g1, %o0
        setx    RX_DESC_RING_LENGTH, %g1, %o1
        setx    RX_COMPL_RING_LEN, %g1, %o2
        setx    RBR_CONFIG_B_DATA, %g1, %o3
        setx    RX_INITIAL_KICK, %g1, %o4
        call    NiuInitRxDma
        nop

P_NIU_RxPkt_Conf:
        nop             !$EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxPkt_Conf)) -> NIU_RxPktConf(RXMAC_PKTCNT)
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5    ! Just for Delay
        nop


P_NIU_Rx_GenPkt:
        setx    RXMAC_PKTCNT, %g1, %g6          ! Packet count
        nop
Rx_pktcnt_loop:
        nop             !$EV trig_pc_d(1, @VA(.MAIN.Rx_pktcnt_loop)) -> NIU_RxGenPkt(MAC_ID, RXDMA_CHNL, 1, MAC_PKT_LEN, 1)
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5    ! just for delay
        nop
        dec     %g6
        brnz    %g6, Rx_pktcnt_loop
        nop

        setx    loop_count, %g1, %g4
delay_loop:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop
        nop


        /******************************
                Error Check
        ******************************/
read_esr:
        setx    SOC_ESR_REG, %l7, %i0
        ldx     [%i0], %i1
        nop

        setx    0x8000000000000000, %l7, %o3    !valid bit
        set     0x1, %i2
        sllx    %i2, ERR_FIELD, %i3
        or      %i3, %o3, %i4
        sub     %i1, %i4, %i5
        brnz    %i5, test_fail
        nop
        /********************************/
	
test_passed:
	nop			
	EXIT_GOOD

!.global test_failed
!test_failed:
!	EXIT_BAD

test_fail:
        EXIT_BAD
        nop


/************************************************************************
   Test case data start
 ************************************************************************/
/* These initialization is temporary, as there looks some bug in mempli */
!
!SECTION       SetRngConfig_init data_va=0x100000000
!attr_data {
!	Name = SetRngConfig_init,
!	hypervisor,
!	compressimage
!	}
!.data
!SetRngConfig_init:
!        .xword 0x0060452301000484
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
