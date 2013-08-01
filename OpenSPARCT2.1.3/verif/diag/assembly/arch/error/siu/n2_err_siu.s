/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_siu.s
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

#include "niu_init.h"
!
! Thread 0 Start
!
!
thread_0:

Init_flow:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig(MAC_ID)

P_TxDMAActivate:
	setx	MAC_ID, %g1, %o0			! 1st Parameter
        setx    SetTxDMAActive_list, %g1, %o1           ! 2st parameter
        call    SetTxDMAActive
	nop						! $EV trig_pc_d(1, @VA(.MAIN.P_TxDMAActivate)) -> NIU_TxDMAActivate (MAC_ID, TxDmaActive_list)

P_AddTxChannels :
	nop						! $EV trig_pc_d(1, @VA(.MAIN.P_AddTxChannels)) -> NIU_AddTxChannels(MAC_ID, NIU_TxDmaNoUE)

	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5		! Just for delay
	nop

P_SetTxMaxBurst :
	setx	NIU_TxDmaNo,	%g1, %o0		! 1st parameter : 
        setx  	SetTxMaxBurst_Data, %g1, %o1		! 2nd parameter
	call	SetTxMaxBurst
	nop						! $EV trig_pc_d(1, @VA(.MAIN.P_SetTxMaxBurst)) -> NIU_SetTxMaxBurst (MAC_ID, NIU_TxDmaNoUE, TxMaxBurst_Data)

	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5		! Just for delay
	nop

P_InitTxDma:
	setx	NIU_TxDmaNo,	%g1, %o0		! 1st parameter : 
	nop						! $EV trig_pc_d(1, @VA(.MAIN.P_InitTxDma)) -> NIU_InitTxDma (MAC_ID, NIU_TxDmaNoUE)	
	call	InitTxDma
	nop	

	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5		! Just for delay
	nop


clear_esr_first:
        setx    SOC_ESR_REG, %l7, %i0
        stx     %g0, [%i0]

set_ejr:
        set     0x1, %i1
        sllx    %i1, ERR_FIELD, %i2   
        setx    SOC_EJR_REG, %l7, %i3
        stx     %i2, [%i3]
        membar  0x40

Gen_Packet:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> TxPktGen(MAC_ID, NIU_TxDmaNoUE,NiuTxPktCountUE)
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
        setx    0x100000100, %g1, %g2		! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick)) -> NIU_SetTxRingKick(MAC_ID, NIU_TxDmaNoUE)
	setx    NIU_TxDmaNo,    %g1, %o0 
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g3    
        nop
        mulx     %o0, 0x200, %g5
        setx	TX_RING_KICK_Addr, %g1, %g2
        add     %g2, %g5, %g2
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

SetTxCs :
	setx    NIU_TxDmaNo,    %g1, %o0
	setx	TX_CS_Data, %g1, %g3
	mulx     %o0, 0x200, %g5
        setx    TX_CS_Addr, %g1, %g2
        add     %g2, %g5, %g2
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop


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

read_esr:
        setx    SOC_ESR_REG, %l7, %i0
        ldx     [%i0], %i1
        nop

        setx    0x8000000000000000, %l7, %o3    !valid bit
        set     0x1, %i2
        sllx    %i2, ERR_FIELD, %i3     
        or      %i3, %o3, %i4        
        sub     %i1, %i4, %i5
        brnz    %i5, test_failed
        nop

	
test_passed:
	nop			
	EXIT_GOOD

test_failed:
	EXIT_BAD


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

