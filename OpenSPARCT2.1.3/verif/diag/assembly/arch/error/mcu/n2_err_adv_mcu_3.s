/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_mcu_3.s
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
  cmp  %o1, 0x2
  be  main_t2
  nop
  cmp  %o1, 0x3
  be  main_t3
  nop
  cmp  %o1, 0x4
  be  main_t4
  nop
  cmp  %o1, 0x5
  be  main_t5
  nop
  cmp  %o1, 0x6
  be  main_t6
  nop
  cmp  %o1, 0x7
  be  main_t7
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


clear_DRAM_ESR_MCU0_B0:
  clr %l0
  clr %l1
  setx  DRAM_ES_W1C_VALUE, %l0, %g2
  setx  0x8400000280, %l1, %g6
  stx   %g2, [%g6]
clear_L2_ESR_BANK_0:
  clr %l0
  clr %l1
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  0xbb00000000, %l1, %g7
  stx   %g4, [%g7]

  clr %g1
  mov 0x1, %g1
  sllx %g1, 32, %g1
  clr %g2
  mov 0x1, %g2
  sllx %g2, 22, %g2
  clr %g3
  mov 100, %g3

ld_from_L2_bank0:
  ldx [%g1], %l7
  membar 0x40
  add %g1, %g2, %g1
  sub %g3, 1, %g3
  brnz %g3,ld_from_L2_bank0
  nop
  
check_DRAM_ESR_MCU0_DAC_and_MEC_B0:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 61, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  set   0xffff, %l3
  ldx   [%g6], %l0
  andn  %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

check_L2_ESR_Bank_0_DAC_and_MEC:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 42, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  mov   0x1, %l3
  sllx  %l3, 36, %l3
  or    %l1, %l3, %l1
  ldx   [%g7], %l0
  clr %l2
  clr %l3
  setx 0xf03fffffffffffff, %l2, %l3 !get rid of VCID [59:54]
  and %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop
  
  ba    test_pass
  nop

main_t1:
  ba L2B1_Init
  nop

L2B1_Init:

clear_DRAM_ESR_MCU0_B1:
  clr %l0
  clr %l1
  setx  DRAM_ES_W1C_VALUE, %l0, %g2
  setx  0x8400000280, %l1, %g6
  stx   %g2, [%g6]
clear_L2_ESR_BANK_1:
  clr %l0
  clr %l1
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  0xbb00000040, %l1, %g7
  stx   %g4, [%g7]

 clr %g1
 mov 0x1, %g1
 sllx %g1, 32, %g1
 add %g1, 0x40, %g1
 clr %g2
 mov 0x1, %g2
 sllx %g2, 22, %g2
 clr %g3
 mov 100, %g3

ld_from_L2_bank1:
 ldx [%g1], %l7
 membar 0x40
 add %g1, %g2, %g1
 sub %g3, 1, %g3
 brnz %g3,ld_from_L2_bank1
 nop

check_DRAM_ESR_MCU0_DAC_and_MEC_B1:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 61, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  set   0xffff, %l3
  ldx   [%g6], %l0
  andn  %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

check_L2_ESR_Bank_1_DAC_and_MEC:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 42, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  mov   0x1, %l3
  sllx  %l3, 36, %l3
  or    %l1, %l3, %l1
  ldx   [%g7], %l0
  clr %l2
  clr %l3
  setx 0xf03fffffffffffff, %l2, %l3 !get rid of VCID [59:54]
  and %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop
  
  ba    test_pass
  nop

main_t2:
  ba L2B2_Init
  nop

L2B2_Init:

clear_DRAM_ESR_MCU1_B2:
  clr %l0
  clr %l1
  setx  DRAM_ES_W1C_VALUE, %l0, %g2
  setx  0x8400001280, %l1, %g6
  stx   %g2, [%g6]
clear_L2_ESR_BANK_2:
  clr %l0
  clr %l1
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  0xbb00000080, %l1, %g7
  stx   %g4, [%g7]
 
 clr %g1
 mov 0x1, %g1
 sllx %g1, 32, %g1
 add %g1, 0x80, %g1
 clr %g2
 mov 0x1, %g2
 sllx %g2, 22, %g2
 clr %g3
 mov 100, %g3

ld_from_L2_bank2:
 ldx [%g1], %l7
 membar 0x40
 add %g1, %g2, %g1
 sub %g3, 1, %g3
 brnz %g3,ld_from_L2_bank2
 nop

check_DRAM_ESR_MCU1_DAC_and_MEC_B2:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 61, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  set   0xffff, %l3
  ldx   [%g6], %l0
  andn  %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

check_L2_ESR_Bank_2_DAC_and_MEC:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 42, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  mov   0x1, %l3
  sllx  %l3, 36, %l3
  or    %l1, %l3, %l1
  ldx   [%g7], %l0
  clr %l2
  clr %l3
  setx 0xf03fffffffffffff, %l2, %l3 !get rid of VCID [59:54]
  and %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

  ba    test_pass
  nop

main_t3:
  ba L2B3_Init
  nop

L2B3_Init:

clear_DRAM_ESR_MCU1_B3:
  clr %l0
  clr %l1
  setx  DRAM_ES_W1C_VALUE, %l0, %g2
  setx  0x8400001280, %l1, %g6
  stx   %g2, [%g6]
clear_L2_ESR_BANK_3:
  clr %l0
  clr %l1
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  0xbb000000c0, %l1, %g7
  stx   %g4, [%g7]
 
 clr %g1
 mov 0x1, %g1
 sllx %g1, 32, %g1
 add %g1, 0xc0, %g1
 clr %g2
 mov 0x1, %g2 
 sllx %g2, 22, %g2
 clr %g3
 mov 100, %g3

ld_from_L2_bank3:
 ldx [%g1], %l7
 membar 0x40
 add %g1, %g2, %g1
 sub %g3, 1, %g3
 brnz %g3,ld_from_L2_bank3
 nop

check_DRAM_ESR_MCU1_DAC_and_MEC_B3:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 61, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  set   0xffff, %l3
  ldx   [%g6], %l0
  andn  %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

check_L2_ESR_Bank_3_DAC_and_MEC:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 42, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  mov   0x1, %l3
  sllx  %l3, 36, %l3
  or    %l1, %l3, %l1
  ldx   [%g7], %l0
  clr %l2
  clr %l3
  setx 0xf03fffffffffffff, %l2, %l3 !get rid of VCID [59:54]
  and %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop
  
  ba    test_pass
  nop

main_t4:
  ba L2B4_Init
  nop

L2B4_Init:

clear_DRAM_ESR_MCU2_B4:
  clr %l0
  clr %l1
  setx  DRAM_ES_W1C_VALUE, %l0, %g2
  setx  0x8400002280, %l1, %g6
  stx   %g2, [%g6]
clear_L2_ESR_BANK_4:
  clr %l0
  clr %l1
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  0xbb00000100, %l1, %g7
  stx   %g4, [%g7]
 
 clr %g1
 mov 0x1, %g1
 sllx %g1, 32, %g1
 add %g1, 0x100, %g1
 clr %g2
 mov 0x1, %g2
 sllx %g2, 22, %g2
 clr %g3
 mov 100, %g3

ld_from_L2_bank4:
 ldx [%g1], %l7
 membar 0x40
 add %g1, %g2, %g1
 sub %g3, 1, %g3
 brnz %g3,ld_from_L2_bank4
 nop

check_DRAM_ESR_MCU2_DAC_and_MEC_B4:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 61, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  set   0xffff, %l3
  ldx   [%g6], %l0
  andn  %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

check_L2_ESR_Bank_4_DAC_and_MEC:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 42, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  mov   0x1, %l3
  sllx  %l3, 36, %l3
  or    %l1, %l3, %l1
  ldx   [%g7], %l0
  clr %l2
  clr %l3
  setx 0xf03fffffffffffff, %l2, %l3 !get rid of VCID [59:54]
  and %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

  ba    test_pass
  nop

main_t5:
  ba L2B5_Init
  nop

L2B5_Init:

clear_DRAM_ESR_MCU2_B5:
  clr %l0
  clr %l1
  setx  DRAM_ES_W1C_VALUE, %l0, %g2
  setx  0x8400002280, %l1, %g6
  stx   %g2, [%g6]
clear_L2_ESR_BANK_5:
  clr %l0
  clr %l1
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  0xbb00000140, %l1, %g7
  stx   %g4, [%g7]
 
 clr %g1
 mov 0x1, %g1
 sllx %g1, 32, %g1
 add %g1, 0x140, %g1
 clr %g2
 mov 0x1, %g2
 sllx %g2, 22, %g2
 clr %g3
 mov 100, %g3

ld_from_L2_bank5:
 ldx [%g1], %l7
 membar 0x40
 add %g1, %g2, %g1
 sub %g3, 1, %g3
 brnz %g3,ld_from_L2_bank5
 nop

check_DRAM_ESR_MCU2_DAC_and_MEC_B5:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 61, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  set   0xffff, %l3
  ldx   [%g6], %l0
  andn  %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

check_L2_ESR_Bank_5_DAC_and_MEC:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 42, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  mov   0x1, %l3
  sllx  %l3, 36, %l3
  or    %l1, %l3, %l1
  ldx   [%g7], %l0
  clr %l2
  clr %l3
  setx 0xf03fffffffffffff, %l2, %l3 !get rid of VCID [59:54]
  and %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop
 
  ba    test_pass
  nop

main_t6:
  ba L2B6_Init
  nop

L2B6_Init:
  
clear_DRAM_ESR_MCU3_B6:
  clr %l0
  clr %l1
  setx  DRAM_ES_W1C_VALUE, %l0, %g2
  setx  0x8400003280, %l1, %g6
  stx   %g2, [%g6]
clear_L2_ESR_BANK_6:
  clr %l0
  clr %l1
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  0xbb00000180, %l1, %g7
  stx   %g4, [%g7]
 
 clr %g1
 mov 0x1, %g1
 sllx %g1, 32, %g1
 add %g1, 0x180, %g1
 clr %g2
 mov 0x1, %g2
 sllx %g2, 22, %g2
 clr %g3
 mov 100, %g3

ld_from_L2_bank6:
 ldx [%g1], %l7
 membar 0x40
 add %g1, %g2, %g1
 sub %g3, 1, %g3
 brnz %g3,ld_from_L2_bank6
 nop

check_DRAM_ESR_MCU3_DAC_and_MEC_B6:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 61, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  set   0xffff, %l3
  ldx   [%g6], %l0
  andn  %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

check_L2_ESR_Bank_6_DAC_and_MEC:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 42, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  mov   0x1, %l3
  sllx  %l3, 36, %l3
  or    %l1, %l3, %l1
  ldx   [%g7], %l0
  clr %l2
  clr %l3
  setx 0xf03fffffffffffff, %l2, %l3 !get rid of VCID [59:54]
  and %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

  ba    test_pass
  nop

main_t7:
  ba L2B7_Init
  nop

L2B7_Init:
  
clear_DRAM_ESR_MCU3_B7:
  clr %l0
  clr %l1
  setx  DRAM_ES_W1C_VALUE, %l0, %g2
  setx  0x8400003280, %l1, %g6
  stx   %g2, [%g6]
clear_L2_ESR_BANK_7:
  clr %l0
  clr %l1
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  0xbb000001c0, %l1, %g7
  stx   %g4, [%g7]
 
 clr %g1
 mov 0x1, %g1
 sllx %g1, 32, %g1
 add %g1, 0x1c0, %g1
 clr %g2
 mov 0x1, %g2
 sllx %g2, 22, %g2
 clr %g3
 mov 100, %g3

ld_from_L2_bank7:
 ldx [%g1], %l7
 membar 0x40
 add %g1, %g2, %g1
 sub %g3, 1, %g3
 brnz %g3,ld_from_L2_bank7
 nop

check_DRAM_ESR_MCU3_DAC_and_MEC_B7:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 61, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  set   0xffff, %l3
  ldx   [%g6], %l0
  andn  %l0, %l3, %l0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

check_L2_ESR_Bank_7_DAC_and_MEC:
  clr %l1
  mov   0x1, %l1
  sllx  %l1, 42, %l1
  clr %l2
  mov   0x1, %l2
  sllx  %l2, 62, %l2
  or    %l1, %l2, %l1
  clr %l3
  mov   0x1, %l3
  sllx  %l3, 36, %l3
  or    %l1, %l3, %l1
  ldx   [%g7], %l0
  clr %l2
  clr %l3
  setx 0xf03fffffffffffff, %l2, %l3 !get rid of VCID [59:54]
  and %l0, %l3, %l0
  cmp   %l0, %l1
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

