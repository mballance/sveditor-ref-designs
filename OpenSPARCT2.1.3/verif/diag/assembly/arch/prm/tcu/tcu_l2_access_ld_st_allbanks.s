/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_l2_access_ld_st_allbanks.s
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


#define  L2_ENTRY_PA        0xa000000000
#define  TEST_DATA0         0x5555555555555555
#define  TEST_DATA1         0xaaaaaaaaaaaaaaaa
#define  TEST_DATA2         0x4c3fdead4c3fbeef
#define  TEST_DATA3         0xdead4c3fbeef4c3f
#define	 L2_ENTRY_PA0        0x2020000008
#define L2_ES_W1C_VALUE     0xc03ffff800000000
#define	 SPARC_ES_W1C_VALUE  0xefffffff
#define  TT_SW_Error        0x40

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

.text
.global	 main

main:

  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV

disable_l1_DCache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove bit 2
  andn  %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

set_L2_Directly_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1      ! Bit 1 in L2 Control Status Register
  mov   0x2, %l0
  stx   %l0, [%g1]


store_to_L2_bank0:
  setx	0x2000aa00, %l0, %g2  ! bits [21:18] select way
  setx  TEST_DATA0, %l0, %g3
  stx   %g3, [%g2] 
  membar #Sync
  nop

  setx	0x302000c0, %l0, %g4  ! Mask for extracting [21:3]
  stx	%g0, [%g4]		! initialize mem addr where JTAG writes back
  membar #Sync
  nop
start_jtag_rd_bank0:
  nop	!$EV trig_pc_d(1, @VA(.MAIN.start_jtag_rd_bank0)) -> jtagRdWrL2(0x002000aa00, TEST_DATA0, 0x00302000c0, 0)

chkJtagWrBank0:
  nop
  ldx	[%g4], %g6
  membar #Sync
  cmp	%g6, %g3
  nop
  nop
  nop
  nop
  bne	 chkJtagWrBank0
  nop
  membar #Sync
  nop


store_to_L2_bank1:
  setx  0x2000aa40, %l0, %g2  ! bits [21:18] select way
  setx  TEST_DATA1, %l0, %g3
  stx   %g3, [%g2]
  membar #Sync
  nop

  setx	0x30200080, %l0, %g4  ! Mask for extracting [21:3]
  stx	%g0, [%g4]		! initialize mem addr where JTAG writes back
  membar #Sync
  nop
start_jtag_rd_bank1:
  nop	!$EV trig_pc_d(1, @VA(.MAIN.start_jtag_rd_bank1)) -> jtagRdWrL2(0x002000aa40, TEST_DATA1, 0x0030200080, 0)

chkJtagWrBank1:
  nop
  ldx	[%g4], %g6
  membar #Sync
  cmp	%g6, %g3
  nop
  nop
  nop
  nop
  bne	 chkJtagWrBank1
  nop
  membar #Sync
  nop


store_to_L2_bank2:
  setx  0x2000aa80, %l0, %g2  ! bits [21:18] select way
  setx  TEST_DATA2, %l0, %g3
  stx   %g3, [%g2]
  membar #Sync
  nop

  setx	0x30200040, %l0, %g4  ! Mask for extracting [21:3]
  stx	%g0, [%g4]		! initialize mem addr where JTAG writes back
  membar #Sync
  nop
start_jtag_rd_bank2:
  nop	!$EV trig_pc_d(1, @VA(.MAIN.start_jtag_rd_bank2)) -> jtagRdWrL2(0x002000aa80, TEST_DATA2, 0x0030200040, 0)

chkJtagWrBank2:
  nop
  ldx	[%g4], %g6
  membar #Sync
  cmp	%g6, %g3
  nop
  nop
  nop
  nop
  bne	 chkJtagWrBank2
  nop
  membar #Sync
  nop


store_to_L2_bank3:
  setx  0x2000aac0, %l0, %g2  ! bits [21:18] select way
  setx  TEST_DATA3, %l0, %g3
  stx   %g3, [%g2]
  membar #Sync
  nop

  setx	0x30200100, %l0, %g4  ! Mask for extracting [21:3]
  stx	%g0, [%g4]		! initialize mem addr where JTAG writes back
  membar #Sync
  nop
start_jtag_rd_bank3:
  nop	!$EV trig_pc_d(1, @VA(.MAIN.start_jtag_rd_bank3)) -> jtagRdWrL2(0x002000aac0, TEST_DATA3, 0x0030200100, 0)

chkJtagWrBank3:
  nop
  ldx	[%g4], %g6
  membar #Sync
  cmp	%g6, %g3
  nop
  nop
  nop
  nop
  bne	 chkJtagWrBank3
  nop
  membar #Sync
  nop


store_to_L2_bank4:
  setx  0x2000a100, %l0, %g2  ! bits [21:18] select way
  setx  TEST_DATA3, %l0, %g3
  stx   %g3, [%g2]
  membar #Sync
  nop

  setx	0x302001c0, %l0, %g4  ! Mask for extracting [21:3]
  stx	%g0, [%g4]		! initialize mem addr where JTAG writes back
  membar #Sync
  nop
start_jtag_rd_bank4:
  nop	!$EV trig_pc_d(1, @VA(.MAIN.start_jtag_rd_bank4)) -> jtagRdWrL2(0x002000a100, TEST_DATA3, 0x00302001c0, 0)

chkJtagWrBank4:
  nop
  ldx	[%g4], %g6
  membar #Sync
  cmp	%g6, %g3
  nop
  nop
  nop
  nop
  bne	 chkJtagWrBank4
  nop
  membar #Sync
  nop


store_to_L2_bank5:
  setx  0x2000a140, %l0, %g2  ! bits [21:18] select way
  setx  TEST_DATA2, %l0, %g3
  stx   %g3, [%g2]
  membar #Sync
  nop

  setx	0x30200180, %l0, %g4  ! Mask for extracting [21:3]
  stx	%g0, [%g4]		! initialize mem addr where JTAG writes back
  membar #Sync
  nop
start_jtag_rd_bank5:
  nop	!$EV trig_pc_d(1, @VA(.MAIN.start_jtag_rd_bank5)) -> jtagRdWrL2(0x002000a140, TEST_DATA2, 0x0030200180, 0)

chkJtagWrBank5:
  nop
  ldx	[%g4], %g6
  membar #Sync
  cmp	%g6, %g3
  nop
  nop
  nop
  nop
  bne	 chkJtagWrBank5
  nop
  membar #Sync
  nop


store_to_L2_bank6:
  setx  0x2000a180, %l0, %g2  ! bits [21:18] select way
  setx  TEST_DATA1, %l0, %g3
  stx   %g3, [%g2]
  membar #Sync
  nop

  setx	0x30200140, %l0, %g4  ! Mask for extracting [21:3]
  stx	%g0, [%g4]		! initialize mem addr where JTAG writes back
  membar #Sync
  nop
start_jtag_rd_bank6:
  nop	!$EV trig_pc_d(1, @VA(.MAIN.start_jtag_rd_bank6)) -> jtagRdWrL2(0x002000a180, TEST_DATA1, 0x0030200140, 0)

chkJtagWrBank6:
  nop
  ldx	[%g4], %g6
  membar #Sync
  cmp	%g6, %g3
  nop
  nop
  nop
  nop
  bne	 chkJtagWrBank6
  nop
  membar #Sync
  nop


store_to_L2_bank7:
  setx  0x2000a1c0, %l0, %g2  ! bits [21:18] select way
  setx  TEST_DATA0, %l0, %g3
  stx   %g3, [%g2]
  membar #Sync
  nop

  setx	0x30200200, %l0, %g4  ! Mask for extracting [21:3]
  stx	%g0, [%g4]		! initialize mem addr where JTAG writes back
  membar #Sync
  nop
start_jtag_rd_bank7:
  nop	!$EV trig_pc_d(1, @VA(.MAIN.start_jtag_rd_bank7)) -> jtagRdWrL2(0x002000a1c0, TEST_DATA0, 0x0030200200, 0)

chkJtagWrBank7:
  nop
  ldx	[%g4], %g6
  membar #Sync
  cmp	%g6, %g3
  nop
  nop
  nop
  nop
  bne	 chkJtagWrBank7
  nop
  membar #Sync
  nop


enable_l1_DCache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

  ba    test_pass
  nop


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP


