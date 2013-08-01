/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_L2_LVF_uecc_WrmRst.s
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


main:


  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV

! Check if Warm Reset is done, or first time entering diag
        setx    warm_reset_done, %g1, %g2
        ldx     [%g2], %g3
        brnz    %g3, Warm_Reset_Complt
        nop

! First time thru, Store a non-zero value there
        dec     %g3
        stx     %g3, [%g2]


  setx  L2_ES_W1C_VALUE, %l0, %g4

  ! Now access L2 control and status registers
disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

  ! Write 1 to clear L2 Error status registers

enable_err_reporting:
  setx L2EE_PA0, %l0, %l1
  ldx  [%l1], %l2
  mov  0x1, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]

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
  setx  0x22000000, %l0, %g1
  stx %g5, [%g1]
  stx %g5, [%g1+8]
  membar #Sync


generate_VD_addr:
  ! Generate L2 VD Diag read address
  ! Addressing: [39:32] See PRM, [22] 1 for V/D, [17:8] set, [7:6] bank, [2:0] = 0
  setx  0x3ffc0, %l0, %l2       ! Mask for extracting [17:6]
  and   %g1, %l2, %l7

  mov   0xb6, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %l7, %l0, %l7

  mov   0x1, %l0
  sllx  %l0, 22, %l0            ! Bit [22]
  or    %l7, %l0, %l7
 
read_l2_VD_diag:
  ldx   [%l7], %l6
  xor   %l6, 0xc,%l6
  stx   %l6,[%l7]

store_to_L2_way0_wb:
  setx  TEST_DATA, %l0, %g5
  setx  0x22000000, %l0, %g1
  setx  0x22000000, %l1, %g2
  stx %g5, [%g1]
  membar #Sync
  stx %g5, [%g2]
  membar #Sync


enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

Warm_Reset_Complt:
nop

  ! Compute expected value of L2 error status register
compute_expected_L2_ESR:
  mov   0x1, %l1
  sllx  %l1, L2ES_LVU, %l0
  sllx  %l1, L2ES_VEU, %l3       ! VEC bit
  or    %l0, %l3, %l0
  setx  L2ES_PA0, %l2, %l3


check_l2_ESR:
  ldx   [%l3], %l4

  setx   0xfc00000000, %l5,%g2
  and   %l4, %g2, %l4
  cmp   %l4, %l0
  bne   test_fail
  nop

  setx  L2EA_PA0, %l2, %l3
check_l2_EAR:
  ldx   [%l3], %l4 ! Error address is the physical address of the cache line (PA[5:0] 0)
  cmp %g1,%l4
  bne test_fail
  nop
  


clr %g2
set 0x77, %g3
loop:
inc %g2
cmp %g2,%g3
bne loop
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


        .align 64
warm_reset_done:
        .xword 0

