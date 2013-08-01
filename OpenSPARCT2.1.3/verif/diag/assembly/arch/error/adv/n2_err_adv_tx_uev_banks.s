/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_tx_uev_banks.s
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
#define H_HT0_Hw_Corrected_Error_0x63 My_Corrected_ECC_error_trap
#define H_HT0_Sw_Recoverable_Error_0x40  My_Recoverable_Sw_error_trap

    
/* #define MAIN_PAGE_NUCLEUS_ALSO */ /* Access main in priviledge mode */
#define MAIN_PAGE_HV_ALSO

#include "err_defines.h"
#include "hboot.s"
#include "niu_defines.h"


/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global  My_Corrected_ECC_error_trap
.global  My_Recoverable_Sw_error_trap

main:
        ta T_CHANGE_HPRIV
        nop

! #include "niu_init.h"
!
! Thread 0 Start
!
!
! thread_0:

Init_flow:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig(MAC_ID, FRAME_TYPE, FRAME_CLASS,TX_PKT_LEN)

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
	nop						! $EV trig_pc_d(1, @VA(.MAIN.P_InitTxDma)) -> NIU_InitTxDma (MAC_ID, NIU_TxDmaNoUE, NIU_Xlate_On)
	call	InitTxDma
	nop	

	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5		! Just for delay
	nop


	/************************************
		RAS
	*************************************/
clear_esr_first:
        setx    SOC_ESR_REG, %l7, %i0
        stx     %g0, [%i0]


inj_err1:
        nop                     !$EV trig_pc_d(0,@VA(.MAIN.inj_err1)) ->IosErrInj(ERR_TYPE, ERR_CTAG, ERR_ADDR )


L2_err_enable:
        set     0x3, %l1
        mov     0xaa, %g2
        sllx    %g2, 32, %g2
        stx     %l1, [%g2]
        stx     %l1, [%g2 + 0x40]
        stx     %l1, [%g2 + 0x80]
        stx     %l1, [%g2 + 0xc0]
        stx     %l1, [%g2 + 0x100]
        stx     %l1, [%g2 + 0x140]
        stx     %l1, [%g2 + 0x180]
        stx     %l1, [%g2 + 0x1c0]

       /*************************************/

Gen_Packet:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> TxPktGen(MAC_ID, NIU_TxDmaNoUE,NIU_TX_PKT_CNT)
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
        setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2		! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick)) -> NIU_SetTxRingKick(MAC_ID, NIU_TxDmaNoUE, 0, 0)
	setx    NIU_TxDmaNo,    %g1, %o0 
        ldx    [%g2], %g3    
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


NIUTx_Pkt_Cnt_Chk:
        setx    MAC_ID, %g1, %o0

#ifdef CE
	setx	0x10, %g1, %o1
#else
        setx    0x9, %g1, %o1
#endif



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

        /************************************
                RAS
        *************************************/
esr:
	setx	SOC_ESR_REG, %g7, %g5
	setx	0x100, %g7, %g6

        setx    0x8000000000000000, %g7, %g1    !valid bit
        set     0x1, %g2
        sllx    %g2, ERR_FIELD, %g3
        or      %g3, %g1, %g2
esr_loop:
	dec	%g6
	cmp	%g6, %g0
	be	%xcc, test_failed
	nop

	ldx	[%g5], %g3

	cmp	%g3, %g2
	be	%xcc, eie_reg_ones
	nop

	ba	esr_loop
	nop

eie_reg_ones:
	setx	SOC_EIE_REG, %g3, %g2
	setx	0xffffffffffffffff, %g3, %g1
	stx	%g1, [%g2]
	membar	0x40

	set	0x1, %g1			! 1 traps from rdd; 1 trap from WRI
	setx	0x100, %g7, %g6
err_trap_loop:
	cmp	%g6, %g0
	be	%xcc, test_failed
	nop

	cmp	%g1, %i7
	be	%xcc, check_tt
	nop

	ba	err_trap_loop
	nop

check_tt:
        setx  EXECUTED, %l1, %l0
        cmp   %o6, %l0
        bne   test_failed
        nop

#ifdef CE
	mov	0x63, %l0
#else
        mov   0x40, %l0				! TT=0x40
#endif
        cmp   %o7, %l0
        bne   test_failed
        nop
       /*************************************/



test_passed:

#ifdef CE
	nop			! $EV trig_pc_d(1, @VA(.MAIN.test_passed)) -> NIU_EXIT_chk(MAC_ID)
#endif


	EXIT_GOOD

!.global test_failed
!test_failed:
!	EXIT_BAD

test_failed:
	EXIT_BAD
	nop
/************************************************************************
	RAS
   	Trap Handlers
 ************************************************************************/
My_Recoverable_Sw_error_trap:
        ! Signal trap taken
        setx  EXECUTED, %l0, %o6
        ! save trap type value
        rdpr  %tt, %o7

	inc	%i7

check_desr_tt40:
        ldxa  [%g0]0x4c, %g2
        nop
        setx    0xb300000000000000, %l0, %g3
        subcc   %g2, %g3, %g4
        brnz    %g4, test_failed
        nop

check_per_tt40:
        setx    SOC_PER_REG, %l7, %i0
        ldx     [%i0], %i1
        setx    0x8000000000000000, %l7, %o3    !valid bit
        set     0x1, %i2
        sllx    %i2, ERR_FIELD, %i3
        or      %i3, %o3, %i4
        sub     %i1, %i4, %i5
        brnz    %i5, test_failed
        nop

clear_per_tt40:
        setx    SOC_PER_REG, %l7, %i0
        stx     %g0, [%i0]
        nop
        done
        nop


My_Corrected_ECC_error_trap:
        ! Signal trap taken
        setx  EXECUTED, %l0, %o6
        ! save trap type value
        rdpr  %tt, %o7

	inc	%i7

check_desr_tt63:
        ldxa  [%g0]0x4c, %g2
        nop
        setx    0x8b00000000000000, %l0, %g3
        subcc   %g2, %g3, %g4
        brnz    %g4, test_failed

check_per_tt63:
        setx    SOC_PER_REG, %l7, %i0
        ldx     [%i0], %i1
        setx    0x8000000000000000, %l7, %o3    !valid bit
        set     0x1, %i2
        sllx    %i2, ERR_FIELD, %i3
        or      %i3, %o3, %i4
        sub     %i1, %i4, %i5
        brnz    %i5, test_failed
        nop

clear_per_tt63:
        setx    SOC_PER_REG, %l7, %i0
        stx     %g0, [%i0]
        nop
       	retry 
        nop


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

