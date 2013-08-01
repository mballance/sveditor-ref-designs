/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ras_vec_mcu_poison.s
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
#define  TEST_DATA1         0x5555555555555555
#define	 L2_ENTRY_PA0       0x2020000008
#define  L2_ES_W1C_VALUE    0xc03ffffc00000000
#define  TT_SW_Error        0x40
#define  DRAM_ERR_STAT_REG  0x8400000280
#ifdef L2_0
#define  L2_BANK_ADDR       0x00
#endif
#ifdef L2_1
#define  L2_BANK_ADDR       0x40
#endif



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


#ifdef MEM_POISN_Trap
enable_err_reporting:
  setx L2EE_PA0, %l0, %l1
  ldx  [%l1], %l2
  mov  0x3, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]
#endif

clear_l2_ESR:
  setx  L2_ES_W1C_VALUE, %l0, %l1
  setx  L2ES_PA0, %l6, %g1
  stx   %l1, [%g1]


set_L2_Direct_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1
  add   %g1,L2_BANK_ADDR,%g1
  mov   0x2, %l0
  stx   %l0, [%g1]

store_to_L2:
  setx  TEST_DATA1, %l0, %g5

store_to_L2_way0:
  setx	0x22000000, %l0, %g2
  add   %g2,L2_BANK_ADDR,%g2
  stx %g5, [%g2] 
  membar #Sync

clr %i7
set 0x1f,%l7
loop:
inc %i7
cmp %i7,%l7
bne loop
nop

L2_diag_load:
  setx  0x3ffff8, %l0, %l2      ! Mask for extracting [21:3]
  setx	L2_ENTRY_PA, %l0, %g4
  and   %g2, %l2, %g5
  or	%g5, %g4, %g5
  ldx	[%g5], %g6
  membar #Sync

! Flip two  bits
  xor	 %g6, 0x600, %g6
  stx	%g6, [%g5]
  membar #Sync

clr %i7
set 0x7,%l7
loop_diag:
inc %i7
cmp %i7,%l7
bne loop_diag
nop


store_to_mem:
 setx  0x33000000, %l0, %g2
 add   %g2,L2_BANK_ADDR,%g2
 stx %g5, [%g2]
 membar #Sync

clr %i7
set 0xf,%l7
loop_mem:
inc %i7
cmp %i7,%l7
bne loop_mem
nop

load_UEdata:
  setx  0x22000000, %l0, %g2
  add   %g2,L2_BANK_ADDR,%g2
  ldx  [%g2], %g3
  membar #Sync

clr %i7
set 0xf,%l7
loop_UE:
inc %i7
cmp %i7,%l7
bne loop_UE
nop

nop; nop; nop
nop; nop; nop
nop; nop; nop
nop; nop; nop
nop; nop; nop
nop; nop; nop
nop; nop; nop
nop; nop; nop
nop; nop; nop


enable_l1_DCache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


check_l2_ESR:
  setx  L2ES_PA0, %l6, %g1
  add   %g1,L2_BANK_ADDR,%g1
  ldx   [%g1], %l4
  membar #Sync


compute_L2_ESR:
  setx  0xf1fffffff0000000, %l3, %l0    ! MSA; ignore CoreID -> <59:57>; TH_ID <56:54> should be OK
  andcc %l0, %l4, %l5                   ! Donot check L2ESR SYND bits

  mov   0x1, %l1
  sllx  %l1, L2ES_LDWU, %l0
  mov   0x1, %l1
  sllx  %l1, L2ES_VEU, %l2
  or    %l0, %l2, %l3
  mov	0x1, %l1
  sllx	%l1, L2ES_MEU, %l2		! MEU
  or	%l3, %l2, %l3

verify_L2_ESR:
  cmp   %l5, %l3
  bne   %xcc, test_fail
  nop



check_l2_EAR:
  setx  L2EA_PA0, %l6, %l3
  add   %l3,L2_BANK_ADDR,%l3
  ldx   [%l3], %l4
  membar #Sync


verify_EAR:
  setx  0x22000000, %l0, %g2
  add   %g2,L2_BANK_ADDR,%g2

  cmp   %g2,  %l4
  bne test_fail
  nop

check_DRAM_ESR_0:
  setx  DRAM_ERR_STAT_REG, %l3, %g5
  ldx   [%g5], %l6
  setx  0xffc000000000ffff, %l0,%o2
  and  %l6,%o2,%l6

compute_dram_ESR:
  mov   0x1, %l1
  sllx  %l1, DRAM_ES_DAU, %l0            ! %l0 has expected value
  set   0x8221,%l3
  or    %l0,%l3,%l0

verify_dram_ESR:
  cmp   %l0, %l6
  bne   %xcc, test_fail
  nop

#ifdef MEM_POISN_Trap
  ! Check if a Software Recoverable Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_SW_Error, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop
#endif

  ba    test_pass
  nop

My_Recoverable_Sw_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
//  retry
  done
  nop



/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP


