/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_mcu.s
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

disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

!  begin
clear_DRAM_ESR:
  clr %l0
  clr %l1
  setx  DRAM_ES_W1C_VALUE, %l0, %g2
  setx  0x8400000280, %l1, %g6
  stx   %g2, [%g6]
clear_L2_ESR:
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
  ldx [%g1], %l1
  membar 0x40
  add %g1, %g2, %g1
  sub %g3, 1, %g3
  brnz %g3,ld_from_L2_bank0
  nop
  
check_DRAM_ESR_DAC_and_MEC:
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

check_L2_ESR_DAC_and_MEC:
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


