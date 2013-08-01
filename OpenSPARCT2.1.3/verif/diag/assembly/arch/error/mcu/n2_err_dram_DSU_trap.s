/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_dram_DSU_trap.s
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

#define	 DRAM_ERR_INJ_REG   0x8400000290
#define	 DRAM_ERR_STAT_REG  0x8400000280
#define	 L2_ERR_STAT_REG    0xAB00000000
#define	 L2_ERR_ADDR_REG    0xAC00000000

#define	 ERROR_ADDR	    0x20200000


#define  DRAM_CHANNEL_ADDR    0x2000
#define  TEST_DATA1            0x1000100081c3e008
#define  L2_ES_W1C_VALUE      0xc03ffff800000000
#define  DRAM_ES_W1C_VALUE    0xfe00000000000000
#define  DRAM_ESR_REG         0x8400000280
#define  DRAM_ERR_INJ_REG     0x8400000290
#define  DRAM_SCRB_FREQ_REG   0x8400000018
#define  DRAM_SCRB_ENB_REG    0x8400000040
#define  TT_SW_Error        0x40


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"



.text
.global	 main
.global  My_Recoverable_Sw_error_trap



main:

  ! Boot code does not provide TLB translation for IO address space
  ta	T_CHANGE_HPRIV

  setx	TEST_DATA1, %l0, %g3
  setx	DRAM_ES_W1C_VALUE, %l0, %g4
  setx	DRAM_ESR_REG, %l0, %g5
  setx	L2ES_PA1, %l0, %g6

clear_DRAM_ESR:
  ! Clear DRAM Error status register (Bit[63:57] write-1-clear)
  stx	%g4, [%g5]            ! %g5 set to ESR Reg

disable_L1:
  ldxa	[%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn	%l0, 0x3, %l0
  stxa	%l0, [%g0] ASI_LSU_CONTROL

enable_err_reporting:
  setx L2EE_PA0, %l0, %l1
  ldx  [%l1], %l2
  mov  0x1, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]


clear_l2_ESR:
  ! Write 1 to clear L2 Error status registers
  setx	L2_ES_W1C_VALUE, %l0, %l1
  stx	%l1, [%g6]
  nop

set_DRAM_error_inject:
  ! Set up DRAM error injection
  mov	0x3, %l1		! ECC Mask (two bit error)
  mov	0x1, %l2
  sllx	%l2, DRAM_EI_SSHOT, %l3
  or	%l1, %l3, %l1		! Set single shot
  sllx	%l2, DRAM_EI_ENB, %l3
  or	%l1, %l3, %l1		! Enable error injection for the next write

  setx  DRAM_ERR_INJ_REG, %l0, %l2    ! DRAM error injection
  stx	%l1, [%l2]

set_L2_Directly_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1      ! Bit 1 in L2 Control Status Register
  mov   0x2, %l0
  stx   %l0, [%g1]
  nop

 
store_to_L2_way0:
  setx  0x0003000000, %l0, %g2  ! bits [21:18] select way
  stx %g3, [%g2]
  stx %g3, [%g2+8]


store_to_DRAM:
  setx	TEST_DATA1, %l2, %l1
  setx  0x0002000000, %l0, %g2  ! bits [21:18] select way
  stx	%l1, [%g2]
  stx   %l1, [%g2+8]



enable_l1:
  ldxa	[%g0] ASI_LSU_CONTROL, %l0
  or	%l0, 0x3, %l0
  stxa	%l0, [%g0] ASI_LSU_CONTROL

set_DRAM_scrub_frequency:
  setx	DRAM_SCRB_FREQ_REG, %l0, %l1
  mov	0x5, %l0
  stx	%l0, [%l1]

enable_DRAM_scrub:
  setx	DRAM_SCRB_ENB_REG, %l0, %l1
  mov	0x1, %l0
  stx	%l0, [%l1]

  clr	%g1



Loop:
  inc	%g1
 ! cmp	%g1, 5  ! original number
  cmp	%g1, 0x20
  be	check_DRAM_ESR
!  be	test_fail
  nop

  bne	Loop
  nop

check_DRAM_ESR:
  ldx	[%g5], %l0


compute_expected_DRAM_ESR:
  ! Compute expected value of DRAM error status register
  mov	0x1, %l6
  sllx	%l6, DRAM_ES_DSU, %l7
  ! Due to DDR design, a single shot for one clock cycle results in errors for two 16-Byte chunks
  ! This also implies that a disrupting 0x78 trap will follow a 0x32 precise trap
  sllx	%l6, DRAM_ES_MEU, %l5
  or	%l7, %l5, %l7

  ! Not checking syndrome because it varies with environment timing (e.g. different in cmp and ciop)
  set	0xffff, %l1
  andn	%l0, %l1, %l0

verify:
  cmp	%l0, %l7
  bne	%xcc, test_fail
  nop

compute_expected_L2_ESR:
  ! Compute expected value of L2 error status register
  mov	0x1, %l1
  sllx	%l1, L2ES_DSU, %l0

check_l2_ESR:
  ldx	[%g6], %l4

  cmp	%l4, %l0
  bne	%xcc, test_fail
  nop

clr_DRAM_ESR:
  ! Clear DRAM Error status register
  stx	%g4, [%g5]

check_err_corrected:
  ! Check if error is corrected
  ldx	[%g2], %l0
  cmp	%l0, %g3
  bne	%xcc, test_fail
  nop

check_DRAM_ESR_again:
  ! Check DRAM ES again - should be zero
  ldx	[%g5], %l0
  brnz	%l0, test_fail
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


My_Recoverable_Sw_error_trap:
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


