/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_asm_ucb_accesses_fc_a.s
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

  nop
  membar #Sync 
  ! from this point down to chkJtagWrBank0, added to diag, from copy of l2 diag  
  setx	0x8500000000, %g1, %g2  ! bits [3:0] RW
  membar #Sync

  mov	0xf, %g5  !added to test regress sim item with '%g5 unexp range change message'
  mov	0xf, %l0
  stx	%l0, [%g2]
  nop
  nop
  ldx	[%g2], %g5
  membar #Sync
  cmp	%g5, %l0
  nop
  bne   test_fail
  nop 
  membar #Sync

  mov   0xa, %l0
  stx	%l0, [%g2]
  nop
  nop
  ldx	[%g2], %g5
  membar #Sync
  cmp	%g5, %l0
  nop
  bne	test_fail
  nop
  membar #Sync

  mov   0x5, %l0
  stx	%l0, [%g2]
  nop
  nop
  ldx	[%g2], %g5
  membar #Sync
  cmp	%g5, %l0
  nop
  bne	test_fail
  nop
  membar #Sync

  mov   0x0, %l0
  stx	%l0, [%g2]
  nop
  nop
  ldx	[%g2], %g5
  membar #Sync
  cmp	%g5, %l0
  nop
  bne	test_fail
  nop
  membar #Sync

  mov   0x2, %l0
  stx	%l0, [%g2]
  nop
  nop
  ldx	[%g2], %g5
  membar #Sync
  cmp	%g5, %l0
  nop
  bne	test_fail
  nop
  membar #Sync

  mov   0x3, %l0
  stx	%l0, [%g2]
  nop
  nop
  ldx	[%g2], %g5
  membar #Sync
  cmp	%g5, %l0
  nop
  bne	test_fail
  nop
  membar #Sync


  ! These ldx do asm accesses to 0x85 MBIST mode csr
  ! These accesses occur during jtag tcu creg rds of DMU csr 
  ! This tests simultaneous access across ucb between tcu & ncu

chkJtagWrBank0:
  nop
  ldx	[%g4], %g6
  membar #Sync
  cmp	%g6, %g0
  nop
  nop
  nop
  membar #Sync 
  nop
  beq	 chkJtagWrBank0
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


