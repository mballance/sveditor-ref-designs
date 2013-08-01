/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: FcNiuPeuRand_2.s
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
#define RCRSTAT_A_Addr		    mpeval(DMC_ADDRESS_RANGE+0x00050)
#define RBR_STAT_Addr               mpeval(DMC_ADDRESS_RANGE+0x00028)
#define ENABLE_PCIE_LINK_TRAINING
#define ENABLE_PCIE_MPS_512
#define MAIN_PAGE_HV_ALSO

#define MEM32_RD_ADDR              mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)
#define DMA_DATA_ADDR          0x0000000050000000

#define PEU_DEVICE_CNTRL_REG_ADDR  FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CTL_ADDR
#define PEU_DEVICE_CNTRL__MPS_128  0
#define PEU_DEVICE_CNTRL__MPS_256  0x20
#define PEU_DEVICE_CNTRL__MPS_512  0x40

#include "hboot.s"
#include "niu_defines.h"
#include "peu_defines.h"
.text
.global main
main:
        ta T_CHANGE_HPRIV
        nop
        ! enable bypass in IOMMU
        setx    FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
        setx    FIRE_DLC_MMU_CSR_A_CTL__BYPASS_EN, %g1, %g3
        stx     %g3, [%g2]
        ldx     [%g2], %g3
! branch to main by comparing thread id.

	ta      T_RD_THID
	mov	0x1, %g2

	setx	0x0000000000000001, %o0, %g3	! thread-group bits for the template
        cmp     %g2, %o1
        be      _FcN0_main
        nop

        setx    0x0000000000000010, %o0, %g3    ! thread-group bits for the template
        brz     %o1, _FcN1_main
        mov     0x2, %g2
        cmp     %g2, %o1
        be      _FcN2_main
        nop
# 116 "diag.j.pp"
!
! Thread 0 Start
!
!
_FcN0_main:

P_NIU_RxInitDma:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxInitDma)) -> NIU_InitRxDma(a, RX_DESC_RING_LENGTH, RX_COMPL_RING_LEN, RBR_CONFIG_B_DATA, RX_INITIAL_KICK, NIU_Xlate_On)
        setx    NIU_PKTGEN_CSR_EV2A_RBR_KICK, %g7, %g2
delay_loop_Rx:
        ldx     [%g2], %g5
        cmp	%g5, RX_INITIAL_KICK
        bne	delay_loop_Rx
        nop

	setx    0xa, %g1, %o0
	setx    RX_DESC_RING_LENGTH, %g1, %o1
	setx    RX_COMPL_RING_LEN, %g1, %o2
	setx    RBR_CONFIG_B_DATA, %g1, %o3
	setx    RX_INITIAL_KICK, %g1, %o4
	call    NiuInitRxDma
	nop
P_NIU_RxPkt_Conf:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxPkt_Conf)) -> NIU_RxPktConf(RXMAC_PKTCNT)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop
        setx    RXMAC_PKTCNT, %g1, %g6
        mulx    %o0, 0x200, %g5
        setx    RBR_STAT_Addr, %g7, %g2
        add     %g2, %g5, %g2
P_NIU_Rx_GenPkt:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
        brz     %g5, P_NIU_Rx_GenPkt
        nop
        cmp     %g5, %o4
        be      P_NIU_Rx_GenPkt
        nop

Rx_pktcnt_loop:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Rx_pktcnt_loop)) -> NIU_RxGenPkt(MAC_ID, a, RXMAC_PKTCNT, 0xc8, 0x0, RX_NIU_MULTI_DMA, 1)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

        mulx	%o0, 0x200, %g5
        setx	RCRSTAT_A_Addr, %g7, %g2
	add	%g2, %g5, %g2
delay_loop:
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	cmp	%g5, RXMAC_PKTCNT - RXMAC_PKTCNT%8
	bne	delay_loop
        nop


test_passed:
	nop
        EXIT_GOOD
# 188 "diag.j.pp"

_FcN1_main:

Init_flow:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig(MAC_ID, FRAME_TYPE, FRAME_CLASS, 5dc)

P_TxDMAActivate:
	setx    MAC_ID, %g1, %o0
	setx    0x1, %g1, %o1
	call    SetTxDMAActive
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_TxDMAActivate)) -> NIU_TxDMAActivate (MAC_ID, 1)
        setx    XMAC0_MAX_addr, %g7, %g2
 

P_AddTxChannels:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_AddTxChannels)) -> NIU_AddTxChannels(MAC_ID, 0)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

P_SetTxMaxBurst:
	setx    0x0, %g1, %o0
	setx    SetTxMaxBurst_Data, %g1, %o1
	call    SetTxMaxBurst
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_SetTxMaxBurst)) -> NIU_SetTxMaxBurst (MAC_ID, 0, TxMaxBurst_Data)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

P_InitTxDma:
	setx    0x0, %g1, %o0
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_InitTxDma)) -> NIU_InitTxDma (MAC_ID, 0, NIU_Xlate_On)
	call    InitTxDma
	nop
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

Gen_Packet:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> TxPktGen(MAC_ID, 0, 0x86,0,0)
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
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick)) -> NIU_SetTxRingKick(MAC_ID, 0)
	setx    0x0,    %g1, %o0
	ldx     [%g2], %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs:
	setx    0x0, %g1, %o0
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


NIUTx_Pkt_Cnt_Chk:
	setx    MAC_ID, %g1, %o0
	setx    0x86, %g1, %o1
	call    NiuTx_check_pkt_cnt
	nop

        setx    loop_count, %g1, %g4
delay_loop_end:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        dec     %g4
        brnz    %g4, delay_loop_end
        nop

test_passed_tx:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.test_passed_tx)) -> NIU_EXIT_chk(MAC_ID)
        EXIT_GOOD


_FcN2_main:
	setx	RX_INITIAL_KICK, %g1, %o4
	setx	0xa, %g1, %o0
	mulx	%o0, 0x200, %g5
	setx	RBR_STAT_Addr, %g7, %g2
	add	%g2, %g5, %g2
wt_for_niu:
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g5
	brz	%g5, wt_for_niu
	nop
	cmp	%g5, %o4
	be	wt_for_niu
	nop
!Initializing integer registers
	setx 0xffffffff0000003f, %r30, %r28
	ldx [%r31+0], %r0
	andn %r0, %r28, %r0
	ldx [%r31+8], %r1
	andn %r1, %r28, %r1
	ldx [%r31+16], %r2
	andn %r2, %r28, %r2
	ldx [%r31+24], %r3
	andn %r3, %r28, %r3
	ldx [%r31+32], %r4
	andn %r4, %r28, %r4
	ldx [%r31+40], %r5
	andn %r5, %r28, %r5
	ldx [%r31+48], %r6
	andn %r6, %r28, %r6
	ldx [%r31+56], %r7
	andn %r7, %r28, %r7
	ldx [%r31+64], %r8
	andn %r8, %r28, %r8
	ldx [%r31+72], %r9
	andn %r9, %r28, %r9
	ldx [%r31+80], %r10
	andn %r10, %r28, %r10
	ldx [%r31+88], %r11
	andn %r11, %r28, %r11
	ldx [%r31+96], %r12
	andn %r12, %r28, %r12
	ldx [%r31+104], %r13
	andn %r13, %r28, %r13
	save %r31, %r0, %r31
	restore

_DMAWr_t_DMA_store_exword_0: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]

_DMAWr_t_DMA_store_exword_1: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd0708004  ! 2: STX_R	stx	%r8, [%r2 + %r4]

_DMAWr_t_DMA_write_0: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_0)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_2: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_write_1: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_1)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_3: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_4: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd070c004  ! 8: STX_R	stx	%r8, [%r3 + %r4]

_DMAWr_t_DMA_write_2: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_2)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_5: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_6: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd4588007  ! 12: LDX_R	ldx	[%r2 + %r7], %r10

_DMAWr_t_DMA_write_3: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_3)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_7: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_8: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd0280005  ! 16: STB_R	stb	%r8, [%r0 + %r5]

_DMAWr_t_DMA_store_exword_9: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd058c005  ! 18: LDX_R	ldx	[%r3 + %r5], %r8

_DMAWr_t_DMA_write_4: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_4)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_10: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_11: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd4580005  ! 22: LDX_R	ldx	[%r0 + %r5], %r10

_DMAWr_t_DMA_store_exword_12: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd6580007  ! 24: LDX_R	ldx	[%r0 + %r7], %r11

_DMAWr_t_DMA_store_exword_13: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd2708007  ! 26: STX_R	stx	%r9, [%r2 + %r7]

_DMAWr_t_DMA_store_exword_14: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd6400004  ! 28: LDSW_R	ldsw	[%r0 + %r4], %r11

_DMAWr_t_DMA_write_5: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_5)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_15: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_write_6: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_6)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_16: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_write_7: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_7)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_17: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_write_8: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_8)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_18: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_19: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd2308005  ! 38: STH_R	sth	%r9, [%r2 + %r5]

_DMAWr_t_DMA_write_9: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_9)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_20: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_21: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd6704005  ! 42: STX_R	stx	%r11, [%r1 + %r5]

_DMAWr_t_DMA_write_10: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_10)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_22: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_write_11: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_11)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_23: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_write_12: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_12)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_24: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_write_13: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_13)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_25: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_26: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd2300006  ! 52: STH_R	sth	%r9, [%r0 + %r6]

_DMAWr_t_DMA_store_exword_27: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd4700007  ! 54: STX_R	stx	%r10, [%r0 + %r7]

_DMAWr_t_DMA_write_14: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_14)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_28: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_29: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd2200005  ! 58: STW_R	stw	%r9, [%r0 + %r5]

_DMAWr_t_DMA_write_15: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_15)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_30: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_31: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd6588005  ! 62: LDX_R	ldx	[%r2 + %r5], %r11

_DMAWr_t_DMA_store_exword_32: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd6404004  ! 64: LDSW_R	ldsw	[%r1 + %r4], %r11

_DMAWr_t_DMA_write_16: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_16)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_33: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_write_17: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_17)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_34: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_write_18: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_18)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_35: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_36: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd0288006  ! 72: STB_R	stb	%r8, [%r2 + %r6]

_DMAWr_t_DMA_write_19: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_19)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_37: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_38: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd4580007  ! 76: LDX_R	ldx	[%r0 + %r7], %r10

_DMAWr_t_DMA_store_exword_39: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd640c005  ! 78: LDSW_R	ldsw	[%r3 + %r5], %r11

_DMAWr_t_DMA_store_exword_40: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd0300006  ! 80: STH_R	sth	%r8, [%r0 + %r6]

_DMAWr_t_DMA_write_20: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_20)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_41: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_42: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd2584004  ! 84: LDX_R	ldx	[%r1 + %r4], %r9

_DMAWr_t_DMA_store_exword_43: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd0400007  ! 86: LDSW_R	ldsw	[%r0 + %r7], %r8

_DMAWr_t_DMA_write_21: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_21)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_44: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_45: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd6400005  ! 90: LDSW_R	ldsw	[%r0 + %r5], %r11

_DMAWr_t_DMA_write_22: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_22)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_46: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_47: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd0208004  ! 94: STW_R	stw	%r8, [%r2 + %r4]

_DMAWr_t_DMA_write_23: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_23)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_48: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_write_24: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_24)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_49: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_50: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd2400006  ! 100: LDSW_R	ldsw	[%r0 + %r6], %r9

_DMAWr_t_DMA_write_25: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_25)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_51: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_write_26: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_26)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_52: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_53: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd4300005  ! 106: STH_R	sth	%r10, [%r0 + %r5]

_DMAWr_t_DMA_write_27: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_27)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_54: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_55: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd220c007  ! 110: STW_R	stw	%r9, [%r3 + %r7]

_DMAWr_t_DMA_store_exword_56: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd2400007  ! 112: LDSW_R	ldsw	[%r0 + %r7], %r9

_DMAWr_t_DMA_write_28: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_28)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_57: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_store_exword_58: .word 0xf871c019  ! STX_R  stx  %r28, [%r7 + %r25]
	.word 0xd2588007  ! 116: LDX_R	ldx	[%r2 + %r7], %r9

_DMAWr_t_DMA_write_29: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_29)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_59: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 

_DMAWr_t_DMA_write_30: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMAWr_t_DMA_write_30)) -> EnablePCIeIgCmd("DMAWR", fffc000000000000,fffc000050000000, "64'h1ff", 1)

_DMAWr_t_DMA_store_partial_60: .word 0xfc2a001b  !STB_R stb %r30,[%r8+%r27] 
        nop
        nop

        ! select a MEM32 address in PCI address range and transmit the command to NCU

        setx    MEM32_RD_ADDR, %g1, %g2
        setx    0x080, %g1, %g4         ! loop 128 times

delay_loop_pcie:
        stx     %g2, [%g2]              ! MEM32 PIO Write
        ldx     [%g2], %l0              ! MEM32 PIO READ
        add     %g2, 8, %g2             ! increment PIO  address

        dec     %g4                     ! decrement counter
        brnz    %g4, delay_loop_pcie         ! loop if not zero
        nop


pcie_test_passed:
        EXIT_GOOD

pcie_test_failed:
        EXIT_BAD

SECTION descriptor  data_va=DMA_DATA_ADDR
attr_data {     
      Name = descriptor,
      hypervisor,
      compressimage
}

.data
.global PCIAddr9

	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff


#if 0
#endif

