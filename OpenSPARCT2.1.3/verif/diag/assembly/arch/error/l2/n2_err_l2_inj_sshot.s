/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_l2_inj_sshot.s
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


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

.text
.global  main

#define  L2_ENTRY_PA        0x400500000
#define  L2_BANK_ADDR       0x80
#define  DRAM_CHANNEL_ADDR  0x2000
#define  TEST_DATA0         0x5555555555555555 
#define  TEST_DATA1         0xaaaaaaaaaaaaaaaa
#define  TEST_DATA2         0x3000300081c3e008
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000

#define  L2_ES_W1C_VALUE    0xc03ffff800000000

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

#define  DC_ENTRY_PA0        0x20200000
#define  DC_ENTRY_PA1        0x20200800
#define  DC_ENTRY_PA2        0x20201000
#define  DC_ENTRY_PA3        0x20201800
#define  DC_ENTRY_PA4        0x20202000
#define  DC_ENTRY_PA5        0x20202800
#define  DC_ENTRY_PA6        0x20203000
#define  DC_ENTRY_PA7        0x20203800
#define  DC_ENTRY_PA8        0x20204000
#define  DC_ENTRY_PA9        0x20204800
#define  DC_ENTRY_PAa        0x20205000
#define  DC_ENTRY_PAb        0x20205800


main:
  ta T_CHANGE_HPRIV


clear_l2_ESR:
  ! Write 1 to clear L2 Error status registers
  setx  L2ES_PA0, %l3, %l4
  setx  L2_ES_W1C_VALUE, %l0, %l1
  stx   %l1, [%l4]
  nop

create_entry:
  setx  TEST_DATA0, %l2, %l1

  setx  DC_ENTRY_PA0, %l0, %g1
  stx   %l1, [%g1]

  setx  DC_ENTRY_PA1, %l0, %g1
  stx   %l1, [%g1]

  setx  DC_ENTRY_PA2, %l0, %g1
  stx   %l1, [%g1]

  setx  DC_ENTRY_PA3, %l0, %g1
  stx   %l1, [%g1]


Enable_err_inj_reg:
  setx  L2EI_PA0, %l3, %l4
  set   0x3, %l1
  stx   %l1, [%l4]
  nop
  ldx	[%l4], %o1

update_directory:
  setx  TEST_DATA0, %l2, %l1

  setx  DC_ENTRY_PA4, %l0, %g1
  stx   %l1, [%g1]

  setx  DC_ENTRY_PA5, %l0, %g1
  stx   %l1, [%g1]

  setx  DC_ENTRY_PA6, %l0, %g1
  stx   %l1, [%g1]

  setx  DC_ENTRY_PA7, %l0, %g1
  stx   %l1, [%g1]

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

check_L2_ESR_0:
  setx  L2ES_PA0, %l3, %g5  
  ldx   [%g5], %l6
  setx  0x8000100800000000, %l2, %o2;
  cmp %o2, %l6
  bne %xcc, test_fail
  nop
  nop

ch_L2_addr_ch0:
  setx  L2EA_PA0, %l3, %g5  
  ldx   [%g5], %l1
  membar 0x40

ba test_pass
nop


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD


