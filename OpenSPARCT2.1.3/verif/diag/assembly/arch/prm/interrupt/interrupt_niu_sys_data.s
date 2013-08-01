/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_niu_sys_data.s
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

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
        call    my_trap_code; \
        nop; \
        retry; \
        nop;

    
#include "hboot.s"
#include "niu_defines.h"
#include "ncu_defines.h"
#include "niu_macros.h"



/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

/*      Initialize the NCU for the interrupt.   */

        ! Disable interrupts

no_intr:
        rdpr    %pstate, %g7
        xor     %g7, 0x2, %g7           ! Reset interrupt enable
        wrpr    %g7, %pstate

ncu_init:
        ! Initially set all the Interrupt Management Registers

        setx    INT_MAN, %g1, %g2       ! %g2 = INT_MAN reg. addr.
        setx    INT_MAN_COUNT, %g1, %g4 ! %g4 = INT_MAN reg. count value
	mov	%g0, %g5

niu_init_loop_top:
        stx     %g5, [%g2]
        add     %g2, INT_MAN_STEP, %g2
        stx     %g5, [%g2]
        add     %g2, INT_MAN_STEP, %g2
	add	%g5, 1, %g5		! increment the vector number
        add     %g4, -2, %g4
        cmp     %g4, 0
        bgt     niu_init_loop_top
	nop

/* Initialize the NIU for TX DMA interrupt. */

	NIU_TX_LD_IM0_INTR_ON_MARK( 0, %g1, %g2, %g3, %g4, 0, 0x40 )

        ! Enable interrupts

yes_intr:
        rdpr    %pstate, %g7
        or      %g7, 0x2, %g7           ! Set interrupt enable
        wrpr    %g7, %pstate

Init_flow:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig(MAC_ID, FRAME_TYPE, FRAME_CLASS,TX_PKT_LEN)

P_TxDMAActivate:
	setx	MAC_ID, %g1, %o0			! 1st Parameter
        setx    SetTxDMAActive_list, %g1, %o1           ! 2st parameter
        call    SetTxDMAActive
	nop						! $EV trig_pc_d(1, @VA(.MAIN.P_TxDMAActivate)) -> NIU_TxDMAActivate (MAC_ID, TxDmaActive_list)

P_AddTxChannels :
	nop						! $EV trig_pc_d(1, @VA(.MAIN.P_AddTxChannels)) -> NIU_AddTxChannels(MAC_ID, NIU_TxDmaNoUE)

	setx	LDGIMGN, %g1, %g2
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5		! Just for delay
	nop

P_SetTxMaxBurst :
	setx	NIU_TxDmaNo,	%g1, %o0		! 1st parameter : 
        setx  	SetTxMaxBurst_Data, %g1, %o1		! 2nd parameter
	call	SetTxMaxBurst
	nop						! $EV trig_pc_d(1, @VA(.MAIN.P_SetTxMaxBurst)) -> NIU_SetTxMaxBurst (MAC_ID, NIU_TxDmaNoUE, TxMaxBurst_Data)

	setx	LDGIMGN, %g1, %g2
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5		! Just for delay
	nop

P_InitTxDma:
	setx	NIU_TxDmaNo,	%g1, %o0		! 1st parameter : 
	nop						! $EV trig_pc_d(1, @VA(.MAIN.P_InitTxDma)) -> NIU_InitTxDma (MAC_ID, NIU_TxDmaNoUE, NIU_Xlate_On)
	call	InitTxDma
	nop	

	setx	LDGIMGN, %g1, %g2
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5		! Just for delay
	nop

Gen_Packet:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> TxPktGen(MAC_ID, NIU_TxDmaNoUE,NIU_TX_PKT_CNT,0,0)
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
        ldx     [%g2]                  , %g3    
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
	setx	LDGIMGN, %g1, %g2
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

	! Wait for the interrupt to occur.

	setx	0x400, %g1, %g4
	setx	user_data_start, %g1, %g5
delay_loop:
	
	ld	[%g5], %g7
	cmp	%g7, 1
	beq	intr_occured
	nop
	dec	%g4
	brnz	%g4, delay_loop
	nop
	ba	local_test_failed	! timeout waiting for interrupt
	nop

intr_occured:
	st	%g7, [%g3]		! undate old_intr_count

	! Check the packet count.

NIUTx_Pkt_Cnt_Chk:
	setx	MAC_ID, %g1, %o0
	setx	NIU_TX_PKT_CNT, %g1, %o1
	call	NiuTx_check_pkt_cnt
	nop
	
        setx    loop_count, %g1, %g4
	setx	LDGIMGN, %g1, %g2
delay_loop_end:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_end
        nop

	
test_passed:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.test_passed)) -> NIU_EXIT_chk(MAC_ID)
	EXIT_GOOD

local_test_failed:

	! Read related interrupt registers to aid debugging

read_1:
	ldxa	[%g0]ASI_INTR_RECEIVE, %i0
        ldxa    [%g0]ASI_SWVR_INTR_R, %i1
read_2:
        setx    INT_MAN, %g1, %g2
	ldx	[%g2], %i2
read_3:
	set	32, %g3			! index for logical device number
	setx	LDG_NUM_STEP, %g1, %g4
	mulx	%g4, %g3, %g3
	setx	LDG_NUM, %g1, %g2
	add	%g3, %g2, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i3
	setx	LDSV0, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i4
	setx	LDSV1, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i5
	setx	LDSV2, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i6
	set	32, %g3			! index for logical device number
	setx	LD_IM0_STEP, %g1, %g4
	mulx	%g4, %g3, %g3
	setx	LD_IM0, %g1, %g2
	add	%g3, %g2, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i7
	setx	LDGIMGN, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o1
	setx	LDGITMRES, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o2
	setx	SID, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o3
read_4:
	setx	TX_ENT_MSK, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o4
	setx	TX_CS, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o5
	setx	TDMC_INTR_DBG, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o6


	EXIT_BAD




/**********************************************************************
   Interrupt trap handler.
**********************************************************************/

.global my_trap_code

my_trap_code:

        setx    user_data_start, %l2, %l6

        ! Increment the count
Trap0:
        ld      [%l6], %l5
        add     %l5, 1, %l5
        st      %l5, [%l6]
        membar  #Sync

	! Check the expected vector number and clear the interrupt in the core.
Trap1:
	ldxa	[%g0]ASI_INTR_R, %l7
	cmp	%l7, 0x20
	bne	local_test_failed
	nop

	! The following order is important, if reversed a second
	! interrupt occurs on same condition.

        ! Re-enable the interrupt in the transmit DMA channel
Trap4:
        setx    TX_CS, %g1, %g2			! TX_CS, Tx DMA channel 0
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g1	! Reset MK
        nop

        ! Re-enable the interrupt in the NIU
Trap3:
        setx    LDGIMGN, %g1, %g2		! logical device group 0
        setx    0x80000001, %g1, %g3
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

        jmpl    %o7+0x8, %g0
        nop




/************************************************************************
   Test case data start
 ************************************************************************/

.align	1024
.data
user_data_start:
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
old_intr_count:	
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0

	
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
