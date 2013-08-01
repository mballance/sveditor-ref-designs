/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: FcNiuPeuRdRand_4.s
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
        be      _FcN1_main
        nop

        setx    0x0000000000000010, %o0, %g3    ! thread-group bits for the template
        brz     %o1, _FcN0_main
        mov     0x2, %g2
        cmp     %g2, %o1
        be      _FcN2_main
        nop
# 87 "diag.j.pp"
!
! Thread 0 Start
!
!
_FcN0_main:

Init_flow:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig(MAC_ID, FRAME_TYPE, FRAME_CLASS, 5dc)

P_TxDMAActivate:
	setx    MAC_ID, %g1, %o0
	setx    0x8000, %g1, %o1
	call    SetTxDMAActive
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_TxDMAActivate)) -> NIU_TxDMAActivate (MAC_ID, 8000)
        setx    XMAC0_MAX_addr, %g7, %g2
 

P_AddTxChannels:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_AddTxChannels)) -> NIU_AddTxChannels(MAC_ID, f)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

P_SetTxMaxBurst:
	setx    0xf, %g1, %o0
	setx    SetTxMaxBurst_Data, %g1, %o1
	call    SetTxMaxBurst
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_SetTxMaxBurst)) -> NIU_SetTxMaxBurst (MAC_ID, f, TxMaxBurst_Data)
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

P_InitTxDma:
	setx    0xf, %g1, %o0
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_InitTxDma)) -> NIU_InitTxDma (MAC_ID, f, NIU_Xlate_On)
	call    InitTxDma
	nop
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5
	nop

Gen_Packet:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> TxPktGen(MAC_ID, f, 0x95,0,0)
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
	setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2	 ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick)) -> NIU_SetTxRingKick(MAC_ID, f)
	setx    0xf,    %g1, %o0
	ldx     [%g2], %g3
	nop
	mulx     %o0, 0x200, %g5
	setx    TX_RING_KICK_Addr, %g1, %g2
	add     %g2, %g5, %g2
	stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
	nop

SetTxCs:
	setx    0xf, %g1, %o0
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
	setx    0x95, %g1, %o1
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

test_passed_tx:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.test_passed_tx)) -> NIU_EXIT_chk(MAC_ID)
        EXIT_GOOD


_FcN1_main:

P_NIU_RxInitDma:
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.P_NIU_RxInitDma)) -> NIU_InitRxDma(a, RX_DESC_RING_LENGTH, RX_COMPL_RING_LEN, RBR_CONFIG_B_DATA, RX_INITIAL_KICK, NIU_Xlate_On)
        setx    NIU_PKTGEN_CSR_EV2A_RBR_KICK, %g7, %g2
delay_loop_Rx:
        ldx    [%g2], %g5
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
	nop	 ! $EV trig_pc_d(1, @VA(.MAIN.Rx_pktcnt_loop)) -> NIU_RxGenPkt(MAC_ID, a, RXMAC_PKTCNT, 0x1f4, 0x0, RX_NIU_MULTI_DMA, 1)
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
# 276 "diag.j.pp"

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

_DMARd_t_ldst_0: nop
! start

_DMARd_t_DMA_read_0: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_0)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 19b, 1)

_DMARd_t_DMA_read_1: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_1)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, f36, 1)

_DMARd_t_ldst_1: nop
! start
	.word 0xfa0d4019  ! 4: LDUB_R	ldub	[%r21 + %r25], %r29

_DMARd_t_ldst_2: nop
! start
	.word 0xfe4da130  ! 6: LDSB_I	ldsb	[%r22 + 0x0130], %r31

_DMARd_t_ldst_3: nop
! start
	.word 0xf8352110  ! 9: STH_I	sth	%r28, [%r20 + 0x0110]

_DMARd_t_DMA_read_3: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_3)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 2c9, 1)

_DMARd_t_ldst_4: nop
! start
	.word 0xfc75001a  ! 12: STX_R	stx	%r30, [%r20 + %r26]

_DMARd_t_DMA_read_4: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_4)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 9cd, 1)

_DMARd_t_DMA_read_5: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_5)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 47b, 1)

_DMARd_t_DMA_read_6: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_6)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 5e7, 1)

_DMARd_t_ldst_6: nop
! start
	.word 0xfa4da110  ! 19: LDSB_I	ldsb	[%r22 + 0x0110], %r29

_DMARd_t_ldst_7: nop
! start
	.word 0xfa4d6120  ! 22: LDSB_I	ldsb	[%r21 + 0x0120], %r29

_DMARd_t_ldst_8: nop
! start
	.word 0xfc35e110  ! 24: STH_I	sth	%r30, [%r23 + 0x0110]

_DMARd_t_DMA_read_8: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_8)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 104, 1)

_DMARd_t_DMA_read_9: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_9)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 81f, 1)

_DMARd_t_DMA_read_10: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_10)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 843, 1)

_DMARd_t_ldst_10: nop
! start
	.word 0xfa4da130  ! 31: LDSB_I	ldsb	[%r22 + 0x0130], %r29

_DMARd_t_ldst_11: nop
! start
	.word 0xf84d6120  ! 34: LDSB_I	ldsb	[%r21 + 0x0120], %r28

_DMARd_t_ldst_12: nop
! start
	.word 0xfe352110  ! 36: STH_I	sth	%r31, [%r20 + 0x0110]

_DMARd_t_DMA_read_12: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_12)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 63d, 1)

_DMARd_t_ldst_13: nop
! start
	.word 0xfe0dc019  ! 39: LDUB_R	ldub	[%r23 + %r25], %r31

_DMARd_t_DMA_read_14: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_14)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 9a6, 1)

_DMARd_t_ldst_14: nop
! start
	.word 0xfc75801b  ! 43: STX_R	stx	%r30, [%r22 + %r27]

_DMARd_t_DMA_read_15: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_15)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 698, 1)

_DMARd_t_DMA_read_16: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_16)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 8d6, 1)

_DMARd_t_DMA_read_17: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_17)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 88d, 1)

_DMARd_t_DMA_read_18: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_18)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 43a, 1)

_DMARd_t_DMA_read_19: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_19)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 12f, 1)

_DMARd_t_DMA_read_20: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_20)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 636, 1)

_DMARd_t_ldst_15: nop
! start
	.word 0xfa35a100  ! 51: STH_I	sth	%r29, [%r22 + 0x0100]

_DMARd_t_ldst_16: nop
! start
	.word 0xfc35e120  ! 53: STH_I	sth	%r30, [%r23 + 0x0120]

_DMARd_t_DMA_read_22: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_22)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 8b5, 1)

_DMARd_t_DMA_read_23: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_23)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 9c9, 1)

_DMARd_t_ldst_17: nop
! start
	.word 0xfe75001a  ! 58: STX_R	stx	%r31, [%r20 + %r26]

_DMARd_t_DMA_read_24: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_24)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, c4a, 1)

_DMARd_t_DMA_read_25: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_25)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 523, 1)

_DMARd_t_DMA_read_26: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_26)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, c53, 1)

_DMARd_t_DMA_read_27: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_27)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 77b, 1)

_DMARd_t_DMA_read_28: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_28)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, a1f, 1)

_DMARd_t_DMA_read_29: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_29)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, c3d, 1)

_DMARd_t_ldst_18: nop
! start
	.word 0xfe0d8019  ! 66: LDUB_R	ldub	[%r22 + %r25], %r31

_DMARd_t_DMA_read_30: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_30)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 485, 1)

_DMARd_t_DMA_read_31: nop

 ! $EV trig_pc_d(1, @VA(.MAIN._DMARd_t_DMA_read_31)) -> EnablePCIeIgCmd("DMARD", fffc000056789000,fffc000056789000, 439, 1)

_DMARd_t_ldst_19: nop
! start
	.word 0xfa0d8018  ! 70: LDUB_R	ldub	[%r22 + %r24], %r29
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

