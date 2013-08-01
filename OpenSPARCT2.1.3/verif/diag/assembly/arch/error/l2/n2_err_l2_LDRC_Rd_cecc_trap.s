/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_l2_LDRC_Rd_cecc_trap.s
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
#define H_HT0_Sw_Recoverable_Error_0x40  My_Recoverable_Sw_error_trap


#define MAIN_PAGE_HV_ALSO


#define  L2_ENTRY_PA        0xa000000000
#define  TEST_DATA1         0x5555555555555555
#define	 L2_ENTRY_PA0       0x2020000008
#define L2_ES_W1C_VALUE     0xc03ffff800000000
#define	 SPARC_ES_W1C_VALUE 0xefffffff
#define  TT_SW_Error        0x40

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

.text
.global	 main
.global  My_Recoverable_Sw_error_trap


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
  setx	0x202000aa00, %l0, %g2  ! bits [21:18] select way
  stx %g5, [%g2] 
  stx %g5, [%g2+8]
  membar #Sync

L2_diag_load:
  setx  0x3ffff8, %l0, %l2      ! Mask for extracting [21:3]
  setx	L2_ENTRY_PA, %l0, %g4
  and   %g2, %l2, %g5           !g2 has L2 PA, 
  or	%g5, %g4, %g5           !g5 now has Diagnostic Data Array address 
  ldx	[%g5], %g6
  membar #Sync

! Flip one bits to inject error
  xor	 %g6, 0x200, %g6
  stx	%g6, [%g5]
  membar #Sync


ldsw:
  nop; !$EV trig_pc_d(0,@VA(.MAIN.ldsw)) -> siuDmaRd(202000aa00,2,0)



reading_back_0:                 !Load miss to L2 again to get the error trap
  setx  0x202000ba00, %l0, %g2
  ldx   [%g2], %l6
  membar #Sync  




enable_l1_DCache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


compute_error:
  mov   0x1, %l1
  sllx  %l1, L2ES_LDRC, %l7
  sllx  %l1, L2ES_VEC, %l3
  or    %l7, %l3, %l7
  membar #Sync


check_l2_ESR:
  setx  L2ES_PA0, %l6, %g1
  ldx   [%g1], %l4
  membar #Sync

verify_ESR:
  cmp   %l7,  %l4                ! l7 has expected value, l4 has actual value
  bne test_fail


check_l2_EAR:
  setx  L2EA_PA0, %l6, %l3
  ldx   [%l3], %l4
  membar #Sync

verify_EAR:
  setx	0x202000aa00, %l0, %g2  ! bits [21:18] select way
  cmp   %g2,  %l4                ! g2 has expected value, l4 has actual value
  bne test_fail
  nop
 
check_sw_err_trap:
  ! Check if a Software Recoverable Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_SW_Error, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop

load_DESR_L2C:
  ldxa  [%g0] 0x4c, %g2
 
verify_DESR:
  setx 0x1f00000000000000, %l0,%l1
  and  %g2, %l1, %l3
  set  20, %l4
  sllx %l4, 0x38, %l5 
  cmp  %l5, %l3
  bne  test_fail
  nop


  ba    test_pass
  nop

My_Recoverable_Sw_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  retry
!  nop


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP
