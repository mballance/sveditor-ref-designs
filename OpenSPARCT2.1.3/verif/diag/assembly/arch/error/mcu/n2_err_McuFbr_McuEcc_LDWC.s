/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_McuFbr_McuEcc_LDWC.s
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


#define DMA_DATA_ADDR           0x0000000123456700
#define DMA_DATA_BYP_SADDR      0xfffc00003000aa00
#define DMA_DATA_BYP_ADDR1      0xfffc000123456700
#define DMA_DATA_BYP_ADDR2      0xfffc000123456780
#define DMA_DATA_BYP_ADDR3      0xfffc000123456800
#define  DRAM_ERR_INJ_REG_0               0x8400000290
#define  DRAM_ERR_INJ_REG_1               0x8400001290
#define  DRAM_ERR_INJ_REG_2               0x8400002290
#define  DRAM_ERR_INJ_REG_3               0x8400003290
#define  L2_ENTRY_PA        0xa000000000



    
/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

set_Soc_Err_Inj_reg:
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


store_to_L2_way0_ldac:
  set   0x5555555, %g5
  setx  0x3000aa00, %l0, %g2  ! bits [21:18] select way
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync

mov 0x20,%i4
clr %i3
loop:
  inc %i3
  cmp %i3,%i4
  bne loop
  nop


L2_diag_load_ldac:
  set  0x3ffff8, %l2      ! Mask for extracting [21:3]
  setx  L2_ENTRY_PA, %l0, %g4
  and   %g2, %l2, %g5           !g2 has L2 PA,
  or    %g5, %g4, %g5           !g5 now has Diagnostic Data Array address
  ldx   [%g5], %g6
  membar #Sync

! Flip one bits to inject error
  xor    %g6, 0x200, %g6
  stx   %g6, [%g5]
  membar #Sync

mov 0x7,%i4
clr %i3
loop_next:
  inc %i3
  cmp %i3,%i4
  bne loop_next
  nop


store_for_wb:                 !Load to L2 again to get the error
  set  0x55555555,%l6
  set  0x2000aa00, %g2
  stx   %l6, [%g2]


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

Check_L2_esr:
        setx  L2ES_PA0, %l6, %g1
        ldx   [%g1], %g2

Verify_L2_esr:
        mov     0x1, %l1
        sllx    %l1, L2ES_MEC, %l0
        sllx    %l1, L2ES_LDWC, %l2
        or      %l0, %l2, %l2
        sllx    %l1, L2ES_DSC, %l3
        sllx    %l1, L2ES_VEC, %l4
        or      %l3, %l4, %l4
        or      %l2, %l4, %l4
        cmp     %l4, %g2
        bne     test_fail
        nop

Check_Soc_esr:
        setx    SOC_ESR_REG, %l7, %i0
        ldx     [%i0], %i1
        nop


Verify_Soc_esr:
        setx    0x8000036d80000000, %l7, %o3    !valid bit
        cmp     %o3, %i1
        bne     test_fail
        nop



ba test_pass
nop

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD
