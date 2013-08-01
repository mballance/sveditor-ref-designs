/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_L2_LDWC_trap_pending.s
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

#define MAIN_PAGE_HV_ALSO

#define	 L2_ENTRY_PA	  0x517590000
#define  TEST_DATA        0x555555555555555
#define  L2_ES_W1C_VALUE  0xc03ffff800000000
#define  REG_PSTATE_IE    0x2


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

.text
.global	 main
.global	 My_Corrected_ECC_error_trap


main:


  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV

  setx  L2_ES_W1C_VALUE, %l0, %g4

!PSTATE.IE is set to 0
keep_trap_pending:
  rdpr  %pstate,%g1
  wrpr  %g1,REG_PSTATE_IE,%pstate
  rdpr  %pstate,%g1


  ! Now access L2 control and status registers
disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


enable_err_reporting:
  setx L2EE_PA0, %l0, %l1
  ldx  [%l1], %l2
  mov  0x1, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]


  ! Write 1 to clear L2 Error status registers

clear_l2_ESR:
  setx  L2ES_PA0, %l3, %l4
  stx   %g4, [%l4]
  nop


set_L2_Directly_Mapped_Mode:
  setx	L2CS_PA0, %l6, %g1
  mov	0x2, %l0
  stx	%l0, [%g1]


store_to_L2_way0:
  setx  TEST_DATA, %l0, %g5
  setx  0x202000aa00, %l0, %g1
  stx %g5, [%g1]
  stx %g5, [%g1+8]
  membar #Sync


way_found:
  ! Read L2 Data Diag - %g2 has the "way"
  ! Addressing: [39:32] See PRM, [22] odd/even word, [21:18] way, [17:8] set, [7:6] bank, [5:3] D-word, [2:0] = 0
  setx  0x3fff8, %l0, %l2       ! Mask for extracting [17:3]
  and   %g1, %l2, %g5

  mov   0xa3, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %g5, %l0, %g5           ! %g5 has L2 Data Diag addressing


read_l2_data_diag:
  ldx   [%g5], %g6

  ! Flip one bit from the data field
  xor   %g6, 0x80, %g6          ! save on %g6 for future reference
write_back_with_error:
  stx   %g6, [%g5]


  ! Now do another store with the same index but different tag - to force a Write-Back
error_address:
  mov   0x1, %l0
  sllx  %l0, 28, %l0
  xor   %g1, %l0, %l1             ! Flip bit 28 of previous L2 entry PA

  ! This should cause L2 LDWC (bit 51)
store_to_L2_with_error:
  st    %g5, [%l1]
  membar #Sync
  

enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


  ! Compute expected value of L2 error status register
compute_expected_L2_ESR:
  mov   0x1, %l1
  sllx  %l1, L2ES_LDWC, %l0
  sllx  %l1, L2ES_VEC, %l3       ! VEC bit
  or    %l0, %l3, %l0
  ! No RW bit or Syndrome field for LDWC - %l0 has expected value

  setx  L2ES_PA0, %l2, %l3


check_l2_ESR:
  ldx   [%l3], %l4

  cmp   %l4, %l0
  bne   test_fail
  nop

check_l2_EAR:
  setx  L2EA_PA0, %l2, %l3
  ldx   [%l3], %l4

  ! Error address is the physical address of the cache line (PA[5:0] 0)
  andn  %g1, 0x3f, %l1
  cmp   %l4, %l1
  bne   test_fail
  nop

  ! Check if a Corrected ECC Trap happened
check_error_trap:
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  be   test_fail
  nop
  mov   TT_Corrected_ECC, %l0
  cmp   %o1, %l0
  be   test_fail
  nop


  ba    test_pass
  nop

My_Corrected_ECC_error_trap:
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

