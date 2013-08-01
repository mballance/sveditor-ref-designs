/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_l2_LTC_4bnk_cecc_trap.s
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


#define  L2_ENTRY_PA        0xa400000000
#define  TEST_DATA1         0x5555555555555555
#define	 L2_ENTRY_PA0       0x2020000008
#define L2_ES_W1C_VALUE     0xc03ffff800000000

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

enable_err_reporting:
  setx L2EE_PA0, %l0, %l1
  ldx  [%l1], %l2
  mov  0x3, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]


clear_l2_ESR:
  setx  L2_ES_W1C_VALUE, %l0, %l1
  setx  L2ES_PA0, %l6, %g1
  stx   %l1, [%g1]


set_L2_Directly_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1      ! Bit 1 in L2 Control Status Register
  mov   0x2, %l0
  stx   %l0, [%g1]

store_to_L2:
  setx  TEST_DATA1, %l0, %g5

store_to_L2_way0:
  set	0xaa81f000, %g2  ! bits [16:8] select index in 4 bank mode
  stx %g5, [%g2] 
  stx %g5, [%g2+8]
  membar #Sync

clr %g1
mov 0x9,%l0
loop:
inc %g1
cmp %g1,%l0
bne loop
nop


L2_diag_load:
  setx 0xa40003e000,%l0,%g5
  ldx	[%g5], %g6
  membar #Sync

! Flip one bits to inject error
  xor	 %g6, 0x200, %g6
  stx	%g6, [%g5]
  membar #Sync

!This should cause LTC
reading_back_0:                 !Load to L2 again to get the LTC logged in ESR
  ldx   [%g2], %l6
  membar #Sync  

clr %g1
mov 0x9,%l0
loop1:
inc %g1
cmp %g1,%l0
bne loop1
nop


end_of_first_LTC_inject:
nop

fill:
  set   0xaaaff000, %g2  ! bits [16:8] select index in 4 bank mode
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync

clr %g1
mov 0x9,%l0
loop2:
inc %g1
cmp %g1,%l0
bne loop2
nop

ldx_to_same_index_no_LTC:
  set   0xaa81f000, %g2  ! bits [16:8] select index in 4 bank mode
  ldx    [%g2],%g5
  membar #Sync


clr %g1
mov 0x9,%l0
loop3:
inc %g1
cmp %g1,%l0
bne loop3
nop

compute_error:
  mov   0x1, %l1
  sllx  %l1, L2ES_LTC, %l7
  sllx  %l1, L2ES_VEC, %l3
  or    %l7, %l3, %l7

check_l2_ESR:
  setx  L2ES_PA0, %l6, %g1
  ldx   [%g1], %l4
  membar #Sync

  cmp   %l7,  %l4
  bne   test_fail
  nop


check_l2_EAR:
  setx  L2EA_PA0, %l6, %l3
  ldx   [%l3], %l4
  membar #Sync

  set   0xaa81f000, %g2  ! bits [16:8] select index in 4 bank mode
  cmp   %g2, %l4
  bne   test_fail
  nop
  ! Check if a Corrected ECC Trap happened
check_error_trap:
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_Corrected_ECC, %l0
  cmp   %o1, %l0
  bne   test_fail
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
