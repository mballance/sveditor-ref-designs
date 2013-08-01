/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_dram_1b_sshot_notrap.s
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

#ifdef MCU0
#define  L2_ENTRY_PA0        0x20200000
#define  L2_ENTRY_PA1        0x21200000
#define  L2_ENTRY_PA2        0x22200000
#define  L2_ENTRY_PA3        0x23200000
#define  L2_ENTRY_PA4        0x24200000
#define  L2_ENTRY_PA5        0x25200000
#define  L2_ENTRY_PA6        0x26200000
#define  L2_ENTRY_PA7        0x27200000
#define  L2_ENTRY_PA8        0x28200000
#define  L2_ENTRY_PA9        0x29200000
#define  L2_ENTRY_PAa        0x2a200000
#define  L2_ENTRY_PAb        0x2b200000
#define  L2_ENTRY_PAc        0x2c200000
#define  L2_ENTRY_PAd        0x2d200000
#define  L2_ENTRY_PAe        0x2e200000
#define  L2_ENTRY_PAf        0x2f200000
#define  L2_ENTRY_PA10       0x30200000
#define  L2_ENTRY_PA11        0x31200000
#define  L2_ENTRY_PA12        0x32200000

#define  DRAM_ERR_INJ_REG   0x8400000290
#define  DRAM_ERR_STAT_REG  0x8400000280
#define  L2_ERR_STAT_REG    0xAB00000000
#define  L2_ERR_ADDR_REG    0xAC00000000

#define	 ERROR_ADDR	    0x20200000
#endif


#ifdef MCU1
#define  L2_ENTRY_PA0        0x20200080
#define  L2_ENTRY_PA1        0x21200080
#define  L2_ENTRY_PA2        0x22200080
#define  L2_ENTRY_PA3        0x23200080
#define  L2_ENTRY_PA4        0x24200080
#define  L2_ENTRY_PA5        0x25200080
#define  L2_ENTRY_PA6        0x26200080
#define  L2_ENTRY_PA7        0x27200080
#define  L2_ENTRY_PA8        0x28200080
#define  L2_ENTRY_PA9        0x29200080
#define  L2_ENTRY_PAa        0x2a200080
#define  L2_ENTRY_PAb        0x2b200080
#define  L2_ENTRY_PAc        0x2c200080
#define  L2_ENTRY_PAd        0x2d200080
#define  L2_ENTRY_PAe        0x2e200080
#define  L2_ENTRY_PAf        0x2f200080
#define  L2_ENTRY_PA10       0x30200080
#define  L2_ENTRY_PA11       0x31200080
#define  L2_ENTRY_PA12       0x32200080

#define  DRAM_ERR_INJ_REG   0x8400001290
#define  DRAM_ERR_STAT_REG  0x8400001280
#define  L2_ERR_STAT_REG    0xAB00000080
#define  L2_ERR_ADDR_REG    0xAC00000080

#define  ERROR_ADDR         0x20200080

#endif


#ifdef MCU2
#define  L2_ENTRY_PA0        0x20200100
#define  L2_ENTRY_PA1        0x21200100
#define  L2_ENTRY_PA2        0x22200100
#define  L2_ENTRY_PA3        0x23200100
#define  L2_ENTRY_PA4        0x24200100
#define  L2_ENTRY_PA5        0x25200100
#define  L2_ENTRY_PA6        0x26200100
#define  L2_ENTRY_PA7        0x27200100
#define  L2_ENTRY_PA8        0x28200100
#define  L2_ENTRY_PA9        0x29200100
#define  L2_ENTRY_PAa        0x2a200100
#define  L2_ENTRY_PAb        0x2b200100
#define  L2_ENTRY_PAc        0x2c200100
#define  L2_ENTRY_PAd        0x2d200100
#define  L2_ENTRY_PAe        0x2e200100
#define  L2_ENTRY_PAf        0x2f200100
#define  L2_ENTRY_PA10       0x30200100
#define  L2_ENTRY_PA11       0x31200100
#define  L2_ENTRY_PA12       0x32200100

#define  DRAM_ERR_INJ_REG   0x8400002290
#define  DRAM_ERR_STAT_REG  0x8400002280
#define  L2_ERR_STAT_REG    0xAB00000100
#define  L2_ERR_ADDR_REG    0xAC00000100

#define  ERROR_ADDR         0x20200100

#endif

#ifdef MCU3
#define  L2_ENTRY_PA0        0x20200180
#define  L2_ENTRY_PA1        0x21200180
#define  L2_ENTRY_PA2        0x22200180
#define  L2_ENTRY_PA3        0x23200180
#define  L2_ENTRY_PA4        0x24200180
#define  L2_ENTRY_PA5        0x25200180
#define  L2_ENTRY_PA6        0x26200180
#define  L2_ENTRY_PA7        0x27200180
#define  L2_ENTRY_PA8        0x28200180
#define  L2_ENTRY_PA9        0x29200180
#define  L2_ENTRY_PAa        0x2a200180
#define  L2_ENTRY_PAb        0x2b200180
#define  L2_ENTRY_PAc        0x2c200180
#define  L2_ENTRY_PAd        0x2d200180
#define  L2_ENTRY_PAe        0x2e200180
#define  L2_ENTRY_PAf        0x2f200180
#define  L2_ENTRY_PA10       0x30200180
#define  L2_ENTRY_PA11       0x31200180
#define  L2_ENTRY_PA12       0x32200180

#define  DRAM_ERR_INJ_REG   0x8400003290
#define  DRAM_ERR_STAT_REG  0x8400003280
#define  L2_ERR_STAT_REG    0xAB00000180
#define  L2_ERR_ADDR_REG    0xAC00000180

#define  ERROR_ADDR         0x20200180

#endif


#define  TEST_DATA0         0x1000100081c3e008
#define  TEST_DATA1         0x2000200081c3e008
#define  TEST_DATA2         0x3000300081c3e008
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


.text
.global  main


main:
  ta T_CHANGE_HPRIV

  clr   %o7

#ifdef  RUN_TH1
  mov   0x1, %o7
#endif
#ifdef  RUN_TH2
  mov   0x2, %o7
#endif
#ifdef  RUN_TH3
  mov   0x3, %o7
#endif

  ta    %icc, T_RD_THID
  cmp   %o1, %o7
  bne   test_pass
  nop


clear_dram_esr_0:
  ! Clear DRAM Error status register (Bit[63:57] write-1-clear)
  setx  DRAM_ES_W1C_VALUE, %l0, %g4
  setx  DRAM_ERR_STAT_REG, %l3, %g5  
  stx   %g4, [%g5]

store_first_8_bytes:
  setx  L2_ENTRY_PA0, %l0, %g1
  setx  TEST_DATA0, %l0, %g3
  stx   %g3, [%g1]

set_DRAM_error_inject_ch0:
  mov   0x2, %l1                ! ECC Mask (1-bit error)
  mov   0x1, %l2 		! contineous ; 
  sllx  %l2, DRAM_EI_SSHOT, %l3
  Or    %l1, %l3, %l1           ! Set single shot ; : cont
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG, %l3, %g6 
  stx   %l1, [%g6]
  membar 0x40

  
write_mcu_channel_0:
  setx  L2_ENTRY_PA0, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PA1, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PA2, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PA3, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PA4, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PA5, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PA6, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PA7, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PA8, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PA9, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PAa, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PAb, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PAc, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PAd, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PAe, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PAf, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  setx  L2_ENTRY_PA10, %l0, %g1
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1]
  membar 0x40

clear_l2_ESR:
  ! Write 1 to clear L2 Error status registers
  setx  L2_ERR_STAT_REG, %l3, %l4
  setx  L2_ES_W1C_VALUE, %l0, %l1
  stx   %l1, [%l4]
  nop

read_l2_ESR:
  ldx   [%l4], %i6
 
read_error_address_ch0:
  setx  L2_ENTRY_PA0, %l0, %g1
  ldx   [%g1], %l1

  setx  L2_ENTRY_PA1, %l0, %g1
  ldx   [%g1], %l1

  setx  L2_ENTRY_PA2, %l0, %g1
  ldx   [%g1], %l1

  setx  L2_ENTRY_PA3, %l0, %g1
  ldx   [%g1], %l1

  setx  L2_ENTRY_PA4, %l0, %g1
  ldx   [%g1], %l1

  setx  L2_ENTRY_PA5, %l0, %g1
  ldx   [%g1], %l1
   
check_DRAM_ESR_0:
  mov   0x1, %l1
  sllx  %l1, DRAM_ES_DAC, %l0
  set   0x2000, %l3              ! 16-bit Syndrome - for SECC, it's the mask nibble-reversed
  or    %l0, %l3, %l0            ! %l0 has expected value
  setx  DRAM_ERR_STAT_REG, %l3, %g5  
  ldx   [%g5], %l1
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

check_L2_ESR_0:
  setx  L2_ERR_STAT_REG, %l3, %g5  
  ldx   [%g5], %l6

  setx  0xfffffffff0000000, %l3, %l0
  andcc %l0, %l6, %l5                   ! Donot check L2ESR SYND bits


  mov   0x1, %l1
  sllx  %l1, L2ES_DAC, %l0
  mov   0x1, %l1
  sllx  %l1, L2ES_VEC, %l2
  or    %l0, %l2, %l3

  cmp   %l5, %l3
  bne   %xcc, test_fail
  nop

ch_L2_addr_ch0:
  setx  L2_ERR_ADDR_REG, %l3, %g5  
  ldx   [%g5], %l1
  membar 0x40
	

  ba    test_pass
  nop

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP


test_fail:
ta  T_BAD_TRAP



