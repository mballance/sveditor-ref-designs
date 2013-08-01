/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_tx_uev_INT.s
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

/* **************************************MAQ********************************************* */
#define FZC_PIO_BASE_ADDRESS_RANGE 	mpeval(NEPTUNE_BASE_ADDRESS + FZC_PIO_BASE_ADDRESS)
#define TX_ENT_MASK_NACK_PKT_RD		0xfffb
#define NACK_PKT_RD_MASK 		0x4
#define SMX_CFIG_DAT_Data 		0xc01003ff
#define SMX_CFIG_DAT_Addr		mpeval(FZC_PIO_ADDRESS_RANGE+0x00040)
#define SYS_ERR_MASK 			mpeval(FZC_PIO_ADDRESS_RANGE + 0x00090)
#define	SYS_ERR_MASK_Data		0x0	/* Enable all Errors*/
#define SYS_ERR_STAT 			mpeval(FZC_PIO_ADDRESS_RANGE+0x00098)
#define	TimeOut_count			0x30
#define PIO_IMASK0_BASE_ADDRESS_RANGE 	mpeval(NEPTUNE_BASE_ADDRESS + PIO_IMASK0_BASE_ADDRESS)
#define PIO_LDSV_BASE_ADDRESS  		0x800000 
#define PIO_LDSV_BASE_ADDRESS_RANGE 	mpeval(NEPTUNE_BASE_ADDRESS + PIO_LDSV_BASE_ADDRESS)
#define NIU_SID 			mpeval(FZC_PIO_BASE_ADDRESS_RANGE + 0x10200) 
#define	TX_ENT_MSK_STEP			0x200
/* **************************************MAQ********************************************* */
    
/* #define MAIN_PAGE_NUCLEUS_ALSO */ /* Access main in priviledge mode */
#define MAIN_PAGE_HV_ALSO

/* **************************************MAQ********************************************* */
#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
        call    FC_NIU_Timeout_Trap_Start; \
        nop; \
        retry; \
        nop;
/* **************************************MAQ********************************************* */

#include "err_defines.h"
#include "hboot.s"
#include "niu_defines.h"
#include "ncu_defines.h"   
#include "niu_macros.h"


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

/* **************************************MAQ********************************************* */
P_NIU_Tx_Ent_Mask:
        setx    TX_ENT_MSK, %g1, %l1
        setx    NIU_TxDmaNo, %g1, %l2
        mulx    %l2, TX_ENT_MSK_STEP, %l3
        add     %l3, %l1, %l3
        setx    TX_ENT_MASK_NACK_PKT_RD, %g1, %l4
        stxa    %l4, [%l3]ASI_PRIMARY_LITTLE
        nop

P_NIU_SMX_CFIG_DAT:
	setx	SMX_CFIG_DAT_Addr, %g1, %g2
	setx	SMX_CFIG_DAT_Data, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

P_NIU_SYS_ERR_MASK:
	setx	SYS_ERR_MASK, %g1, %g2
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop
	setx	SYS_ERR_MASK_Data, %g1, %g3
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

P_NIU_LDG_NUM:
	setx	LDG_NUM, %l1, %l2
	mov	mpeval(32 + NIU_TxDmaNo), %l3	!32 for Tx DMA0
	mulx	%l3, LDG_NUM_STEP, %l4
	add	%l2, %l4, %g2
	stxa    %l3, [%g2]ASI_PRIMARY_LITTLE
	nop

P_NIU_LD_IM0:
	setx	LD_IM0, %l1, %l2
	setx	LD_IM0_STEP, %l1, %l3
	mov	mpeval(32 + NIU_TxDmaNo), %l4
	mulx	%l3, %l4, %l4
	add	%l2, %l4, %g2
        stxa    %g0, [%g2]ASI_PRIMARY_LITTLE	! unmask flag0 and flag1 for DMA0
        nop
P_NIU_LDGITMRES:
	setx	LDGITMRES, %l1, %g2
	setx	0xff, %l1, %g3			!Res[19:0] = 0xff
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE    ! unmask flag0 and flag1 for DMA0
        nop
P_NIU_LDGIMGN:
        setx    LDGIMGN, %l1, %l2
        setx    LDGIMGN_STEP, %l1, %l3
	mov	mpeval(32 + NIU_TxDmaNo), %l4
        mulx    %l3, %l4, %l4
        add     %l2, %l4, %g2
	setx	0x8000000f, %l1, %g3		!{arm[31] = 1, timer[5:0] = f}
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE    ! unmask flag0 and flag1 for DMA0
        nop
P_NIU_SID:
	setx	NIU_SID, %l1, %l2                       
        mov     mpeval(32 + NIU_TxDmaNo), %l3
        mulx    %l3, SID_STEP, %l4
        add     %l2, %l4, %g2                           
	add	%l3, 64, %l3			! Setting Bit-6 = 1 always
        stxa    %l3, [%g2]ASI_PRIMARY_LITTLE            
        nop

Clear_All_Ints:
        rdpr    %pstate, %g7
        xor     %g7, 0x2, %g7           ! Reset interrupt enable
        wrpr    %g7, %pstate

P_NCU_INT_MAN:
	setx	INT_MAN, %l1, %l2
	mov	mpeval(64 + 32 + NIU_TxDmaNo), %l3
	mulx    %l3, 8, %l4
        add     %l2, %l4, %g2
	mov	mpeval(0x20 + NIU_TxDmaNo), %g3		!CPU[13:8] = 0 and Vector[5:0] = 0x20
        stx     %g3, [%g2]
        nop

HTrap_Int_En:
        rdpr    %pstate, %g7
        or      %g7, 0x2, %g7           ! Set interrupt enable
        wrpr    %g7, %pstate
/* **************************************MAQ********************************************* */



	/************************************
		RAS
	*************************************/
clear_esr_first:
        setx    SOC_ESR_REG, %l7, %i0
        stx     %g0, [%i0]


inj_err1:
        nop                     !$EV trig_pc_d(0,@VA(.MAIN.inj_err1)) ->IosErrInj(ERR_TYPE, 2800, 000345a800 )


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

/* **************************************MAQ********************************************* 
NACK_PKT_RD:
	setx    NIU_TxDmaNo,    %g1, %l1
	mulx    %l1, 0x200, %g5
	setx    TX_CS_Addr, %g1, %g2
	add     %g2, %g5, %g2
	mov	0x10, %l4
	setx	SYS_ERR_STAT, %g1, %l6
Loop_NACK_PKT_RD:
	brz	%l4, test_failed
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g3
	nop
	ldxa    [%l6]ASI_PRIMARY_LITTLE, %l7
	nop
	setx	NACK_PKT_RD_MASK, %g1, %l2
	and	%g3, %l2, %l3
	cmp	%l2, %l3
	bne	Loop_NACK_PKT_RD
	dec	%l4
 **************************************MAQ********************************************* */


NIUTx_Pkt_Cnt_Chk:
        setx    MAC_ID, %g1, %o0

#ifdef CE
	setx	0x10, %g1, %o1
#else
        setx    0x9, %g1, %o1			! one less
#endif

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

/* **************************************MAQ********************************************* */
	setx	TimeOut_count, %l1, %g4
	setx    TimeOut_Semaphore, %l1, %g5
  	setx    SYS_ERR_STAT, %l1, %l6
TimeOut_Sem_loop:
        ld      [%g5], %g7
        brnz    %g7, test_passed
        nop
        ldxa    [%l6]ASI_PRIMARY_LITTLE, %l1		! Read Error State Reg
        nop
        dec     %g4
        brnz    %g4, TimeOut_Sem_loop
        nop
	ba	test_failed
	nop
/* **************************************MAQ********************************************* */


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
  MAQ	Trap Handler for NIU interrupts
 ************************************************************************/
.global FC_NIU_Timeout_Trap_Start
FC_NIU_Timeout_Trap_Start:
P_CORE_ASI_INTR_RECEIVE:
	ldxa    [%g0]ASI_INTR_RECEIVE, %g6	! Read to see if bit-32 is set for Tx DMA0
	nop
P_CORE_ASI_INTR_R:
	ldxa    [%g0]ASI_INTR_R, %g6		! clear the High priority Interrupt.
	nop
P_NIU_TX_CS:
	setx	TX_CS, %l1, %l6
        ldxa    [%l6]ASI_PRIMARY_LITTLE, %l7
	and	%l7, 0x4, %l6
	cmp	%l6, 0x4
	bne	NACK_PKT_RD_FAILED
        nop

P_NIU_LDSV1:
	setx	LDSV1, %l1, %l2
        setx    LDSV1_STEP, %l1, %l3
	mov     mpeval(32 + NIU_TxDmaNo), %l4
        mulx    %l3, %l4, %l4
        add     %l2, %l4, %g2
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5	! read Logical Device State Vector 1(Tx DMA0 - Flag1)
	mov	1, %l3
	sllx	%l3, mpeval(32 + NIU_TxDmaNo), %l4
	cmp	%g5, %l4
	bne	NIU_LDSV1_ERROR
        nop     

	setx	TimeOut_Semaphore, %l1, %l2
	mov	0x1, %l3
	st	%l3, [%l2]
	membar	#Sync
	nop
	jmpl	%o7+0x8, %g0
	nop

NIU_LDSV1_ERROR:
	EXIT_BAD
	nop

NACK_PKT_RD_FAILED:
	EXIT_BAD
	nop
FC_NIU_Timeout_Trap_End:
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

.align  1024
.data
TimeOut_Semaphore:
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0


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


