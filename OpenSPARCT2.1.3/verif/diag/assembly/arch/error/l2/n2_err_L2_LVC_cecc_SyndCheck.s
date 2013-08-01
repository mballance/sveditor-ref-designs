/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_L2_LVC_cecc_SyndCheck.s
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

#define	 L2_ENTRY_PA	  0x517590000
#define  TEST_DATA        0x555555555555555
#define  L2_ES_W1C_VALUE  0xc03ffff800000000
#define  L2ES_LVC         34


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

.text
.global	 main
.global	 My_Corrected_ECC_error_trap


main:


  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV


  ! Now access L2 control and status registers
disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

  ! Write 1 to clear L2 Error status registers

set_L2_Directly_Mapped_Mode:
  setx	L2CS_PA0, %l6, %g1
  mov	0x2, %l0
  stx	%l0, [%g1]

!mov 0x0,%o0
mov 0x1,%o1
mov 0x2,%o2
mov 0x3,%o3
mov 0x4,%o4
mov 0x5,%o5
mov 0x6,%o6
mov 0x0,%i0

clear_l2_ESR:
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  L2ES_PA0, %l3, %l4
  stx   %g4, [%l4]
  nop

store_to_L2_way0:
  setx  TEST_DATA, %l0, %g5

  cmp   %i0,%g0
  be    flip_c0
  cmp   %i0,%o1
  be    flip_c1
  cmp   %i0,%o2
  be    flip_c2
  cmp   %i0,%o3
  be    flip_c3
  cmp   %i0,%o4
  be    flip_c4
  cmp   %i0,%o5
  be    flip_c5

flip_c0:
  mov    0x1, %l0
  mov   0x41,%i3                ! 0x41 is the syndrome , bit 0 of ecc flipped
  setx  0x22000000, %l3, %g1
  ba store_diff_index
  nop
flip_c1:
  mov    0x2, %l0
  mov   0x42,%i3                ! 0x42 is the syndrome , bit 1 of ecc flipped
  setx  0x22000400, %l3, %g1
  ba store_diff_index
  nop
flip_c2:
  mov    0x4, %l0
  mov   0x44,%i3                ! 0x44 is the syndrome , bit 2 of ecc flipped
  setx  0x22000800, %l3, %g1
  ba store_diff_index
  nop
flip_c3:
  mov    0x8, %l0
  mov   0x48,%i3                ! 0x48 is the syndrome , bit 3 of ecc flipped
  setx  0x22000c00, %l3, %g1
  ba store_diff_index
  nop
flip_c4:
  mov    0x10, %l0
  mov   0x50,%i3                ! 0x50 is the syndrome , bit 4 of ecc flipped
  setx  0x22001000, %l3, %g1
  ba store_diff_index
  nop
flip_c5:
  mov    0x20, %l0
  mov   0x60,%i3                ! 0x60 is the syndrome , bit 5 of ecc flipped
  setx  0x22002000, %l3, %g1

store_diff_index:
  stx %g5, [%g1]
  stx %g5, [%g1+8]
  membar #Sync

generate_UA_addr:
  ! Generate L2 VD Diag read address
  ! Addressing: [39:32] See PRM, [22] 1 for V/D, [17:9] set, [8:6] bank, [2:0] = 0
  setx  0x3ffc0, %l1, %l2       ! Mask for extracting [17:6]
  and   %g1, %l2, %l7

  mov   0xb6, %l2
  sllx  %l2, 32, %l2           ! Bits [39:32]
  or    %l7, %l2, %l7
  mov   0x0, %l2
  sllx  %l2, 22, %l1            ! L2_VD and L2_UA addressing differ on bit 22
  xor   %l7, %l1, %l7           ! change %l7 from L2_VD to L2_UA address
  
read_l2_UA_diag:
  ldx   [%l7], %l6

flip_bit_inject_err:
  sllx   %l0, 32, %l0
  xor    %l6, %l0, %l6

write_l2_UA_diag:
  stx   %l6, [%l7]
   membar #Sync

 Ld_to_get_err:
   !setx  0x2200aa00, %l0, %g1
   ldx   [%g1],%g2
   membar #Sync

  ! Compute expected value of L2 error status register
compute_expected_L2_ESR:
  mov   0x1, %l1
  sllx  %l1, L2ES_LVC, %l0
  sllx  %l1, L2ES_VEC, %l3       ! VEC bit
  or    %l0, %l3, %l0
  or    %l0, %i3, %l0		 ! Syndrome

check_l2_ESR:
  setx  L2ES_PA0, %l2, %l3
  ldx   [%l3], %l4
  cmp   %l4, %l0
  bne   test_fail
  nop

inc_i0:
  inc %i0
  cmp %i0,%o6
  bne clear_l2_ESR
  nop

done:
  ba    test_pass
  nop


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP


