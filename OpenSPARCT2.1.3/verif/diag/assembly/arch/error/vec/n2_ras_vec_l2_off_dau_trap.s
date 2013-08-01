/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ras_vec_l2_off_dau_trap.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define  L2_ERR_STAT_REG    0xAB00000000
#define  L2_ERR_ADDR_REG    0xAC00000000

#define  TEST_DATA0         0x1000100081c3e008
#define  TEST_DATA1         0x2000200081c3e008
#define  TEST_DATA2         0x3000300081c3e008
#define  L2_ES_W1C_VALUE    0xc03ffffc00000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000

#ifdef MCU0
#define L2_BANK_ADDR        0x0       
#define MCU_BANK_ADDR       0x0
#define  DRAM_ERR_INJ_REG   0x8400000290
#define  DRAM_ERR_STAT_REG  0x8400000280
#define	 ERROR_ADDR	    0x20200000
#endif

#ifdef MCU1
#define L2_BANK_ADDR        0x80
#define MCU_BANK_ADDR       0x80
#define  DRAM_ERR_INJ_REG   0x8400001290
#define  DRAM_ERR_STAT_REG  0x8400001280


#endif

#ifdef MCU2
#define L2_BANK_ADDR        0x100
#define MCU_BANK_ADDR       0x100
#define  DRAM_ERR_INJ_REG   0x8400002290
#define  DRAM_ERR_STAT_REG  0x8400002280
#define  ERROR_ADDR         0x20200100

#endif

#ifdef MCU3
#define L2_BANK_ADDR        0x180
#define MCU_BANK_ADDR       0x180
#define  DRAM_ERR_INJ_REG   0x8400003290
#define  DRAM_ERR_STAT_REG  0x8400003280


#endif

#define		L2_ESR_MASK	0xf03ffffff0000000


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


.text
.global  main
.global  My_Corrected_ECC_error_trap



main:
  ta T_CHANGE_HPRIV
disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


clear_dram_esr_0:
  ! Clear DRAM Error status register (Bit[63:57] write-1-clear)
  setx  DRAM_ES_W1C_VALUE, %l0, %l5
  setx  DRAM_ERR_STAT_REG, %l3, %g5  
!  add   %g5, MCU_BANK_ADDR, %g5
  stx   %l5, [%g5]

set_DRAM_error_inject_ch0:
  mov   0x606, %l1                ! ECC Mask (Multi-bit error)
  mov   0x1, %l2 		
  sllx  %l2, DRAM_EI_SSHOT, %l3
  Or    %l1, %l3, %l1           ! Set single shot ; 
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG, %l3, %g6 
!  add   %g6, MCU_BANK_ADDR, %g6
  stx   %l1, [%g6]
  membar 0x40

enable_err_reporting:
  setx L2EE_PA0, %l0, %l1
  add   %l1, L2_BANK_ADDR, %l1
  ldx  [%l1], %l2
  mov  0x3, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]


  ! Write 1 to clear L2 Error status registers
clear_l2_ESR:
  setx  L2ES_PA0, %l3, %l4
  add   %l4, L2_BANK_ADDR, %l4
  stx   %l5, [%l4]
  nop



set_L2_Off_Mode_errorsteer:
	setx	L2CS_PA0, %l6, %g1
	ldx	[%g1], %o6

	mov	0x1, %o5		! L2_CSR_REG<0>=1 => L2 Off mode

	ldxa	[%g0]ASI_INTR_ID, %o4	! get the thread id; for core-portable
	sllx	%o4, 15, %o4		! L2_CSR_REG<21:15> = ERROR_STEER

	or	%o5, %o4, %o5

	or	%o6, %o5, %o6

	stx	%o6, [%g1]
	membar	0x40

  
store_to_L2_way0:
  setx  0x2200aa00, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR, %g2
  stx %g5, [%g2]
  membar #Sync
read_error_address_ch0:
  ldx   [%g2], %l1
  membar #Sync


! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_0:
  setx  0x2100aa00, %l0, %g3 ! bits [21:18] select way
  add   %g3, L2_BANK_ADDR, %g3
  stx %g5, [%g3]
  membar #Sync

/**
*read_error_address_ch0:
*  ldx   [%g2], %l1
*  membar #Sync
*!  ldx   [%g3], %l2
*!  membar #Sync
**/

   
check_DRAM_ESR_0:
  setx  DRAM_ERR_STAT_REG, %l3, %g5  
!  add   %g5, MCU_BANK_ADDR, %g5
  ldx   [%g5], %l6
  setx  0xffc0000000000000, %l0,%o2
  and  %l6,%o2,%l6


compute_dram_ESR:
  mov   0x1, %l1
  sllx  %l1, DRAM_ES_DAU, %l0


verify_dram_ESR:
  cmp   %l0, %l6
  bne   %xcc, test_fail
  nop

check_L2_ESR_0:
  setx  L2_ERR_STAT_REG, %l3, %g5  
  add   %g5, L2_BANK_ADDR, %g5
  ldx   [%g5], %l6

compute_L2_ESR:
  setx  L2_ESR_MASK, %l3, %l0		! Avoid VCID check; SYND check
  andcc %l0, %l6, %l6                  	! Donot check L2ESR SYND bits

  mov   0x1, %l1
  sllx  %l1, L2ES_DAU, %l0
  mov   0x1, %l1
  sllx  %l1, L2ES_VEU, %l2
  or    %l0, %l2, %l3

verify_L2_ESR:
  cmp   %l6, %l3
  bne   %xcc, test_fail
  nop


  setx  L2EA_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR, %l3
check_l2_EAR:
  ldx   [%l3], %l4
  ! Error address is the physical address of the cache line (PA[5:0] 0)
  setx  0x2200aa00, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR, %g2

  setx  0xffffffffc0, %l0,%o2
  and  %l4, %o2, %l4
  cmp   %l4, %g2
  bne   %xcc, test_fail
  nop

check_Corr_err_trap:
  ! Check if a Corrected ECC Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_Data_Access_Error, %l0
  cmp   %o1, %l0
  bne   test_fail
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



