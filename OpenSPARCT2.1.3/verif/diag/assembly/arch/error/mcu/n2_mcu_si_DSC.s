/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_mcu_si_DSC.s
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

#define	 DRAM_SCRB_FREQ_REG   0x8400000018
#define	 DRAM_SCRB_ENB_REG    0x8400000040

#define  L2_ERR_STAT_REG    0xAB00000000
#define  L2_ERR_ADDR_REG    0xAC00000000

#define  TEST_DATA0         0x1000100081c3e008
#define  TEST_DATA1         0x2000200081c3e008
#define  TEST_DATA2         0x3000300081c3e008
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
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


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


.text
.global  main
.global	 My_Corrected_ECC_error_trap


main:
  ta T_CHANGE_HPRIV
  clr	%o0
  clr	%o1

disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

set_DRAM_scrub_frequency:
  setx	DRAM_SCRB_FREQ_REG, %l0, %l1
  mov	0x1, %l0
  stx	%l0, [%l1]
  membar #Sync


enable_err_reporting:
  setx L2EE_PA0, %l0, %l1
  ldx	[%l1], %l2
  mov	0x3, %l0
  or	%l2, %l0, %l2
  stx	%l2, [%l1]
  membar #Sync

set_DRAM_error_inject_ch0:
  set   0x9012, %l1                ! ECC Mask (1-bit error)
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

store_to_L2:
  setx  TEST_DATA1, %l0, %g5

set_L2_Directly_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1
  add   %g1, L2_BANK_ADDR, %g1
  mov   0x2, %l0
  stx   %l0, [%g1]

store_to_L2_way0:
  setx  0x002000, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR, %g2
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync

! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_0:
  setx  0x21002000, %l0, %g3 ! bits [21:18] select way
  add   %g3, L2_BANK_ADDR, %g3
  stx %g5, [%g3]
!  stx %g5, [%g3+8]
  membar #Sync

enable_DRAM_scrub:
  setx	DRAM_SCRB_ENB_REG, %l0, %l1
  mov	0x1, %l0
  stx	%l0, [%l1]
  membar #Sync

        setx    0x22002000, %l0, %g3 ! bits [21:18] select way
	clr	%i5
Nops:
	cmp	%o0, %g0
	bne	%xcc, check_error_trap
	nop
 
	ldx	[%g3], %g1 ! cause  a fill 
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop

	add	%g3, 0x200, %g3 
	inc	%i5
	cmp	%i5, 0x10
	bne	Nops
	nop

   
check_error_trap:
 setx	EXECUTED, %l1, %l0
  cmp	%o0, %l0
  bne	test_fail
  nop
  mov	TT_Corrected_ECC, %l0
  cmp	%o1, %l0
  bne	test_fail
  nop

  ba	test_pass
  nop


	/**************** Trap Handler *******************/
My_Corrected_ECC_error_trap:
  ! Signal trap taken
  setx	EXECUTED, %l0, %o0
  ! save trap type value
  rdpr	%tt, %o1

check_l2esr:
	setx  L2ES_PA0, %g7, %g1
	ldx   [%g1], %g2

	setx	0x4000000000, %g7, %g3
	cmp	%g2, %g3
	bne	%xcc, test_fail
	nop

check_mcuesr:
        setx 	DRAM_ERR_STAT_REG, %g7, %g1
        ldx   	[%g1], %g2

        setx    0x800000000009012, %g7, %g3	!SYND =0x2; DSC
        cmp     %g2, %g3
        bne     %xcc, test_fail
        nop

check_DESR:
	ldxa	[%g0] 0x4c, %g2
	setx	0x8900000000000000, %g7, %g3
	cmp	%g2, %g3
	bne	%xcc, test_fail
	nop

check_mcu_EAR:
	setx	0x8400000288, %l1, %g1
	ldx	[%g1], %g2
	setx	0x2000, %l1, %g3
!	cmp	%g2, %g3
!	bne	%xcc, test_fail
	nop

	retry
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



