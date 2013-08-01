/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_L2_NotData_NDDM.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define  DRAM_ERR_INJ_REG   0x8400000290
#define  DRAM_ERR_STAT_REG  0x8400000280
#define  L2_ERR_STAT_REG    0xAB00000000
#define  L2_ERR_ADDR_REG    0xAC00000000
#define  L2_NDDM_REG        0xAE00000000 

#define  TT_SW_Error        0x40


#define	 ERROR_ADDR	    0x20200000
#define  TEST_DATA0         0x1000100081c3e008
#define  TEST_DATA1         0x2000200081c3e008
#define  TEST_DATA2         0x3000300081c3e008
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000
#define DMA_DATA_BYP_ADDR1  0xfffc00002000aa00

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"
#include "peu_defines.h"



.text
.global  main




main:

  ta    T_CHANGE_HPRIV


disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

  setx  0x20040000, %l0, %g6


clear_dram_esr_0:
  ! Clear DRAM Error status register (Bit[63:57] write-1-clear)
  setx  DRAM_ES_W1C_VALUE, %l0, %g4
  setx  DRAM_ERR_STAT_REG, %l3, %g5  
  stx   %g4, [%g5]

set_DRAM_error_inject_ch0:
  mov   0x602, %l1                ! ECC Mask (2-bit error)
  mov   0x1, %l2 		
  sllx  %l2, DRAM_EI_SSHOT, %l3
  Or    %l1, %l3, %l1           ! Set single shot ; 
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG, %l3, %g5 
  stx   %l1, [%g5]
  membar 0x40

!enable_err_reporting:
!  setx L2EE_PA0, %l0, %l1
!  ldx  [%l1], %l2
!  mov  0x3, %l0
!  or   %l2, %l0, %l2
!  stx  %l2, [%l1]

  ! Write 1 to clear L2 Error status registers
clear_l2_ESR:
  setx  L2ES_PA0, %l3, %l4
  stx   %g4, [%l4]
  nop

store_to_L2:
  setx  TEST_DATA1, %l0, %g5


set_L2_Directly_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1
  mov   0x2, %l0
  stx   %l0, [%g1]

  
store_to_L2_way0:
  setx  0x2000aa00, %l0, %g2  ! bits [21:18] select way
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync

! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_0:
  setx  0x1000aa00, %l0, %g3 ! bits [21:18] select way
  stx %g5, [%g3]
  stx %g5, [%g3+8]
  membar #Sync

read_error_address_ch0:
  stx    %g5, [%g2]
  membar #Sync

Wr_Evnt: nop;
        ! $EV trig_pc_d(1, @VA(.MAIN.Wr_Evnt) -> EnablePCIeIgCmd ("DMARD_UE", DMA_DATA_BYP_ADDR1, DMA_DATA_BYP_ADDR1, "64'h40", 1 )

clr %i7
set 0x20,%l7
loop:
  inc %i7
  cmp %i7,%l7
  bne loop
  nop

Wr_Evnt1: nop;
        ! $EV trig_pc_d(1, @VA(.MAIN.Wr_Evnt1) -> EnablePCIeIgCmd ("DMARD_UE", DMA_DATA_BYP_ADDR1, DMA_DATA_BYP_ADDR1, "64'h40", 1 )

clr %i7
set 0x20,%l7
loop_wr:
  inc %i7
  cmp %i7,%l7
  bne loop_wr
  nop


   
check_DRAM_ESR_0:
  setx  DRAM_ERR_STAT_REG, %l3, %g5  
  ldx   [%g5], %l6

compute_dram_ESR:
  setx  0xffffffffffff0000, %l0,%o2
  and   %l6,%o2,%l6
  mov   0x1, %l1
  sllx  %l1, DRAM_ES_DAU, %l0

verify_dram_ESR:
  cmp   %l0, %l6
  bne   %xcc, test_fail
  nop

check_L2_ESR_0:
  setx  L2_ERR_STAT_REG, %l3, %g5  
  ldx   [%g5], %l6

compute_L2_ESR:
  setx  0xfffffffff0000000, %l3, %l0
  andcc %l0, %l6, %l5                   ! Donot check L2ESR SYND bits
  mov   0x1, %l1
  sllx  %l1, L2ES_DAU, %l0
  mov   0x1, %l1
  sllx  %l1, L2ES_VEU, %l2
  or    %l0, %l2, %l3

verify_L2_ESR:
  cmp   %l6, %l3
  bne   %xcc, test_fail
  nop

check_notData_reg:
  setx  L2_NDDM_REG, %l3, %g5
  ldx   [%g5], %l6

compute_notData_reg:
  setx  0x900002000aa00, %l0, %l1  ! bits [21:18] select way
  setx  0xfffffffffffc0, %l0,%o2
  and  %l6, %o2, %l6
  cmp   %l6, %l1
  bne   %xcc, test_fail
  nop

  setx  L2EA_PA0, %l2, %l3
check_l2_EAR:
  ldx   [%l3], %l4
  ! Error address is the physical address of the cache line (PA[5:0] 0)
  setx  0x2000aa00, %l0, %l1  ! bits [21:18] select way
  setx  0xffffffffc0, %l0,%o2
  and  %l4, %o2, %l4
  cmp   %l4, %l1
  bne   %xcc, test_fail
  nop


  ba    test_pass
  nop

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP


test_fail:
ta  T_BAD_TRAP

