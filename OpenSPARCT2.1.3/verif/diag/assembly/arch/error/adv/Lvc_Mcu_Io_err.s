/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: Lvc_Mcu_Io_err.s
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
#define ENABLE_PCIE_LINK_TRAINING
/* #define MAIN_PAGE_NUCLEUS_ALSO */ /* Access main in priviledge mode */
#define MAIN_PAGE_HV_ALSO

#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"
#include "niu_defines.h"


#define DMA_DATA_ADDR           0x0000000123456700
#define DMA_DATA_BYP_SADDR      0xfffc00003300aa00
#define DMA_DATA_BYP_ADDR1      0xfffc000123456700
#define DMA_DATA_BYP_ADDR2      0xfffc000123456780
#define DMA_DATA_BYP_ADDR3      0xfffc000123456800
#define  DRAM_ERR_INJ_REG_0               0x8400000290
#define  DRAM_ERR_INJ_REG_1               0x8400001290
#define  DRAM_ERR_INJ_REG_2               0x8400002290
#define  DRAM_ERR_INJ_REG_3               0x8400003290
#define  L2_ENTRY_PA        0xa000000000
#define  L2ES_LVC         34



#define IO_RD_ADDR mpeval((N2_PCIE_BASE_ADDR + (IOCFG_OFFSET_BASE_REG_DATA & 0x7fffffffffffffff)) |IO_ACCESS_PA)


/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

set_Soc_err_Inj_reg:
        set     0x1, %i1
        setx    0x800001248c80040c,%i1,%i2
        setx    SOC_EJR_REG, %l7, %i3
        stx     %i2, [%i3]
        membar  0x40


disable_l1_DCache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove bit 2
  andn  %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

set_L2_Directly_Mapped_Mode:
  set   0x80, %l1
  set   0x100,%l2
  set   0x180, %l3
  setx  L2CS_PA0, %l6, %g1      ! Bit 1 in L2 Control Status Register
  add   %g1,%l1,%g2
  add   %g1,%l2,%g3
  add   %g1,%l3,%g4
  mov   0x2, %l0
  stx   %l0, [%g1]
  stx   %l0, [%g2]
  stx   %l0, [%g3]
  stx   %l0, [%g4]


store_to_L2_way0:
  set  0x555555, %g5
  set  0x2200aa00, %g1
  stx %g5, [%g1]
  stx %g5, [%g1+8]
  membar #Sync


generate_VD_addr:
  ! Generate L2 VD Diag read address
  ! Addressing: [39:32] See PRM, [22] 1 for V/D, [17:8] set, [7:6] bank, [2:0] = 0
  setx  0x3ffc0, %l0, %l2       ! Mask for extracting [17:6]
  and   %g1, %l2, %l7

  mov   0xb6, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %l7, %l0, %l7

  mov   0x1, %l0
  sllx  %l0, 22, %l0            ! Bit [22]
  or    %l7, %l0, %l7

read_l2_VD_diag:
  ldx   [%l7], %l6

 ! Now confirm it is stored to way 0
  setx  0xffff, %l0, %l2      ! Mask for [16:0]
  and   %l6, %l2, %l6         ! Valid bits at [31:16]

  clr   %g2                   ! %g2 will store the "way"

  ! Direct comparison - avoid loops to save run time
  cmp   %l6, 0x1
  !bne   test_failed
  nop

way_found:
  ! Read L2 Data Diag - %g2 has the "way"
  ! Addressing: [39:32] See PRM, [22] odd/even word, [21:18] way, [17:8] set, [7:6] bank, [5:3] D-word, [2:0] = 0
  setx  0x3fff8, %l0, %l2       ! Mask for extracting [17:3]
  and   %g1, %l2, %g5

  sllx  %g2, 18, %l0            ! Position Way
  or    %g5, %l0, %g5

  mov   0xa3, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %g5, %l0, %g5           ! %g5 has L2 Data Diag addressing


read_l2_data_diag:
  ldx   [%g5], %g6

  ! Flip one bit from the data field
  xor   %g6, 0x80, %g6          ! save on %g6 for future reference
write_back_with_error:
  stx   %g6, [%g5]

  ! Now set allocate bits for all other 15 ways (to ensure a write-back later)
set_allocate:
  mov   0x1, %l0
  sllx  %l0, 22, %l1            ! L2_VD and L2_UA addressing differ on bit 22
  xor   %l7, %l1, %l7           ! change %l7 from L2_VD to L2_UA address

read_l2_UA_diag:
  ldx   [%l7], %l6

  sllx  %l0, %g2, %l1           ! Shift "way" into its bit position
  not   %l1
  setx  0xffff,%l5, %g2
  and   %l1, %g2 , %l1         ! Allocate bits on [15:0]
  or    %l6, %l1, %l6           ! Write 1 to all other 15 ways' allocate bits

  ! also need to set ECC bits for Allocate bits (Bits [38:32])
set_ECC_Allocate:
  mov    0x7f, %l0
  sllx   %l0, 32, %l0
  xor    %l6, %l0, %l1
  or     %l6, %l1, %l6

write_l2_UA_diag:
  stx   %l6, [%l7]

  ! Now do another store with the same index but different tag - to force a Write-Back
error_address:
  mov   0x1, %l0
  sllx  %l0, 28, %l0
  xor   %g1, %l0, %l1             ! Flip bit 28 of previous L2 entry PA

  ! This should cause L2 LDWC (bit 51)
store_to_L2_with_error:
  st    %g3, [%l1]
  membar #Sync

XmtUsrEvnt_ldrc:
        nop         ! $EV trig_pc_d(1, @VA(.MAIN.XmtUsrEvnt_ldrc)) -> EnablePCIeIgCmd ("DMARD", DMA_DATA_BYP_SADDR, DMA_DATA_BYP_SADDR, "64'h40", 1, *, * )



set_DRAM_err_cnt_reg:
  mov  0x1,%l2
  setx  DRAM_ERR_CNT_REG_PA_0,%l1,%g6
  setx  DRAM_ERR_CNT_REG_PA_1,%l1,%g3
  setx  DRAM_ERR_CNT_REG_PA_2,%l1,%g4
  setx  DRAM_ERR_CNT_REG_PA_3,%l1,%g5
  stx   %l2, [%g3]
  stx   %l2, [%g4]
  stx   %l2, [%g5]
  stx   %l2, [%g6]
  membar 0x40

set_DRAM_fbr_count_reg:
        set     0x10000, %g6            !<16>=countone=1
        setx    DRAM_FBR_CNT_REG_PA_0, %l7, %o2
        setx    DRAM_FBR_CNT_REG_PA_1, %l7, %o3
        setx    DRAM_FBR_CNT_REG_PA_2, %l7, %o4
        setx    DRAM_FBR_CNT_REG_PA_3, %l7, %o5
        stx     %g6, [%o2]
        stx     %g6, [%o3]
        stx     %g6, [%o4]
        stx     %g6, [%o5]
        ldx     [%o2], %i1
        ldx     [%o3], %i2
        ldx     [%o4], %i3
        ldx     [%o5], %i4



set_DRAM_error_inject_ch0_dac:
  mov   0x2, %l1                ! ECC Mask (1-bit error)
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_SSHOT, %l3
  or    %l1, %l3, %l1           ! Set single shot ;
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG_0, %l3, %g3
  setx  DRAM_ERR_INJ_REG_1, %l3, %g4
  setx  DRAM_ERR_INJ_REG_2, %l3, %g5
  setx  DRAM_ERR_INJ_REG_3, %l3, %g6
  stx   %l1, [%g3]
  stx   %l1, [%g4]
  stx   %l1, [%g5]
  stx   %l1, [%g6]
  membar 0x40


store_to_L2_way0_dac:
  set  0x55555555,  %l0
  set  0x22000000,  %g7  ! bits [21:18] select way
  set   0x80, %l1
  set   0x100,%l2
  set   0x180, %l3
  add   %g7,%l1,%g2
  add   %g7,%l2,%g3
  add   %g7,%l3,%g4
  stx   %l0, [%g2]
  membar #Sync
  stx   %l0, [%g3]
  membar #Sync
  stx   %l0, [%g4]
  membar #Sync
  stx   %l0, [%g7]
  membar #Sync

! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_0_dac:
  set  0x80,%l1
  set  0x31000000, %i3 ! bits [21:18] select way
  add   %i3,%l1,%i2
  add   %i2,%l1,%i7
  add   %i7,%l1,%i4
  stx %g5, [%i2]
  stx %g5, [%i3]
  stx %g5, [%i4]
  stx %g5, [%i7]
  membar #Sync

read_error_address0_dac:
 ldx   [%g2], %l0
 ldx   [%g3], %l1
 ldx   [%g4], %l2
 ldx   [%g7], %l3
  membar #Sync

read_error_address1_dac:
 ldx   [%g2], %l0
 ldx   [%g3], %l1
 ldx   [%g4], %l2
 ldx   [%g7], %l3
  membar #Sync


read_error_address2_dac:
 ldx   [%g2], %l0
 ldx   [%g3], %l1
 ldx   [%g4], %l2
 ldx   [%g7], %l3
  membar #Sync



set_inj_err_src_reg_fbr:
        set     0x3, %g1
        setx    DRAM_FBD_INJ_ERR_SRC_REG_PA_0,%l7, %g3
        setx    DRAM_FBD_INJ_ERR_SRC_REG_PA_1,%l7, %g4
        setx    DRAM_FBD_INJ_ERR_SRC_REG_PA_2,%l7, %g5
        setx    DRAM_FBD_INJ_ERR_SRC_REG_PA_3,%l7, %g6
        stx     %g1, [%g3]
        stx     %g1, [%g4]
        stx     %g1, [%g5]
        stx     %g1, [%g6]
        membar 0x40


!clear_esr_first_pio:
!        setx    SOC_ESR_REG, %l7, %i0
!        stx     %g0, [%i0]

!set_ejr_pio:
!        set     0x1, %i1
!        sllx    %i1, ERR_FIELD, %i2
!        setx    SOC_EJR_REG, %l7, %i3
!        stx     %i2, [%i3]
!        membar  0x40

      ! enable bypass in IOMMU
        setx    FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
        setx    FIRE_DLC_MMU_CSR_A_CTL__BYPASS_EN, %g1, %g3
        stx     %g3, [%g2]
        ldx     [%g2], %g3

XmtUsrEvnt1: nop;
        ! $EV trig_pc_d(1, @VA(.MAIN.XmtUsrEvnt1)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR1, DMA_DATA_BYP_ADDR1, "64'h20", 1 )
        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3


        ! select a CSR in the PIU and transmit the command to NCU

        setx    FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g1, %g2
set    0x020, %g4

delay_loop_soc:
        ldx     [%g2], %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_soc
        nop

pio:
        ! select an IO address in PCI address range and transmit the command to NCU
        setx IO_RD_ADDR, %g1, %g2

        ! load byte - all byte offsets within an octlet
        ldub [%g2 + 1*8 + 0], %l0

        set    0x40, %g4
delay_loop_pio:
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_pio
        nop


Init_flow:
        nop                     ! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig(MAC_ID, FRAME_TYPE, FRAME_CLASS,TX_PKT_LEN)

P_TxDMAActivate:
        setx    MAC_ID, %g1, %o0                        ! 1st Parameter
        setx    SetTxDMAActive_list, %g1, %o1           ! 2st parameter
        call    SetTxDMAActive
        nop                                             ! $EV trig_pc_d(1, @VA(.MAIN.P_TxDMAActivate)) -> NIU_TxDMAActivate (MAC_ID, TxDmaActive_list)

P_AddTxChannels :
        nop                                             ! $EV trig_pc_d(1, @VA(.MAIN.P_AddTxChannels)) -> NIU_AddTxChannels(MAC_ID, NIU_TxDmaNoUE)

        setx    LDGIMGN, %g1, %g2


        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5            ! Just for delay
        nop

P_SetTxMaxBurst :
        setx    NIU_TxDmaNo,    %g1, %o0                ! 1st parameter :
        setx    SetTxMaxBurst_Data, %g1, %o1            ! 2nd parameter
        call    SetTxMaxBurst
        nop                                             ! $EV trig_pc_d(1, @VA(.MAIN.P_SetTxMaxBurst)) -> NIU_SetTxMaxBurst (MAC_ID, NIU_TxDmaNoUE, TxMaxBurst_Data)

        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5            ! Just for delay
        nop

P_InitTxDma:
        setx    NIU_TxDmaNo,    %g1, %o0                ! 1st parameter :
        nop                                             ! $EV trig_pc_d(1, @VA(.MAIN.P_InitTxDma)) -> NIU_InitTxDma (MAC_ID, NIU_TxDmaNoUE, NIU_Xlate_On)
        call    InitTxDma
        nop

        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g5            ! Just for delay
        nop


Gen_Packet:
        nop                     ! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> TxPktGen(MAC_ID, NIU_TxDmaNoUE,NIU_TX_PKT_CNT,0,0)
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
        setx    NIU_PKTGEN_CSR_EV2A_TX_RNG_KICK, %g1, %g2           ! $EV trig_pc_d(1, @VA(.MAIN.SetTxRingKick)) -> NIU_SetTxRingKick(MAC_ID, NIU_TxDmaNoUE)
        setx    NIU_TxDmaNo,    %g1, %o0
        ldx    [%g2], %g3
        nop
        mulx     %o0, 0x200, %g5
        setx    TX_RING_KICK_Addr, %g1, %g2
        add     %g2, %g5, %g2
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

SetTxCs :
        setx    NIU_TxDmaNo,    %g1, %o0
        setx    TX_CS_Data, %g1, %g3
        mulx     %o0, 0x200, %g5
        setx    TX_CS_Addr, %g1, %g2
        add     %g2, %g5, %g2
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

NIUTx_Pkt_Cnt_Chk:
        setx    MAC_ID, %g1, %o0
        setx    NIU_TX_PKT_CNT, %g1, %o1
        call    NiuTx_check_pkt_cnt
        nop

        setx    loop_count, %g1, %g4
        setx    LDGIMGN, %g1, %g2

delay_loop_end:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_end
        nop

        setx    0x20, %g1, %g4
delay_ras:
        setx    0x2000000, %g1, %g2
        ldx     [%g2], %g3
        nop
        nop
        dec     %g4
        brnz    %g4, delay_ras
        nop


Check_L2_esr:
        setx  L2ES_PA0, %l6, %g1
        ldx   [%g1], %g3
	setx  0xfffffffff0000000, %l2, %l3
	andcc   %l3, %g3, %g2

Verify_L2_esr:
        mov     0x1, %l1
        sllx    %l1, L2ES_MEC, %l0
        sllx    %l1, L2ES_LVC, %l2
        or      %l0, %l2, %l2
        sllx    %l1, L2ES_DSC, %l3
        sllx    %l1, L2ES_VEC, %l4
        or      %l3, %l4, %l4
        or      %l2, %l4, %l4
        cmp     %l4, %g2
        bne     test_failed
        nop

Check_Soc_esr:
        setx    SOC_ESR_REG, %l7, %i0
        ldx     [%i0], %i1
        nop


Verify_Soc_esr:
        setx    0x8000016d8c80040c, %l7, %o3    !valid bit
        cmp     %o3, %i1
        bne     test_failed
        nop

        nop                     ! $EV trig_pc_d(1, @VA(.MAIN.test_passed)) -> NIU_EXIT_chk(MAC_ID)

ba test_passed
nop

	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

/************************************************************************
   Test case data start
************************************************************************/

SECTION       .DATA DATA_VA=DMA_DATA_ADDR
attr_data {
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
.global PCIAddr9
        .xword 0x0001020304050607
        .xword 0x08090a0b0c0d0e0f
        .xword 0x1011121314151617
        .xword 0x18191a1b1c1d1e1f
        .xword 0x2021222324252627
        .xword 0x28292a2b2c2d2e2f
        .xword 0x3031323334353637
        .xword 0x38393a3b3c3d3e3f

        .xword 0x4041424344454647
        .xword 0x48494a4b4c4d4e4f
        .xword 0x5051525354555657
        .xword 0x58595a5b5c5d5e5f
        .xword 0x6061626364656667
        .xword 0x68696a6b6c6d6e6f
        .xword 0x7071727374757677
        .xword 0x78797a7b7c7d7e7f

        .xword 0x8081828384858687
        .xword 0x88898a8b8c8d8e8f
        .xword 0x9091929394959697
        .xword 0x98999a9b9c9d9e9f
        .xword 0xa0a1a2a3a4a5a6a7
        .xword 0xa8a9aaabacadaeaf
        .xword 0xb0b1b2b3b4b5b6b7
        .xword 0xb8b9babbbcbdbebf

        .xword 0xc0c1c2c3c4c5c6c7
        .xword 0xc8c9cacbcccdcecf
        .xword 0xd0d1d2d3d4d5d6d7
        .xword 0xd8d9dadbdcdddedf
        .xword 0xe0e1e2e3e4e5e6e7
        .xword 0xe8e9eaebecedeeef
        .xword 0xf0f1f2f3f4f5f6f7
        .xword 0xf8f9fafbfcfdfeff

        .xword 0x0001020304050607
        .xword 0x08090a0b0c0d0e0f
        .xword 0x1011121314151617
        .xword 0x18191a1b1c1d1e1f
        .xword 0x2021222324252627
        .xword 0x28292a2b2c2d2e2f
        .xword 0x3031323334353637
        .xword 0x38393a3b3c3d3e3f

        .xword 0x4041424344454647
        .xword 0x48494a4b4c4d4e4f
        .xword 0x5051525354555657
        .xword 0x58595a5b5c5d5e5f
        .xword 0x6061626364656667
        .xword 0x68696a6b6c6d6e6f
        .xword 0x7071727374757677
        .xword 0x78797a7b7c7d7e7f

        .xword 0x8081828384858687
        .xword 0x88898a8b8c8d8e8f
        .xword 0x9091929394959697
        .xword 0x98999a9b9c9d9e9f
        .xword 0xa0a1a2a3a4a5a6a7
        .xword 0xa8a9aaabacadaeaf
        .xword 0xb0b1b2b3b4b5b6b7
        .xword 0xb8b9babbbcbdbebf

        .xword 0xc0c1c2c3c4c5c6c7
        .xword 0xc8c9cacbcccdcecf
        .xword 0xd0d1d2d3d4d5d6d7
        .xword 0xd8d9dadbdcdddedf
        .xword 0xe0e1e2e3e4e5e6e7
        .xword 0xe8e9eaebecedeeef
        .xword 0xf0f1f2f3f4f5f6f7
        .xword 0xf8f9fafbfcfdfeff

/************************************************************************/



