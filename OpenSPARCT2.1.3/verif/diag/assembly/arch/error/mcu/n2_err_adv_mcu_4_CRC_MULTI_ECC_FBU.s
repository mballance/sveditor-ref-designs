/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_mcu_4_CRC_MULTI_ECC_FBU.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define  L2_ERR_STAT_REG    0xAB00000000
#define  L2_ERR_ADDR_REG    0xAC00000000

#define  TEST_DATA1         0x1000100081c3e008
#define  TEST_DATA2         0x2000200081c3e008
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000

#define  DRAM_ERR_INJ_REG   0x8400000290
#define  DRAM_ERR_STAT_REG  0x8400000280
#define	 ERROR_ADDR	    0x20200000

#define  DRAM_SCRUB_FREQ_REG  0x8400000018
#define  DRAM_SCRUB_ENB_REG    0x8400000040

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


.text
.global  main


main:
  ta T_CHANGE_HPRIV

! begin
get_th_id_o0:
  ta  T_RD_THID
  cmp  %o1, 0x0
  be  main_t0
  nop
  cmp  %o1, 0x1
  be  main_t1
  nop

main_t0:
  ba L2B0_Init
  nop

L2B0_Init:
disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

clear_DRAM_ESR_MCU0_BANK0:
  clr %l0
  clr %l1
  setx  DRAM_ES_W1C_VALUE, %l0, %g2
  setx  0x8400000280, %l1, %g6
  stx   %g2, [%g6]
clear_L2_ESR_B0:
  clr %l0
  clr %l1
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  0xbb00000000, %l1, %g7
  stx   %g4, [%g7]
  
set_DRAM_error_inject_mcu0_b0:
  mov   0x2, %l1
  !mov   0x1, %l2
  !sllx  %l2, DRAM_EI_SSHOT, %l2
  !or    %l1, %l2, %l1
  mov   0x1, %l3
  sllx  %l3, 31, %l3
  or    %l1, %l3, %l1
  setx  0x8400000290, %l0, %g4
  stx   %l1, [%g4]
  membar 0x40

set_L2_Direct_Mapped_Mode_b0:
  clr %l0
  clr %g1
  setx  0xa900000000, %l0, %g1
  mov   0x2, %l0
  stx   %l0, [%g1]
  membar 0x40
  
  clr %g1
  clr %g2
  clr %l1
  setx  0x0123456789abcdef, %l1, %g2
  clr %l2
  mov 0x1, %l2
  sllx %l2, 22, %l2
  clr %l3
  mov 100, %l3
st_to_L2_way0_and_MCU0:
  stx %g2, [%g1]
  membar 0x40
  clr %l4
  add %g1, %l2, %l4
  stx %g2, [%l4]
  membar 0x40
  add %g1, 0x200, %g1
  sub %l3, 1, %l3
  brnz %l3,st_to_L2_way0_and_MCU0
  nop

  clr %g1
  clr %l2
  mov 200, %l2
ld_from_error_and_nonerror_address_b0:
  ld [%g1], %l1
  membar 0x40
  add %g1, 0x100, %g1
  sub %l2, 1, %l2
  brnz %l2,ld_from_error_and_nonerror_address_b0
  nop

  clr %g1
  mov 0x1, %g1
  sllx %g1, 32, %g1
  clr %g2
  mov 0x1, %g2
  sllx %g2, 22, %g2
  clr %g3
  mov 100, %g3

ld_from_L2_bank0_for_CRC:
  ldx [%g1], %l1
  membar 0x40
  add %g1, %g2, %g1
  sub %g3, 1, %g3
  brnz %g3,ld_from_L2_bank0_for_CRC
  nop
  
check_DRAM_ESR_MCU0_L2B0_FBR:
  !clr %l1
  !mov   0xf, %l1
  !sllx  %l1, 60, %l1
  !clr %l2
  !mov   0x3, %l2
  !sllx  %l2, 54, %l2
  !or    %l1, %l2, %l1
  ldx   [%g6], %l0
  clr %l4
  set   0xffff, %l4
  andn  %l0, %l4, %l0
  !cmp   %l0, %l1
  !bne   %xcc, test_fail
  !nop

check_L2_ESR_Bank_0_DSC:
  !clr %l1
  !mov   0x3, %l1
  !sllx  %l1, 62, %l1
  !clr %l2
  !mov 0x3, %l2
  !sllx %l2, 41, %l2
  !or %l1, %l2, %l1
  !clr %l3
  !mov 0xb, %l3
  !sllx %l3, 35, %l3
  !or %l1, %l3, %l1
  ldx   [%g7], %l0
  clr %l2
  clr %l3
  setx 0xf03fffffffffffff, %l2, %l3 !get rid of VCID [59:54]
  and %l0, %l3, %l0
  !cmp   %l0, %l1
  !bne   %xcc, test_fail
  !nop

  ba    test_pass
  nop

main_t1:
  ba L2B1_Init
  nop

L2B1_Init:

clear_DRAM_ESR_MCU0_BANK1:
  clr %l0
  clr %l1
  setx  DRAM_ES_W1C_VALUE, %l0, %g2
  setx  0x8400000280, %l1, %g6
  stx   %g2, [%g6]
clear_L2_ESR_B1:
  clr %l0
  clr %l1
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  0xbb00000040, %l1, %g7
  stx   %g4, [%g7]
  
set_DRAM_error_inject_mcu0_b1:
  mov   0x2, %l1
  !mov   0x1, %l2
  !sllx  %l2, DRAM_EI_SSHOT, %l2
  !or    %l1, %l2, %l1
  mov   0x1, %l3
  sllx  %l3, 31, %l3
  or    %l1, %l3, %l1
  setx  0x8400000290, %l0, %g4
  stx   %l1, [%g4]
  membar 0x40

set_L2_Direct_Mapped_Mode_b1:
  clr %l0
  clr %g1
  setx  0xa900000040, %l0, %g1
  mov   0x2, %l0
  stx   %l0, [%g1]
  membar 0x40
  
  clr %g1
  add %g1, 0x40, %g1
  clr %g2
  clr %l1
  setx  0x0123456789abcdef, %l1, %g2
  clr %l2
  mov 0x1, %l2
  sllx %l2, 22, %l2
  clr %l3
  mov 100, %l3
st_to_L2_way1_and_MCU0:
  stx %g2, [%g1]
  membar 0x40
  clr %l4
  add %g1, %l2, %l4
  stx %g2, [%l4]
  membar 0x40
  add %g1, 0x200, %g1
  sub %l3, 1, %l3
  brnz %l3,st_to_L2_way1_and_MCU0
  nop

  clr %g1
  add %g1, 0x40, %g1
  clr %l2
  mov 200, %l2
ld_from_error_and_nonerror_address_b1:
  ld [%g1], %l1
  membar 0x40
  add %g1, 0x100, %g1
  sub %l2, 1, %l2
  brnz %l2,ld_from_error_and_nonerror_address_b1
  nop

  clr %g1
  mov 0x1, %g1
  sllx %g1, 32, %g1
  add %g1, 0x40, %g1
  clr %g2
  mov 0x1, %g2
  sllx %g2, 22, %g2
  clr %g3
  mov 100, %g3

ld_from_L2_bank1_for_CRC:
  ldx [%g1], %l1
  membar 0x40
  add %g1, %g2, %g1
  sub %g3, 1, %g3
  brnz %g3,ld_from_L2_bank1_for_CRC
  nop
  
check_DRAM_ESR_MCU0_L2B1_FBR:
  !clr %l1
  !mov   0xf, %l1
  !sllx  %l1, 60, %l1
  !clr %l2
  !mov   0x3, %l2
  !sllx  %l2, 54, %l2
  !or    %l1, %l2, %l1
  ldx   [%g6], %l0
  clr %l4
  set   0xffff, %l4
  andn  %l0, %l4, %l0
  !cmp   %l0, %l1
  !bne   %xcc, test_fail
  !nop

check_L2_ESR_Bank_1_DSC:
  !clr %l1
  !mov   0x3, %l1
  !sllx  %l1, 62, %l1
  !clr %l2
  !mov 0x3, %l2
  !sllx %l2, 41, %l2
  !or %l1, %l2, %l1
  !clr %l3
  !mov 0xb, %l3
  !sllx %l3, 35, %l3
  !or %l1, %l3, %l1
  ldx   [%g7], %l0
  clr %l2
  clr %l3
  setx 0xf03fffffffffffff, %l2, %l3 !get rid of VCID [59:54]
  and %l0, %l3, %l0
  !cmp   %l0, %l1
  !bne   %xcc, test_fail
  !nop

  ba    test_pass
  nop

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

