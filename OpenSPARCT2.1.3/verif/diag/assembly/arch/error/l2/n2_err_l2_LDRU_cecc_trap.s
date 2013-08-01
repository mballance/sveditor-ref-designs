/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_l2_LDRU_cecc_trap.s
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
#define ENABLE_PCIE_LINK_TRAINING
#define MAIN_PAGE_HV_ALSO


#define  L2_ENTRY_PA        0xa000000000
#define  TEST_DATA1         0x5555555555555555
#define	 L2_ENTRY_PA0       0x30000008
#define L2_ES_W1C_VALUE     0xc03ffff800000000
#define	 SPARC_ES_W1C_VALUE 0xefffffff
#define  TT_SW_Error        0x40
#define DMA_DATA_BYP_ADDR1  0xfffc000030aa0000


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"
#include "peu_defines.h"


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
!  stx  %l2, [%l1]



clear_l2_ESR:
  setx  L2_ES_W1C_VALUE, %l0, %l1
  setx  L2ES_PA0, %l6, %g1
  stx   %l1, [%g1]


set_L2_Directly_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1      ! Bit 1 in L2 Control Status Register
  mov   0x2, %l0
  stx   %l0, [%g1]

  setx  TEST_DATA1, %l0, %g5
store_to_L2_way0:
  set  0x30aa0000, %g2  ! bits [21:18] select way
  stx %g5, [%g2]
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
! Flip two bits to inject error
  xor	 %g6, 0x220, %g6
  stx	%g6, [%g5]
  membar #Sync

  set 0x8,%l1
  clr %l2
loop3:
  inc %l2
  cmp %l1,%l2
  bne loop3
  nop

PIO2_noexp: nop;
! $EV trig_pc_d(1, @VA(.MAIN.PIO2_noexp)) -> EnablePCIeIgCmd ("PIO_NOEXP",0,0,0,1)

PIO2:	nop; nop; nop; nop; nop; nop; nop; nop;


Wr_Evnt: nop;
        ! $EV trig_pc_d(1, @VA(.MAIN.Wr_Evnt) -> EnablePCIeIgCmd ("DMARD_UE", DMA_DATA_BYP_ADDR1, DMA_DATA_BYP_ADDR1, "64'h40", 1 )

clr %l7
set 0x20, %i7
wr_evnt_loop:
  inc %l7
  cmp %l7,%i7
  bne wr_evnt_loop
  nop

PIO3_noexp: nop;
! $EV trig_pc_d(1, @VA(.MAIN.PIO3_noexp)) -> EnablePCIeIgCmd ("PIO_NOEXP",0,0,0,1)

PIO3:   nop; nop; nop; nop; nop; nop; nop; nop;


Wr_Evnt_mec: nop;
        ! $EV trig_pc_d(1, @VA(.MAIN.Wr_Evnt_mec) -> EnablePCIeIgCmd ("DMARD_UE", DMA_DATA_BYP_ADDR1, DMA_DATA_BYP_ADDR1, "64'h40", 1 )
clr %l7
set 0x20, %i7
wr_evnt_loop_mec:
  inc %l7
  cmp %l7,%i7
  bne wr_evnt_loop_mec
  nop

check_l2_ESR_mec:
  setx  L2ES_PA0, %l6, %g1
  ldx   [%g1], %l4
  membar #Sync


compute_error_mec:
  mov   0x1, %l1
  sllx  %l1, L2ES_LDRU, %l7
  sllx  %l1, L2ES_VEU, %l3
  or    %l7, %l3, %l7
  sllx  %l1, L2ES_MEU, %l3
  or    %l7, %l3, %l7
 ! mov   0x1, %l1
 ! sllx  %g4, L2ES_TID, %l3       ! ID of thread that encountered error
 ! or    %l7, %l3, %l7            ! %l7 has expected value
 ! membar #Sync

verify_ESR_mec:
  cmp   %l7,  %l4                ! l7 has expected value l4 has actula value
  bne test_fail

check_l2_EAR_mec:
  setx  L2EA_PA0, %l6, %l3
  ldx   [%l3], %l4
  membar #Sync



enable_l1_DCache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


  ba    test_pass
  nop



/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

