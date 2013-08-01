/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_l2_LDAC_LDWC_noDAC.s
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
#define H_HT0_Hw_Corrected_Error_0x63 My_Corrected_ECC_error_trap



#define MAIN_PAGE_HV_ALSO


#define  L2_ENTRY_PA        0xa000000000
#define  TEST_DATA1         0x5555555555555555
#define	 L2_ENTRY_PA0       0x30000008
#define L2_ES_W1C_VALUE     0xc03ffff800000000
#define	 SPARC_ES_W1C_VALUE 0xefffffff
#define  TT_SW_Error        0x40

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

.text
.global	 main
.global	 My_Recoverable_Sw_error_trap
.global  My_Corrected_ECC_error_trap


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
  setx	0x3030aa00, %l0, %g2  ! bits [21:18] select way
  stx %g5, [%g2] 
  stx %g5, [%g2+8]
  membar #Sync

  set 0x8,%l1
  clr %l2
loop:
  inc %l2
  cmp %l1,%l2
  bne loop
  nop

L2_diag_load:
  setx  0x3ffff8, %l0, %l2      ! Mask for extracting [21:3]
  setx	L2_ENTRY_PA, %l0, %g4
  and   %g2, %l2, %g5           !g2 has L2 PA, 
  or	%g5, %g4, %g5           !g5 now has Diagnostic Data Array address 
  ldx	[%g5], %g6
  membar #Sync

  set 0x8,%l1
  clr %l2
loop1:
  inc %l2
  cmp %l1,%l2
  bne loop1
  nop

flip_one_bit:
! Flip one bits to inject error
  xor	 %g6, 0x200, %g6
  stx	%g6, [%g5]
  membar #Sync

  set 0x8,%l1
  clr %l2
loop3:
  inc %l2
  cmp %l1,%l2
  bne loop3
  nop

reading_back_0:                 !Load to L2 again to get the error
  setx  0x3030aa00, %l0, %g2
  ldx   [%g2], %l6
  membar #Sync  


check_sw_err_trap_ldac_0:
  ! Check if a Software Recoverable Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_SW_Error, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop

compute_error_ldac:
  mov   0x1, %l1
  sllx  %l1, L2ES_LDAC, %l7
  sllx  %l1, L2ES_VEC, %l3
  or    %l7, %l3, %l7
  mov   0x46, %l1                ! 7-bit Syndrome
  sllx  %l1, 21, %l3             ! Syndrome for [127:96] at [27:21]
  or    %l7, %l3, %l7
  sllx  %g4, L2ES_TID, %l3       ! ID of thread that encountered error
  or    %l7, %l3, %l7            ! %l7 has expected value
  membar #Sync

check_l2_ESR_ldac:
  setx  L2ES_PA0, %l6, %g1
  ldx   [%g1], %l4
  membar #Sync

verify_ESR_ldac:
  cmp   %l7,  %l4                ! l7 has expected value l4 has actula value
  !bne test_fail

check_l2_EAR_ldac:
  setx  L2EA_PA0, %l6, %l3
  ldx   [%l3], %l4
  membar #Sync

clear_l2_ESR_ldac:
  setx  L2_ES_W1C_VALUE, %l0, %l1
  setx  L2ES_PA0, %l6, %g1
  stx   %l1, [%g1]

reading_back_1:                 !Load to L2 again to get the error
  setx  0x3030aa00, %l0, %g2
  ldx   [%g2], %l6
  nop
  nop

check_sw_err_trap_ldac_1:
  ! Check if a Software Recoverable Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_SW_Error, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop

  ldx   [%g2], %l6
  nop
  nop

check_sw_err_trap_ldac_2:
  ! Check if a Software Recoverable Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_SW_Error, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop

  ldx   [%g2], %l6
  nop
  nop

check_sw_err_trap_ldac_3:
  ! Check if a Software Recoverable Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_SW_Error, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop

compute_error_mec:
  mov   0x1, %l1
  sllx  %l1, L2ES_LDAC, %l7
  sllx  %l1, L2ES_VEC, %l3
  or    %l7, %l3, %l7
  mov   0x1, %l1
  sllx  %l1, L2ES_MEC, %l3
  or    %l7, %l3, %l7
  mov   0x46, %l1                ! 7-bit Syndrome
  sllx  %l1, 21, %l3             ! Syndrome for [127:96] at [27:21]
  or    %l7, %l3, %l7
  sllx  %g4, L2ES_TID, %l3       ! ID of thread that encountered error
  or    %l7, %l3, %l7            ! %l7 has expected value
  membar #Sync

check_l2_ESR_mec:
  setx  L2ES_PA0, %l6, %g1
  ldx   [%g1], %l4
  membar #Sync

verify_ESR_mec:
  cmp   %l7,  %l4                ! l7 has expected value l4 has actula value
  bne test_fail

check_l2_EAR_mec:
  setx  L2EA_PA0, %l6, %l3
  ldx   [%l3], %l4
  membar #Sync

clear_l2_ESR_mec:
  setx  L2_ES_W1C_VALUE, %l0, %l1
  setx  L2ES_PA0, %l6, %g1
  stx   %l1, [%g1]


write_back_0:                 !Load to L2 again to evict error
  setx  0x7030aa00, %l0, %g2
  ldx   [%g2], %l6
  membar #Sync

compute_error_ldwc:
  mov   0x1, %l1
  sllx  %l1, L2ES_LDWC, %l7
  sllx  %l1, L2ES_VEC, %l3
  or    %l7, %l3, %l7
  mov   0x1, %l1
  sllx  %l1, L2ES_MEC, %l3
  or    %l7, %l3, %l7
  sllx  %g4, L2ES_TID, %l3       ! ID of thread that encountered error
  or    %l7, %l3, %l7            ! %l7 has expected value
  membar #Sync

check_l2_ESR_ldwc:
  setx  L2ES_PA0, %l6, %g1
  ldx   [%g1], %l4
  membar #Sync

verify_ESR_ldwc:
  cmp   %l7,  %l4                ! l7 has expected value l4 has actula value
  bne test_fail

check_l2_EAR_ldwc:
  setx  L2EA_PA0, %l6, %l3
  ldx   [%l3], %l4
  membar #Sync


clear_l2_ESR_ldwc:
  setx  L2_ES_W1C_VALUE, %l0, %l1
  setx  L2ES_PA0, %l6, %g1
  stx   %l1, [%g1]

check_hw_err_trap_ldwc:
  ! Check if a Software Recoverable Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  clr %o0
  mov   TT_Corrected_ECC, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop
  clr %o1



reading_back_3:                 !Load to L2 again to get line from mcu, cache miss
  setx  0x3030aa00, %l0, %g2
  ldx   [%g2], %l6
  membar #Sync

check_err_trap_dac:
  ! Check if a Software Recoverable Error Trap happened
  cmp   %o0, %g0
  bne   test_fail
  nop
  cmp   %o1, %g0
  bne   test_fail
  nop


enable_l1_DCache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


check_l2_ESR:
  setx  L2ES_PA0, %l6, %g1
  ldx   [%g1], %l4
  membar #Sync

Verify_ESR:
  cmp %l4,%g0
  bne test_fail
  nop

check_l2_EAR:
  setx  L2EA_PA0, %l6, %l3
  ldx   [%l3], %l4
  membar #Sync

count_traps:
setx 0x38888888,%g1,%g6
ldx [%g6], %g2
  set 0x5,%l2
  cmp %g2,%l2
  bne test_fail
  nop

  ba    test_pass
  nop


My_Recoverable_Sw_error_trap:
setx 0x38888888,%g1,%g6
read_trap_type_Sw:
        setx  EXECUTED, %l0, %o0
        ! save trap type value
        rdpr  %tt, %o1
        nop
  mov   0x40, %i7
  cmp   %o1, %i7
        bne test_fail
        nop

check_clear_desr_Sw:
        ldxa [%g0]ASI_DESR, %i5  !! Also clears desr
        setx 0x3f00000000000000, %i6, %i7
        and  %i5, %i7, %i5
        setx 0x2400000000000000, %i6, %i7
        cmp  %i5, %i7
	bne test_fail
 	nop
	inc %g7
	stx %g7, [%g6]
        retry
        nop



My_Corrected_ECC_error_trap:
setx 0x38888888,%g1,%g6
read_trap_type_Hw:
        setx  EXECUTED, %l0, %o0
        ! save trap type value
        rdpr  %tt, %o1
        nop
  mov   0x63, %i6
  cmp   %o1, %i6
        bne test_fail
        nop

check_clear_desr_Hw:
        ldxa [%g0]ASI_DESR, %i6  !! Also clears desr
        setx 0x3f00000000000000, %i7, %i5
        and  %i6, %i5, %i6
        setx 0x0900000000000000, %i7, %i4
        cmp  %i4, %i6
        bne test_fail
        nop
	inc %g7
	stx %g7, [%g6]
        retry
        nop




/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP
