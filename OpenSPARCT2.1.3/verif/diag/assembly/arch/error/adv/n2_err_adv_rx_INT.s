/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_rx_INT.s
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
#define H_HT0_Sw_Recoverable_Error_0x40	 My_Recoverable_Sw_error_trap
/* **************************************MAQ********************************************* */
#define FZC_PIO_BASE_ADDRESS_RANGE      mpeval(NEPTUNE_BASE_ADDRESS + FZC_PIO_BASE_ADDRESS)
#define SMX_CFIG_DAT_Data               0xc01001ff
#define SMX_CFIG_DAT_Addr               mpeval(FZC_PIO_ADDRESS_RANGE+0x00040)
#define SYS_ERR_MASK                    mpeval(FZC_PIO_ADDRESS_RANGE + 0x00090)
#define SYS_ERR_MASK_Data               0x0     /* Enable all Errors*/
#define SYS_ERR_STAT                    mpeval(FZC_PIO_ADDRESS_RANGE+0x00098)
#define TimeOut_count                   0x40
#define PIO_IMASK0_BASE_ADDRESS_RANGE   mpeval(NEPTUNE_BASE_ADDRESS + PIO_IMASK0_BASE_ADDRESS)
#define PIO_LDSV_BASE_ADDRESS           0x800000 
#define PIO_LDSV_BASE_ADDRESS_RANGE     mpeval(NEPTUNE_BASE_ADDRESS + PIO_LDSV_BASE_ADDRESS)
#define NIU_SID                         mpeval(FZC_PIO_BASE_ADDRESS_RANGE + 0x10200)
#define RX_DMA_CK_DIV             	mpeval(FZC_DMC_ADDRESS_RANGE + 0x00000)
#define RX_DMA_CK_DIV_CNT		0xff			/* System Clock divider granularity */
#define RCRCFIG_B              		mpeval(DMC_ADDRESS_RANGE+0x00048)
#define	RCRCFIG_B_ENTOUT_TIMEOUT	0x8002	/* [5:0] = 2 */
#define	RCRCFIG_B_TIMEOUT_MASK		0xfffffffffffffffc
#define RX_DMA_ENT_MSK			mpeval(DMC_ADDRESS_RANGE + 0x00068)
#define	RX_DMA_ENT_MSK_STEP		0x200
#define RX_DMA_ENT_MSK_Data		0x0	/* Enable all Errors */
#define	RDMC_PRE_PAR_ERR		mpeval(FZC_DMC_ADDRESS_RANGE + 0x00078)
#define RX_DMA_CTL_STAT_MEX		0x800000000000

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


#include "hboot.s"
#include "niu_defines.h"
#include "ncu_defines.h"   
#include "niu_macros.h"

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global	 My_Corrected_ECC_error_trap
.global	 My_Recoverable_Sw_error_trap

main:
        ta T_CHANGE_HPRIV
        nop

!#include "niu_init.h"
!
! Thread 0 Start
!
!
!thread_0:
	nop

	/************************************
		RAS
	*************************************/
clear_esr_first:
	setx	SOC_ESR_REG, %l7, %i0
	stx	%g0, [%i0]

inj_err1:
        nop			!$EV trig_pc_d(0,@VA(.MAIN.inj_err1)) ->IosErrInj(ERR_TYPE, ERR_TAG, ERR_ADDR)


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

	/*************************************/



/************************************************************************
   First call the Vera, so that values are updated in Memory and
   then read those values from assembly and program the registers
 ************************************************************************/
P_NIU_RxInitDma:
	nop		!$EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxInitDma)) -> NIU_InitRxDma(RXDMA_CHNL, RX_DESC_RING_LENGTH, RX_COMPL_RING_LEN, RBR_CONFIG_B_DATA, RX_INITIAL_KICK, NIU_Xlate_On)

        setx    0x5, %g1, %g4			! Delay for Vera to complete
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
	setx	RXDMA_CHNL, %g1, %o0
	setx	RX_DESC_RING_LENGTH, %g1, %o1
	setx	RX_COMPL_RING_LEN, %g1, %o2
	setx	RBR_CONFIG_B_DATA, %g1, %o3
	setx	RX_INITIAL_KICK, %g1, %o4
	call	NiuInitRxDma
	nop

/* **************************************MAQ********************************************* */
P_NIU_SMX_CFIG_DAT:
        setx    SMX_CFIG_DAT_Addr, %g1, %g2
        setx    SMX_CFIG_DAT_Data, %g1, %g3
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

P_NIU_SYS_ERR_MASK:
        setx    SYS_ERR_MASK, %g1, %g2
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        setx    SYS_ERR_MASK_Data, %g1, %g3
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

P_NIU_LDG_NUM:
        setx    LDG_NUM, %l1, %l2
        mov     RXDMA_CHNL, %l3   
        mulx    %l3, LDG_NUM_STEP, %l4
        add     %l2, %l4, %g2
        stxa    %l3, [%g2]ASI_PRIMARY_LITTLE
        nop

P_NIU_LD_IM0:
        setx    LD_IM0, %l1, %l2
        setx    LD_IM0_STEP, %l1, %l3
        mov     RXDMA_CHNL, %l4
        mulx    %l3, %l4, %l4
        add     %l2, %l4, %g2
        stxa    %g0, [%g2]ASI_PRIMARY_LITTLE    ! unmask flag0 and flag1 for DMA0
        nop
P_NIU_LDGITMRES:
        setx    LDGITMRES, %l1, %g2
        setx    0xff, %l1, %g3                  !Res[19:0] = 0xff
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE    ! unmask flag0 and flag1 for DMA0
        nop
P_NIU_LDGIMGN:
        setx    LDGIMGN, %l1, %l2
        setx    LDGIMGN_STEP, %l1, %l3
        mov     RXDMA_CHNL, %l4
        mulx    %l3, %l4, %l4
        add     %l2, %l4, %g2
        setx    0x8000000f, %l1, %g3            !{arm[31] = 1, timer[5:0] = f}
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE    ! unmask flag0 and flag1 for DMA0
        nop
P_NIU_SID:
        setx    NIU_SID, %l1, %l2
        mov     RXDMA_CHNL, %l3
        mulx    %l3, SID_STEP, %l4
        add     %l2, %l4, %g2    
        add     %l3, 64, %l3                    ! Setting Bit-6 = 1 always
        stxa    %l3, [%g2]ASI_PRIMARY_LITTLE
        nop     
P_NIU_RX_DMA_CK_DIV:
	setx	RX_DMA_CK_DIV, %l1, %l2
	setx	RX_DMA_CK_DIV_CNT, %l1, %l3
	stxa	%l3, [%l2]ASI_PRIMARY_LITTLE
	nop
P_NIU_RCRCFIG_B:
	setx    RCRCFIG_B, %l1, %l2
        setx    RCRCFIG_B_ENTOUT_TIMEOUT, %l1, %l3
	setx	RCRCFIG_B_TIMEOUT_MASK, %l1, %l5
	ldxa	[%l2]ASI_PRIMARY_LITTLE, %l4
	and	%l4, %l5, %l4
	or	%l4, %l3, %l3
        stxa    %l3, [%l2]ASI_PRIMARY_LITTLE
        nop
P_RX_DMA_ENT_MSK:
	setx	RX_DMA_ENT_MSK, %l1, %l2
	setx	RX_DMA_ENT_MSK_Data, %l1, %l3
	mov	RXDMA_CHNL, %l5
	setx	RX_DMA_ENT_MSK_STEP, %l1, %l4
	mulx	%l5, %l4, %l4
	add	%l2, %l4, %l2
	stxa    %l3, [%l2]ASI_PRIMARY_LITTLE
        nop
P_NIU_RX_DMA_CTL_STAT_MEX:
        setx    RX_DMA_CTL_STAT, %l1, %l2
        setx    RX_DMA_CTL_STAT_STEP, %l1, %l3
        mov     RXDMA_CHNL, %l4
        mulx    %l3, %l4, %l4
        add     %l2, %l4, %l2
	setx	RX_DMA_CTL_STAT_MEX, %l1, %l3
        stxa    %l3, [%l2]ASI_PRIMARY_LITTLE
        nop

        
Clear_All_Ints:
        rdpr    %pstate, %g7
        xor     %g7, 0x2, %g7           ! Reset interrupt enable
        wrpr    %g7, %pstate 
        
P_NCU_INT_MAN:  
        setx    INT_MAN, %l1, %l2
        mov     mpeval(64 + RXDMA_CHNL), %l3
        mulx    %l3, 8, %l4
        add     %l2, %l4, %g2
        mov     RXDMA_CHNL, %g3         !CPU[13:8] = 0 and Vector[5:0] = 0x20
        stx     %g3, [%g2] 
        nop
        
HTrap_Int_En:
        rdpr    %pstate, %g7
        or      %g7, 0x2, %g7           ! Set interrupt enable
        wrpr    %g7, %pstate
/* **************************************MAQ********************************************* */

P_NIU_RxPkt_Conf:
	nop		!$EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxPkt_Conf)) -> NIU_RxPktConf(RXMAC_PKTCNT, MAC_ID)
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g5	! Just for Delay
	nop


P_NIU_Rx_GenPkt:
	setx	RXMAC_PKTCNT, %g1, %g6		! Packet count
	nop
Rx_pktcnt_loop:
	nop		!$EV trig_pc_d(1, @VA(.MAIN.Rx_pktcnt_loop)) -> NIU_RxGenPkt(MAC_ID, RXDMA_CHNL, 1, MAC_PKT_LEN, 0x0, RX_NIU_MULTI_DMA, 1)
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g5	! just for delay
	nop
	dec	%g6
	brnz	%g6, Rx_pktcnt_loop
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


	/************************************
		RAS
	*************************************/
esr:
	setx	SOC_ESR_REG, %g7, %g5
	 setx	0x100, %g7, %g6

	setx	0x8000000000000000, %g7, %g1	!valid bit
	set	0x1, %g2
	sllx	%g2, ERR_FIELD, %g3
	or	%g3, %g1, %g2
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

/* **************************************MAQ********************************************* */
        setx    TimeOut_count, %l1, %g4
        setx    TimeOut_Semaphore, %l1, %g5
        setx    SYS_ERR_STAT, %l1, %l6
TimeOut_Sem_loop:
        ld      [%g5], %g7
        brnz    %g7, test_passed
        nop
        ldxa    [%l6]ASI_PRIMARY_LITTLE, %l1            ! Read Error State Reg
        nop
        dec     %g4
        brnz    %g4, TimeOut_Sem_loop
        nop
        ba      test_failed
        nop
/* **************************************MAQ********************************************* */

	
test_passed:
	nop			
	EXIT_GOOD

!.global test_failed
test_failed:
	EXIT_BAD

/************************************************************************
  MAQ   Trap Handler for NIU interrupts
 ************************************************************************/
.global FC_NIU_Timeout_Trap_Start
FC_NIU_Timeout_Trap_Start:
P_CORE_ASI_INTR_RECEIVE:
        ldxa    [%g0]ASI_INTR_RECEIVE, %g6      ! Read to see if bit-32 is set for Tx DMA0
        nop
P_CORE_ASI_INTR_R:
        ldxa    [%g0]ASI_INTR_R, %g6            ! clear the High priority Interrupt.
        nop

P_NIU_SYS_ERR_STAT:
        setx    SYS_ERR_STAT, %g1, %l6
        ldxa    [%l6]ASI_PRIMARY_LITTLE, %l7
        nop
P_NIU_RX_DMA_CTL_STAT:
	setx	RX_DMA_CTL_STAT, %l1, %l2
	setx	RX_DMA_CTL_STAT_STEP, %l1, %l3
	mov     RXDMA_CHNL, %l4
        mulx    %l3, %l4, %l4
        add     %l2, %l4, %l2
        ldxa    [%l2]ASI_PRIMARY_LITTLE, %g5
        nop
P_NIU_RDMC_PRE_PAR_ERR:
	setx    RDMC_PRE_PAR_ERR, %l1, %l2
        ldxa    [%l2]ASI_PRIMARY_LITTLE, %g5    
        nop


P_NIU_LDSV0:
        setx    LDSV0, %l1, %l2
        setx    LDSV0_STEP, %l1, %l3
        mov     RXDMA_CHNL, %l4
        mulx    %l3, %l4, %l4
        add     %l2, %l4, %g2
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5    ! read Logical Device State Vector 0(Tx DMA0 - Flag0)
        nop
P_NIU_LDSV1:
        setx    LDSV1, %l1, %l2
        setx    LDSV1_STEP, %l1, %l3
        mov     RXDMA_CHNL, %l4
        mulx    %l3, %l4, %l4
        add     %l2, %l4, %g2
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5    ! read Logical Device State Vector 1(Tx DMA0 - Flag1)
        nop

        setx    TimeOut_Semaphore, %l1, %l2
        mov     0x1, %l3
        st      %l3, [%l2]
        membar  #Sync
        nop
        jmpl    %o7+0x8, %g0
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
	setx	0xb300000000000000, %l0, %g3
	subcc	%g2, %g3, %g4
	brnz	%g4, test_failed
	nop

check_per_tt40:
	setx	SOC_PER_REG, %l7, %i0
	ldx	[%i0], %i1
	setx	0x8000000000000000, %l7, %o3	!valid bit
	set	0x1, %i2
	sllx	%i2, ERR_FIELD, %i3
	or	%i3, %o3, %i4
	sub	%i1, %i4, %i5
	brnz	%i5, test_failed
	nop

clear_per_tt40:
	setx	SOC_PER_REG, %l7, %i0
	stx	%g0, [%i0]
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
	setx	0x8b00000000000000, %l0, %g3
	subcc	%g2, %g3, %g4
	brnz	%g4, test_failed

check_per_tt63:
	setx	SOC_PER_REG, %l7, %i0
	ldx	[%i0], %i1
	setx	0x8000000000000000, %l7, %o3	!valid bit
	set	0x1, %i2
	sllx	%i2, ERR_FIELD, %i3
	or	%i3, %o3, %i4
	sub	%i1, %i4, %i5
	brnz	%i5, test_failed
	nop

clear_per_tt63:
	setx	SOC_PER_REG, %l7, %i0
	stx	%g0, [%i0]
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
