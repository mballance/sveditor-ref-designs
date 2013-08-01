/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_all_4_mcu.s
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

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define  L2_ERR_STAT_REG    0xAB00000000
#define  L2_ERR_ADDR_REG    0xAC00000000

#define  TEST_DATA0         0x1000100081c3e008
#define  TEST_DATA1         0x2000200081c3e008
#define  TEST_DATA2         0x3000300081c3e008
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000

#define L2_BANK_ADDR0        0x0       
#define MCU_BANK_ADDR0       0x0
#define  DRAM_ERR_INJ_REG0   0x8400000290
#define  DRAM_ERR_STAT_REG0  0x8400000280
#define	 ERROR_ADDR0	    0x20200000

#define L2_BANK_ADDR1        0x80
#define MCU_BANK_ADDR1       0x80
#define  DRAM_ERR_INJ_REG1   0x8400001290
#define  DRAM_ERR_STAT_REG1  0x8400001280
#define	 ERROR_ADDR1	    0x20200000


#define L2_BANK_ADDR2        0x100
#define MCU_BANK_ADDR2       0x100
#define  DRAM_ERR_INJ_REG2   0x8400002290
#define  DRAM_ERR_STAT_REG2  0x8400002280
#define  ERROR_ADDR2         0x20200100

#define L2_BANK_ADDR3        0x180
#define MCU_BANK_ADDR3       0x180
#define  DRAM_ERR_INJ_REG3   0x8400003290
#define  DRAM_ERR_STAT_REG3  0x8400003280
#define	 ERROR_ADDR3	    0x20200000


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


.text
.global  main
.global  My_Corrected_ECC_error_trap

main:


  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV




get_th_id_o0:
        ta      T_RD_THID

        cmp     %o1, 0x0
        be      main_t0
        nop

        cmp     %o1, 0x1
        be      main_t1
        nop

        cmp     %o1, 0x2
        be      main_t2
        nop

        cmp     %o1, 0x3
        be      main_t3
        nop


main_t0:
        ba      MCU0_Init
        nop


main_t1:
        ba      MCU1_Init
        nop

main_t2:
        ba      MCU2_Init
        nop

main_t3:
        ba      MCU3_Init
        nop



/*******************
   DIMM 0,1
*******************/
chk_core_running_status_reg:
        wr      %g0, ASI_CMP_CORE, %asi
        ldxa    [ASI_CMP_CORE_RUNNING_STATUS]%asi, %l0

!Code for Thread1
MCU1_Init:


  
disable_l11:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


clear_dram_esr_01:
  ! Clear DRAM Error status register (Bit[63:57] write-1-clear)
  setx  DRAM_ES_W1C_VALUE, %l0, %l5
  setx  DRAM_ERR_STAT_REG1, %l3, %g5  
!  add   %g5, MCU_BANK_ADDR1, %g5
  stx   %l5, [%g5]

set_DRAM_error_inject_ch01:
  mov   0x2, %l1                ! ECC Mask (1-bit error)
  mov   0x1, %l2 		
  sllx  %l2, DRAM_EI_SSHOT, %l3
  Or    %l1, %l3, %l1           ! Set single shot ; 
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG1, %l3, %g6 
!  add   %g6, MCU_BANK_ADDR, %g6
  stx   %l1, [%g6]
  membar 0x40

enable_err_reporting1:
  setx L2EE_PA0, %l0, %l1
  add   %l1, L2_BANK_ADDR1, %l1
  ldx  [%l1], %l2
  mov  0x3, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]


  ! Write 1 to clear L2 Error status registers
clear_l2_ESR1:
  setx  L2ES_PA0, %l3, %l4
  add   %l4, L2_BANK_ADDR1, %l4
  stx   %l5, [%l4]
  nop

store_to_L21:
  setx  TEST_DATA1, %l0, %g5


set_L2_Directly_Mapped_Mode1:
  setx  L2CS_PA0, %l6, %g1
  add   %g1, L2_BANK_ADDR1, %g1
  mov   0x2, %l0
  stx   %l0, [%g1]

  
store_to_L2_way01:
  setx  0x20220aa00, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR1, %g2
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync

! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_01:
  setx  0x20210aa00, %l0, %g3 ! bits [21:18] select way
  add   %g3, L2_BANK_ADDR1, %g3
  stx %g5, [%g3]
  stx %g5, [%g3+8]
  membar #Sync


read_error_address_ch01:
  ldx   [%g2], %l1
  membar #Sync
!  ldx   [%g3], %l2
!  membar #Sync

   
check_DRAM_ESR_01:
  setx  DRAM_ERR_STAT_REG1, %l3, %g5  
!  add   %g5, MCU_BANK_ADDR1, %g5
  ldx   [%g5], %l6

compute_dram_ESR1:
  mov   0x1, %l1
  sllx  %l1, DRAM_ES_DAC, %l0
  set   0x0002, %l3              ! 16-bit Syndrome - for SECC, it's the mask nibble-reversed
  or    %l0, %l3, %l0            ! %l0 has expected value

verify_dram_ESR1:
  cmp   %l0, %l6
  !bne   %xcc, test_fail
  nop

check_L2_ESR_01:
  setx  L2_ERR_STAT_REG, %l3, %g5  
  add   %g5, L2_BANK_ADDR1, %g5
  ldx   [%g5], %l6

compute_L2_ESR1:
  setx  0xfffffffff0000000, %l3, %l0
  andcc %l0, %l6, %l0                  ! Donot check L2ESR SYND bits
  mov   0x1, %l1
  sllx  %l1, L2ES_DAC, %l0
  mov   0x1, %l1
  sllx  %l1, L2ES_VEC, %l2
  or    %l0, %l2, %l3

verify_L2_ESR1:
  cmp   %l6, %l3
  !bne   %xcc, test_fail
  nop


  setx  L2EA_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR1, %l3
check_l2_EAR1:
  ldx   [%l3], %l4
  ! Error address is the physical address of the cache line (PA[5:0] 0)
  setx  0x20220aa00, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR1, %g2

  setx  0xffffffffc0, %l0,%o2
  and  %l4, %o2, %l4
  cmp   %l4, %g2
  !bne   %xcc, test_fail
  nop

check_Corr_err_trap1:
  ! Check if a Corrected ECC Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  !bne   test_fail
  nop
  mov   TT_Corrected_ECC, %l0
 ! mov   TT_SW_Error, %l0
  cmp   %o1, %l0
  !bne   test_fail
  nop

 ba    test_pass
  nop

!Code for Thread1
MCU0_Init:

  
disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


clear_dram_esr_0:
  ! Clear DRAM Error status register (Bit[63:57] write-1-clear)
  setx  DRAM_ES_W1C_VALUE, %l0, %l5
  setx  DRAM_ERR_STAT_REG0, %l3, %g5
!  add   %g5, MCU_BANK_ADDR0, %g5
  stx   %l5, [%g5]

set_DRAM_error_inject_ch0:
  mov   0x2, %l1                ! ECC Mask (1-bit error)
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_SSHOT, %l3
  Or    %l1, %l3, %l1           ! Set single shot ;
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG0, %l3, %g6
!  add   %g6, MCU_BANK_ADDR, %g6
  stx   %l1, [%g6]
  membar 0x40

enable_err_reporting:
  setx L2EE_PA0, %l0, %l1
  add   %l1, L2_BANK_ADDR0, %l1
  ldx  [%l1], %l2
  mov  0x3, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]


  ! Write 1 to clear L2 Error status registers
clear_l2_ESR:
  setx  L2ES_PA0, %l3, %l4
  add   %l4, L2_BANK_ADDR0, %l4
  stx   %l5, [%l4]
  nop

store_to_L2:
  setx  TEST_DATA1, %l0, %g5


set_L2_Directly_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1
  add   %g1, L2_BANK_ADDR0, %g1
  mov   0x2, %l0
  stx   %l0, [%g1]

store_to_L2_way0:
  setx  0x20220aa00, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR0, %g2
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync

! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_0:
  setx  0x20210aa00, %l0, %g3 ! bits [21:18] select way
  add   %g3, L2_BANK_ADDR0, %g3
  stx %g5, [%g3]
  stx %g5, [%g3+8]
  membar #Sync


read_error_address_ch0:
  ldx   [%g2], %l1
  membar #Sync
!  ldx   [%g3], %l2
!  membar #Sync


check_DRAM_ESR_0:
  setx  DRAM_ERR_STAT_REG0, %l3, %g5
!  add   %g5, MCU_BANK_ADDR0, %g5
  ldx   [%g5], %l6

compute_dram_ESR:
  mov   0x1, %l1
  sllx  %l1, DRAM_ES_DAC, %l0
  set   0x0002, %l3              ! 16-bit Syndrome - for SECC, it's the mask nibble-reversed
  or    %l0, %l3, %l0            ! %l0 has expected value

verify_dram_ESR:
  cmp   %l0, %l6
  !bne   %xcc, test_fail
  nop

check_L2_ESR_0:
  setx  L2_ERR_STAT_REG, %l3, %g5
  add   %g5, L2_BANK_ADDR0, %g5
  ldx   [%g5], %l6

compute_L2_ESR:
  setx  0xfffffffff0000000, %l3, %l0
  andcc %l0, %l6, %l0                  ! Donot check L2ESR SYND bits
  mov   0x1, %l1
  sllx  %l1, L2ES_DAC, %l0
  mov   0x1, %l1
  sllx  %l1, L2ES_VEC, %l2
  or    %l0, %l2, %l3

verify_L2_ESR:
  cmp   %l6, %l3
  !bne   %xcc, test_fail
  nop


  setx  L2EA_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR0, %l3
check_l2_EAR:
  ldx   [%l3], %l4
  ! Error address is the physical address of the cache line (PA[5:0] 0)
  setx  0x20220aa00, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR0, %g2

  setx  0xffffffffc0, %l0,%o2
  and  %l4, %o2, %l4
  cmp   %l4, %g2
  !bne   %xcc, test_fail
  nop

check_Corr_err_trap:
  ! Check if a Corrected ECC Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  !bne   test_fail
  nop
  mov   TT_Corrected_ECC, %l0
 ! mov   TT_SW_Error, %l0
  cmp   %o1, %l0
  !bne   test_fail
  nop


  ba    test_pass
  nop

!Code for Thread2
MCU2_Init:
  
disable_l12:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


clear_dram_esr_02:
  ! Clear DRAM Error status register (Bit[63:57] write-1-clear)
  setx  DRAM_ES_W1C_VALUE, %l0, %l5
  setx  DRAM_ERR_STAT_REG2, %l3, %g5
!  add   %g5, MCU_BANK_ADDR, %g5
  stx   %l5, [%g5]

set_DRAM_error_inject_ch02:
  mov   0x2, %l1                ! ECC Mask (1-bit error)
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_SSHOT, %l3
  Or    %l1, %l3, %l1           ! Set single shot ;
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG2, %l3, %g6
!  add   %g6, MCU_BANK_ADDR, %g6
  stx   %l1, [%g6]
  membar 0x40

enable_err_reporting2:
  setx L2EE_PA0, %l0, %l1
  add   %l1, L2_BANK_ADDR2, %l1
  ldx  [%l1], %l2
  mov  0x3, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]


  ! Write 1 to clear L2 Error status registers
clear_l2_ESR2:
  setx  L2ES_PA0, %l3, %l4
  add   %l4, L2_BANK_ADDR2, %l4
  stx   %l5, [%l4]
  nop

store_to_L22:
  setx  TEST_DATA1, %l0, %g5


set_L2_Directly_Mapped_Mode2:
  setx  L2CS_PA0, %l6, %g1
  add   %g1, L2_BANK_ADDR2, %g1
  mov   0x2, %l0
  stx   %l0, [%g1]

store_to_L2_way02:
  setx  0x20220aa00, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR2, %g2
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync

! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_02:
  setx  0x20210aa00, %l0, %g3 ! bits [21:18] select way
  add   %g3, L2_BANK_ADDR2, %g3
  stx %g5, [%g3]
  stx %g5, [%g3+8]
  membar #Sync


read_error_address_ch02:
  ldx   [%g2], %l1
  membar #Sync
!  ldx   [%g3], %l2
!  membar #Sync


check_DRAM_ESR_02:
  setx  DRAM_ERR_STAT_REG2, %l3, %g5
!  add   %g5, MCU_BANK_ADDR2, %g5
  ldx   [%g5], %l6

compute_dram_ESR2:
  mov   0x1, %l1
  sllx  %l1, DRAM_ES_DAC, %l0
  set   0x0002, %l3              ! 16-bit Syndrome - for SECC, it's the mask nibble-reversed
  or    %l0, %l3, %l0            ! %l0 has expected value

verify_dram_ESR2:
  cmp   %l0, %l6
  !bne   %xcc, test_fail
  nop

check_L2_ESR_02:
  setx  L2_ERR_STAT_REG, %l3, %g5
  add   %g5, L2_BANK_ADDR2, %g5
  ldx   [%g5], %l6

compute_L2_ESR2:
  setx  0xfffffffff0000000, %l3, %l0
  andcc %l0, %l6, %l0                  ! Donot check L2ESR SYND bits
  mov   0x1, %l1
  sllx  %l1, L2ES_DAC, %l0
  mov   0x1, %l1
  sllx  %l1, L2ES_VEC, %l2
  or    %l0, %l2, %l3

verify_L2_ESR2:
  cmp   %l6, %l3
  !bne   %xcc, test_fail
  nop


  setx  L2EA_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR2, %l3

check_l2_EAR2:
  ldx   [%l3], %l4
  ! Error address is the physical address of the cache line (PA[5:0] 0)
  setx  0x20220aa00, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR2, %g2

  setx  0xffffffffc0, %l0,%o2
  and  %l4, %o2, %l4
  cmp   %l4, %g2
  !bne   %xcc, test_fail
  nop

check_Corr_err_trap2:
  ! Check if a Corrected ECC Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  !bne   test_fail
  nop
  mov   TT_Corrected_ECC, %l0
 ! mov   TT_SW_Error, %l0
  cmp   %o1, %l0
  !bne   test_fail
  nop


  ba    test_pass
  nop




!Code for Thread3
MCU3_Init:
  
disable_l13:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


clear_dram_esr_03:
  ! Clear DRAM Error status register (Bit[63:57] write-1-clear)
  setx  DRAM_ES_W1C_VALUE, %l0, %l5
  setx  DRAM_ERR_STAT_REG3, %l3, %g5
!  add   %g5, MCU_BANK_ADDR3, %g5
  stx   %l5, [%g5]

set_DRAM_error_inject_ch03:
  mov   0x2, %l1                ! ECC Mask (1-bit error)
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_SSHOT, %l3
  Or    %l1, %l3, %l1           ! Set single shot ;
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG3, %l3, %g6
!  add   %g6, MCU_BANK_ADDR, %g6
  stx   %l1, [%g6]
  membar 0x40

enable_err_reporting3:
  setx L2EE_PA0, %l0, %l1
  add   %l1, L2_BANK_ADDR3, %l1
  ldx  [%l1], %l2
  mov  0x3, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]


  ! Write 1 to clear L2 Error status registers
clear_l2_ESR3:
  setx  L2ES_PA0, %l3, %l4
  add   %l4, L2_BANK_ADDR3, %l4
  stx   %l5, [%l4]
  nop

store_to_L23:
  setx  TEST_DATA1, %l0, %g5


set_L2_Directly_Mapped_Mode3:
  setx  L2CS_PA0, %l6, %g1
  add   %g1, L2_BANK_ADDR3, %g1
  mov   0x2, %l0
  stx   %l0, [%g1]

store_to_L2_way03:
  setx  0x20220aa00, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR3, %g2
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync

! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_03:
  setx  0x20210aa00, %l0, %g3 ! bits [21:18] select way
  add   %g3, L2_BANK_ADDR3, %g3
  stx %g5, [%g3]
  stx %g5, [%g3+8]
  membar #Sync


read_error_address_ch03:
  ldx   [%g2], %l1
  membar #Sync
!  ldx   [%g3], %l2
!  membar #Sync


check_DRAM_ESR_03:
  setx  DRAM_ERR_STAT_REG3, %l3, %g5
!  add   %g5, MCU_BANK_ADDR3, %g5
  ldx   [%g5], %l6

compute_dram_ESR3:
  mov   0x1, %l1
  sllx  %l1, DRAM_ES_DAC, %l0
  set   0x0002, %l3              ! 16-bit Syndrome - for SECC, it's the mask nibble-reversed
  or    %l0, %l3, %l0            ! %l0 has expected value

verify_dram_ESR3:
  cmp   %l0, %l6
  !bne   %xcc, test_fail
  nop

check_L2_ESR_03:
  setx  L2_ERR_STAT_REG, %l3, %g5
  add   %g5, L2_BANK_ADDR3, %g5
  ldx   [%g5], %l6

compute_L2_ESR3:
  setx  0xfffffffff0000000, %l3, %l0
  andcc %l0, %l6, %l0                  ! Donot check L2ESR SYND bits
  mov   0x1, %l1
  sllx  %l1, L2ES_DAC, %l0
  mov   0x1, %l1
  sllx  %l1, L2ES_VEC, %l2
  or    %l0, %l2, %l3

verify_L2_ESR3:
  cmp   %l6, %l3
  !bne   %xcc, test_fail
  nop


  setx  L2EA_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR3, %l3



check_l2_EAR3:
  ldx   [%l3], %l4
  ! Error address is the physical address of the cache line (PA[5:0] 0)
  setx  0x20220aa00, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR3, %g2

  setx  0xffffffffc0, %l0,%o2
  and  %l4, %o2, %l4
  cmp   %l4, %g2
  !bne   %xcc, test_fail
  nop

check_Corr_err_trap3:
  ! Check if a Corrected ECC Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  !bne   test_fail
  nop
  mov   TT_Corrected_ECC, %l0
 ! mov   TT_SW_Error, %l0
  cmp   %o1, %l0
  !bne   test_fail
  nop


  ba    test_pass
  nop

My_Corrected_ECC_error_trap:

!My_Recoverable_Sw_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  retry
  nop


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP


test_fail:
ta  T_BAD_TRAP



