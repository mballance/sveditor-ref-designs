/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_l2_Stuck0.s
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
#define MCUES_PA0       0x8400000280


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

.text
.global	 main


main:


  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV

  setx  L2_ES_W1C_VALUE, %l0, %g4

  ! Now access L2 control and status registers
disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


  ! Write 1 to clear L2 Error status registers

clear_MCU_ESR:
!  setx  MCUES_PA0, %l3, %l4
  setx   L2ES_PA0,%l3, %l4
  stx   %g4, [%l4]
  nop


set_L2_Directly_Mapped_Mode:
  setx	L2CS_PA0, %l6, %g1
  mov   0x2, %l0
  stx   %l0, [%g1]


store_l2_way:
  setx  TEST_DATA, %l0, %g5
  setx  0x2020000000, %l0, %g1
  stx %g5, [%g1]
  stx %g5, [%g1+8]
  membar #Sync
first_load:
  ldx [%g1], %l1
  membar #Sync

second_load:
  setx  0x2021000000, %l0, %g2
  ldx [%g2], %i4
  membar #Sync

load_to_mem:
  ldx [%g1], %l1
  membar #Sync

another_first_load:
  setx  0x2020000100, %l0, %g1
  stx %g5, [%g1]
  stx %g5, [%g1+8]
  membar #Sync
  ldx [%g1], %l1
  membar #Sync

another_second_load:
  setx  0x2021000100, %l0, %g2
  ldx [%g2], %i4
  membar #Sync

another_load_to_mem:
  ldx [%g1], %l1
  membar #Sync


ESR:
  setx   L2ES_PA0,%l3, %l4
  ldx   [%l4], %l5



  setx  0x2020000020, %l0, %g3
  setx  0x2020000030, %l0, %g4
!  setx  0x2020000000, %l0, %g5
  stx %g5, [%g2]
  membar #Sync
  stx %g5, [%g3]
  membar #Sync
  stx %g5, [%g4]
  membar #Sync
!  stx %g5, [%g5]


  ldsw:
  membar #Sync
  ldx [%g1], %i2
  membar #Sync
  ldx [%g2], %i4
  membar #Sync
  ldx [%g3], %i5
  membar #Sync
  ldx [%g4], %i6
  membar #Sync
ldx [%g1], %l1
  membar #Sync
  ldx [%g1], %i2
  membar #Sync
  ldx [%g2], %i4
  membar #Sync
  ldx [%g3], %i5
  membar #Sync
  ldx [%g4], %i6
  membar #Sync
ldx [%g1], %l1
  membar #Sync
  ldx [%g1], %i2
  membar #Sync
  ldx [%g2], %i4
  membar #Sync
  ldx [%g3], %i5
  membar #Sync
  ldx [%g4], %i6
  membar #Sync

another_ESR:
  setx   L2ES_PA0,%l3, %l4
  ldx   [%l4], %l5



 
  ba test_pass



/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

