/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_tx_memerr.s
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


#define  DRAM_ERR_STAT_REG              0x8400000280
#define  L2_ERR_STAT_REG                0xAB00000000
#define  DRAM_ERR_INJ_REG       	0x8400000290

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



Gen_Packet:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> TxPktGen(MAC_ID, NIU_TxDmaNoUE,NIU_TX_PKT_CNT, 0, 0)
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


	/************************************
		RAS
	*************************************/
clear_esr_first:
	setx	SOC_ESR_REG, %l7, %i0
	stx	%g0, [%i0]

disable_l1:
	ldxa  [%g0] ASI_LSU_CONTROL, %l0
	! Remove the lower 2 bits (I-Cache and D-Cache enables)
	andn  %l0, 0x3, %l0
	stxa  %l0, [%g0] ASI_LSU_CONTROL

set_DRAM_error_inject_ch0:
	mov   0x606, %l1		! ECC Mask (2-bit error)
	mov   0x1, %l2
	sllx  %l2, DRAM_EI_SSHOT, %l3
	Or    %l1, %l3, %l1		! Set single shot ;
	mov   0x1, %l2
	sllx  %l2, DRAM_EI_ENB, %l3
	or    %l1, %l3, %l1		! Enable error injection for the next write
	setx  DRAM_ERR_INJ_REG, %l3, %g6
	stx   %l1, [%g6]
	membar 0x40


set_L2_Directly_Mapped_Mode:
	setx  L2CS_PA0, %l6, %g1
	mov   0x2, %l0
	stx   %l0, [%g1]

store_to_L2_way0:
	setx  0xaaaaaaaaaaaaaaaa, %l0, %g5
	setx  0x3456000, %l0, %g2  ! bits [21:18] select way
	stx %g5, [%g2]
	membar #Sync


	! Storing to same L2 way but different tag,this will write to mcu
write_mcu_channel_0:
	setx  0x1456000, %l0, %g3 ! bits [21:18] select way
	stx %g5, [%g3]
	membar #Sync


L2_err_enable:
	set	0x3, %l1
	mov	0xaa, %g2
	sllx	%g2, 32, %g2
	stx	%l1, [%g2]
	stx	%l1, [%g2 + 0x40]
	stx	%l1, [%g2 + 0x80]
	stx	%l1, [%g2 + 0xc0]
	stx	%l1, [%g2 + 0x100]
	stx	%l1, [%g2 + 0x140]
	stx	%l1, [%g2 + 0x180]
	stx	%l1, [%g2 + 0x1c0]

eie_reg_ones_rdd:
	setx	SOC_EIE_REG, %g3, %g2
	setx	0xffffffffffffffff, %g3, %g1
	stx	%g1, [%g2]
	membar	0x40

	/*************************************/

SetTxRingKick:
        setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2		! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick)) -> NIU_SetTxRingKick(MAC_ID, NIU_TxDmaNoUE)
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

/*

NIUTx_Pkt_Cnt_Chk:
        setx    MAC_ID, %g1, %o0
        setx    0x9, %g1, %o1			! one less
        call    NiuTx_check_pkt_cnt
        nop
*/

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

read_mcu_l2_esr:
        setx  DRAM_ERR_STAT_REG, %g7, %g6  
        ldx   [%g6], %g3

        setx    L2_ERR_STAT_REG, %g7, %g1  
        ldx     [%g1], %g6

cause_trap:
        setx    0x2000ab00, %g3, %g1
        stx     %g0, [%g1]
        setx    0x800bb00, %g3, %g1
        ldx     [%g1], %g2

        setx    0x8300bb00, %g3, %g1
        setx    0x2222222222222222, %g3, %g2
        stx     %g2, [%g1]
        setx     0x6300bb00, %g3, %g1
        ldx     [%g1], %g2

        set     0x1, %g1
        setx    0x50, %g7, %g6
err_trap_loop:
        cmp     %g6, %g0
        be      %xcc, test_failed
        nop

        cmp     %g1, %i7
        be      %xcc, test_passed 
        nop

        ba      err_trap_loop
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
        inc     %i7

check_desr_NcuTrap_tt40:
        ldxa  [%g0]0x4c, %g2
        nop

        setx    0xb300000000000000, %l0, %g3
        subcc   %g2, %g3, %g4
        brnz    %g4, l2_trap
        nop

check_ncutrap_tt40:
        ba    	esr_check 
        nop


l2_trap:
        nop

check_desr_L2Trap_tt40:
        setx    0xb000000000000000, %l0, %g3
        subcc   %g2, %g3, %g4
        brnz    %g4, both_l2_soc 
        nop

both_l2_soc:
	setx	0xf300000000000000, %l0, %g3
	subcc	%g2, %g3, %g4
	brnz    %g4, test_failed 
	nop

check_mcu0_esr_L2Trap_tt40:
        mov     0x1, %g1
        sllx    %g1, DRAM_ES_DAU, %g2

        setx  DRAM_ERR_STAT_REG, %g7, %g6  
        ldx   [%g6], %g3

        setx  0xffffffffffff0000, %g7, %g1
        andcc %g1, %g3, %g4                   ! Donot check SYND bits

        sub     %g2, %g4, %g1
        brnz    %g1, test_failed
        nop

clear_mcu_esr_L2Trap_tt40:
        stx     %g0, [%g6]


check_L2_4_ESR_L2Trap_tt40:
        setx    L2_ERR_STAT_REG, %g7, %g1  
        ldx     [%g1], %g6

        setx    0xfffffffff0000000, %g7, %g1
        andcc   %g6, %g1, %g2                   ! Donot check L2ESR SYND bits

        mov     0x1, %g1
        sllx    %g1, L2ES_DRU, %g3

        mov     0x1, %g1
        sllx    %g1, L2ES_VEU, %g4

        or      %g3, %g4, %g5

        mov     0x1, %g1
        sllx    %g1, L2ES_MEU, %g3

        or      %g5, %g3, %g4

        cmp     %g2, %g4
        bne     %xcc, test_failed
        nop

	/* With SIU design change, now SIO will flag parity error to NIU*/
esr_check:
        setx	SOC_PER_REG, %g7, %g5
	ldx	[%g5], %g4

        mov     0x1, %g1
        sllx    %g1, NiuDataParity, %g2
	setx    0x8000000000000000, %g7, %g1
	or	%g1, %g2, %g3

	cmp	%g3, %g4
	bne	%xcc, test_failed
	nop


clear_l2_esr_L2Trap_tt40:
        setx    L2_ERR_STAT_REG, %g7, %g1  
        stx     %g0, [%g1]

trap_done_tt40:
        done 
        nop



My_Corrected_ECC_error_trap:
        ba      test_failed
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

