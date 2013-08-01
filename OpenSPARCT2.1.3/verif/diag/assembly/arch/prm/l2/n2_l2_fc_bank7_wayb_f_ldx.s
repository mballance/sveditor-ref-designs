/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_l2_fc_bank7_wayb_f_ldx.s
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
#define H_HT0_Sw_Recoverable_Error_0x40 My_Corrected_ECC_error_trap
#define MAIN_PAGE_HV_ALSO
#define  TEST_DATA        0x555555555555555
#define  L2_ES_W1C_VALUE  0xc03ffff800000000
#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"
.text
.global main
.global  My_Corrected_ECC_error_trap
main:
main_text_start:
! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  TEST_DATA, %l0, %g5
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
set_L2_Directly_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1
  mov   0x2, %l0
  stx   %l0, [%g1]

!Initializing
	setx 0x200b01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f01c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f11c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f21c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f31c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f41c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f51c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f61c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f71c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f81c0,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
main_text_end:
ba    test_pass
  nop
My_Corrected_ECC_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  inc  %g4
  setx 0x202000100,%l1,%l2
  stx  %g4,[%l2]
  done
  nop
test_pass:
        ta %icc, T_GOOD_TRAP;

#if 0
#endif
