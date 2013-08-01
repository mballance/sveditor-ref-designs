/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_ncu_esr_3.s
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

#define MAIN_PAGE_HV_ALSO

#define SOC_ESR_REG      0x8000003000
#define SOC_ELE_REG      0x8000003008
#define SOC_EIE_REG      0x8000003010
#define SOC_EJR_REG      0x8000003018
#define SOC_FEE_REG      0x8000003020
#define SOC_PER_REG      0x8000003028
#define SOC_SII_SYN_REG  0x8000003030
#define SOC_NCU_SYN_REG  0x8000003038


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

.text
.global	 main
.global  My_Corrected_ECC_error_trap

main:
  ta	T_CHANGE_HPRIV
  nop

cerer:
  set	0x10,	%l1
  ldxa 	[%l1]0x4C, %l2

soc_err_stat_reg:
  setx  0x4, %l7, %g7
  setx  SOC_ESR_REG, %l7, %g5

soc_err_stat_reg_ones:
  stx   %g7, [%g5]
  membar 0x40

eie_reg_ones:
  set   0x4, %i2
  setx  SOC_EIE_REG, %l7, %g5
  stx   %i2, [%g5]
  membar 0x40

nops:
  nop; nop; nop
  nop; nop; nop
  nop; nop; nop

check_error_trap:
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop

  mov   TT_Corrected_ECC, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop


  ba    test_pass
  nop


My_Corrected_ECC_error_trap:
  ! Signal trap taken
  setx	EXECUTED, %l0, %o0
  ! save trap type value
  rdpr	%tt, %o1

  setx  SOC_PER_REG, %l7, %g6
  ldx   [%g6], %i1
  setx 	0x8000000000000004, %l7, %i2 

  sub     %i1, %i2, %g1
  brnz    %g1, test_fail 
  nop

  !DESR
  ldxa	[%g0]ASI_DESR, %o3

  setx	0xff00000000000000, %l1, %g3	! mask <63:56>
  and	%g3, %o3, %g4

  setx  0x8b00000000000000, %l1, %g2    ! <63>=F; <62>=Me; <61>=S -> 1 for sw_recov_err; 0 for hw_corr_err
                                        ! <60:56>=Err_type; SOCC=11=0xb

  sub   %g4, %g2, %g1
  brnz  %g1, test_fail
  nop
 
  !Clear PER
  stx   %g0, [%g6]

  retry
  nop



/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP



