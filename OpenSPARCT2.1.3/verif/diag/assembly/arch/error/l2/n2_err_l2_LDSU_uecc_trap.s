/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_l2_LDSU_uecc_trap.s
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
#define H_HT0_Sw_Recoverable_Error_0x40  My_recoverable_sw_error_handler

#define MAIN_PAGE_HV_ALSO

/* Set up L2$ in direct map and enable errors */
/* Need to go to direct-map mode in order to guarantee the
 * L2$ diagnostic address of the line we will corrupt */
#define CREGS_L2_CTL_REG_DIS 0
#define CREGS_L2_CTL_REG_ASSOCDIS 1
#define CREGS_L2_ERR_EN_REG_CEEN 1
#define CREGS_L2_ERR_EN_REG_NCEEN 1
#define L2_REG_PROG 1


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

#define  L2_ENTRY_PA        0xa000000000
#define  TEST_DATA1         0x5555555555555555
#define	 TEST_PA            0x003000aa00
                            /* bits [21:18] select way in direct-map mode */
                            /* bits [17:9] select the set == 0x55,
                               so start L2_SCRUB at 0x50 */
#define  MASK_PA_21_3       0x3ffff8
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define	 SPARC_ES_W1C_VALUE 0xefffffff
#define  TT_SW_Error        0x40

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


clear_l2_ESR:
  setx  L2_ES_W1C_VALUE, %l0, %l1
  setx  L2ES_PA0, %l6, %g1
  stx   %l1, [%g1]


/* Bring the line into L2$ */
store_to_L2:
  setx  TEST_DATA1, %l0, %g5

store_to_L2_way0:
  setx	TEST_PA, %l0, %g2
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync

/* Because membar only waits for L2$ to enque the request,
   and it may take much longer for MCU to return data,
   we need to stall by doing a load */
load_stored_data:
  ldx [%g2],%l0

L2_diag_load:
  setx  MASK_PA_21_3, %l0, %l2      ! Mask for extracting [21:3]
  setx	L2_ENTRY_PA, %l0, %g4
  and   %g2, %l2, %g5           !g2 has L2 PA, 
  or	%g5, %g4, %g5           !g5 now has Diagnostic Data Array address 
  ldx	[%g5], %g6
  membar #Sync

! Flip two check bits to inject uncorrectable error
  xor	 %g6, 3, %g6
  stx	%g6, [%g5]
  membar #Sync

setup_read_loop:                ! Set up a loop to cause L2$ fills
  add   %g2, 64*8, %g3          ! Pick the next index in same L2$ bank
  setx  4*1024*1024, %l0, %l1   ! Offset to next L2$ alias (4MB)
  mov   20, %l7                 ! Maximum outer loop iterations

outer_read_loop:
  mov   %g3, %l3
  mov   50, %l6                 ! Maximum inner loop iterations

inner_read_loop:
  ldx   [%l3], %l0
  dec   %l6
  brnz  %l6, inner_read_loop
  add   %l3, %l1, %l3

decrement_outer_loop_counter:
  dec   %l7
  brnz  %l7, outer_read_loop
  nop

outer_loop_ended_without_LDSC:
  ta  T_BAD_TRAP


.global My_recoverable_sw_error_handler
My_recoverable_sw_error_handler:
  rdpr  %tt, %o1
  cmp   %o1, 0x40
trap_if_wrong_trap_type:
  tne   %xcc, T_BAD_TRAP

check_DESR:
  ldxa  [%g0]ASI_DESR, %o2 ! Also clears desr
  mov   5, %o1             ! "f" and "s" bits
  sllx  %o1, (61-56), %o1
  add   %o1, DESR_L2U, %o1
  sllx  %o1, 56, %o1
  cmp   %o2, %o1
trap_if_wrong_DESR:
  tne   %xcc, T_BAD_TRAP

check_l2_ESR:
  setx  L2ES_PA0, %l6, %g1
  ldx   [%g1], %l4
  setx  mpeval((1<<L2ES_LDSU)+(1<<L2ES_VEU)), %o0, %o1
  cmp   %l4, %o1
trap_if_wrong_L2_ESR:
  tne   %xcc, T_BAD_TRAP

check_l2_EAR:
  setx  L2EA_PA0, %l6, %l3
  ldx   [%l3], %l4
  setx  (TEST_PA & MASK_PA_21_3), %o0, %o1
  cmp   %l4, %o1
trap_if_wrong_L2_EAR:
  tne   %xcc, T_BAD_TRAP

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP
