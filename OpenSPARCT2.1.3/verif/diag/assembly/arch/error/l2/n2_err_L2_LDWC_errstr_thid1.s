/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_L2_LDWC_errstr_thid1.s
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

#define MAIN_PAGE_NUCLEUS_ALSO

#define MAIN_PAGE_HV_ALSO

#define	 L2_ENTRY_PA	  0x517590000
#define  TEST_DATA        0x555555555555555
#define  L2_ES_W1C_VALUE  0xc03ffff800000000


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

.text
.global	 main
.global	 My_Corrected_ECC_error_trap


main:


  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV


get_th_id_o0:
        ta      T_RD_THID

        cmp     %o1, 0x0
        be      main_t0
        nop

        cmp     %o1, 0x1
        be      main_t1
        nop

main_t0:
        ba      L20_Init
        nop


main_t1:
        nop
        nop
        nop
        ba      L21_Init
        nop


/*******************
   DIMM 0,1
*******************/
chk_core_running_status_reg:
        wr      %g0, ASI_CMP_CORE, %asi
        ldxa    [ASI_CMP_CORE_RUNNING_STATUS]%asi, %l0

L20_Init:

  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  0x2020040000, %l0, %g3

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

check_th1_out_of_boot_code:
  ldx  [%g3],%l2
  set  0x11,%l1
  membar #Sync
  cmp  %l1,%l2
  bne  check_th1_out_of_boot_code
  nop


set_L2_Directly_Mapped_Mode:
  setx	L2CS_PA0, %l6, %g1
  set	0x8002, %l0
  stx	%l0, [%g1]


store_to_L2_way0:
  setx  TEST_DATA, %l0, %g5
  setx  0x202000aa00, %l0, %g1
  stx %g5, [%g1]
  stx %g5, [%g1+8]
  membar #Sync


way_found:
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
  
indicate_th1_cpx_sent:
  set  0x22,%l1
  stx  %l1,[%g3]  
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

  setx  L2EA_PA0, %l2, %l3
check_l2_EAR:
  ldx   [%l3], %l4

  ! Error address is the physical address of the cache line (PA[5:0] 0)
  andn  %g1, 0x3f, %l1
  cmp   %l4, %l1
  bne   test_fail
  nop


  ba    test_pass
  nop


L21_Init:

indicate_out_of_boot:
  setx  0x2020040000, %l0, %g3
  set   0x11,%l2
  stx   %l2,[%g3]  

check_cpx_packet_sent:
  ldx [%g3],%l2
  set 0x22,%l3
  cmp %l2,%l3 
  bne check_cpx_packet_sent
  nop


  ! Check if a Corrected ECC Trap happened
check_error_trap:
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  bne   check_error_trap
  nop

check_error_trap1:
  mov   TT_Corrected_ECC, %l0
  cmp   %o1, %l0
  bne   test_fail
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

