/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_l2_fc_bank1_wayb_f_ldx.s
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
	setx 0x200b0040,%l0,%g2
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
	setx 0x200c0040,%l0,%g2
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
	setx 0x200d0040,%l0,%g2
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
	setx 0x200e0040,%l0,%g2
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
	setx 0x200f0040,%l0,%g2
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
	setx 0x200b0240,%l0,%g2
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
	setx 0x200c0240,%l0,%g2
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
	setx 0x200d0240,%l0,%g2
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
	setx 0x200e0240,%l0,%g2
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
	setx 0x200f0240,%l0,%g2
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
	setx 0x200b0440,%l0,%g2
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
	setx 0x200c0440,%l0,%g2
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
	setx 0x200d0440,%l0,%g2
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
	setx 0x200e0440,%l0,%g2
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
	setx 0x200f0440,%l0,%g2
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
	setx 0x200b0640,%l0,%g2
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
	setx 0x200c0640,%l0,%g2
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
	setx 0x200d0640,%l0,%g2
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
	setx 0x200e0640,%l0,%g2
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
	setx 0x200f0640,%l0,%g2
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
	setx 0x200b0840,%l0,%g2
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
	setx 0x200c0840,%l0,%g2
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
	setx 0x200d0840,%l0,%g2
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
	setx 0x200e0840,%l0,%g2
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
	setx 0x200f0840,%l0,%g2
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
	setx 0x200b01040,%l0,%g2
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
	setx 0x200c01040,%l0,%g2
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
	setx 0x200d01040,%l0,%g2
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
	setx 0x200e01040,%l0,%g2
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
	setx 0x200f01040,%l0,%g2
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
	setx 0x200b01240,%l0,%g2
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
	setx 0x200c01240,%l0,%g2
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
	setx 0x200d01240,%l0,%g2
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
	setx 0x200e01240,%l0,%g2
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
	setx 0x200f01240,%l0,%g2
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
	setx 0x200b01440,%l0,%g2
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
	setx 0x200c01440,%l0,%g2
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
	setx 0x200d01440,%l0,%g2
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
	setx 0x200e01440,%l0,%g2
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
	setx 0x200f01440,%l0,%g2
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
	setx 0x200b01640,%l0,%g2
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
	setx 0x200c01640,%l0,%g2
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
	setx 0x200d01640,%l0,%g2
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
	setx 0x200e01640,%l0,%g2
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
	setx 0x200f01640,%l0,%g2
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
	setx 0x210b0040,%l0,%g2
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
	setx 0x210c0040,%l0,%g2
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
	setx 0x210d0040,%l0,%g2
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
	setx 0x210e0040,%l0,%g2
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
	setx 0x210f0040,%l0,%g2
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
	setx 0x210b0240,%l0,%g2
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
	setx 0x210c0240,%l0,%g2
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
	setx 0x210d0240,%l0,%g2
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
	setx 0x210e0240,%l0,%g2
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
	setx 0x210f0240,%l0,%g2
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
	setx 0x210b0440,%l0,%g2
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
	setx 0x210c0440,%l0,%g2
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
	setx 0x210d0440,%l0,%g2
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
	setx 0x210e0440,%l0,%g2
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
	setx 0x210f0440,%l0,%g2
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
	setx 0x210b0640,%l0,%g2
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
	setx 0x210c0640,%l0,%g2
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
	setx 0x210d0640,%l0,%g2
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
	setx 0x210e0640,%l0,%g2
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
	setx 0x210f0640,%l0,%g2
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
	setx 0x210b0840,%l0,%g2
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
	setx 0x210c0840,%l0,%g2
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
	setx 0x210d0840,%l0,%g2
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
	setx 0x210e0840,%l0,%g2
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
	setx 0x210f0840,%l0,%g2
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
	setx 0x210b01040,%l0,%g2
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
	setx 0x210c01040,%l0,%g2
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
	setx 0x210d01040,%l0,%g2
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
	setx 0x210e01040,%l0,%g2
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
	setx 0x210f01040,%l0,%g2
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
	setx 0x210b01240,%l0,%g2
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
	setx 0x210c01240,%l0,%g2
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
	setx 0x210d01240,%l0,%g2
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
	setx 0x210e01240,%l0,%g2
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
	setx 0x210f01240,%l0,%g2
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
	setx 0x210b01440,%l0,%g2
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
	setx 0x210c01440,%l0,%g2
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
	setx 0x210d01440,%l0,%g2
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
	setx 0x210e01440,%l0,%g2
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
	setx 0x210f01440,%l0,%g2
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
	setx 0x210b01640,%l0,%g2
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
	setx 0x210c01640,%l0,%g2
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
	setx 0x210d01640,%l0,%g2
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
	setx 0x210e01640,%l0,%g2
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
	setx 0x210f01640,%l0,%g2
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
	setx 0x220b0040,%l0,%g2
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
	setx 0x220c0040,%l0,%g2
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
	setx 0x220d0040,%l0,%g2
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
	setx 0x220e0040,%l0,%g2
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
	setx 0x220f0040,%l0,%g2
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
	setx 0x220b0240,%l0,%g2
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
	setx 0x220c0240,%l0,%g2
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
	setx 0x220d0240,%l0,%g2
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
	setx 0x220e0240,%l0,%g2
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
	setx 0x220f0240,%l0,%g2
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
	setx 0x220b0440,%l0,%g2
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
	setx 0x220c0440,%l0,%g2
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
	setx 0x220d0440,%l0,%g2
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
	setx 0x220e0440,%l0,%g2
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
	setx 0x220f0440,%l0,%g2
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
	setx 0x220b0640,%l0,%g2
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
	setx 0x220c0640,%l0,%g2
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
	setx 0x220d0640,%l0,%g2
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
	setx 0x220e0640,%l0,%g2
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
	setx 0x220f0640,%l0,%g2
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
	setx 0x220b0840,%l0,%g2
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
	setx 0x220c0840,%l0,%g2
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
	setx 0x220d0840,%l0,%g2
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
	setx 0x220e0840,%l0,%g2
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
	setx 0x220f0840,%l0,%g2
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
	setx 0x220b01040,%l0,%g2
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
	setx 0x220c01040,%l0,%g2
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
	setx 0x220d01040,%l0,%g2
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
	setx 0x220e01040,%l0,%g2
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
	setx 0x220f01040,%l0,%g2
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
	setx 0x220b01240,%l0,%g2
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
	setx 0x220c01240,%l0,%g2
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
	setx 0x220d01240,%l0,%g2
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
	setx 0x220e01240,%l0,%g2
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
	setx 0x220f01240,%l0,%g2
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
	setx 0x220b01440,%l0,%g2
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
	setx 0x220c01440,%l0,%g2
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
	setx 0x220d01440,%l0,%g2
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
	setx 0x220e01440,%l0,%g2
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
	setx 0x220f01440,%l0,%g2
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
	setx 0x220b01640,%l0,%g2
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
	setx 0x220c01640,%l0,%g2
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
	setx 0x220d01640,%l0,%g2
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
	setx 0x220e01640,%l0,%g2
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
	setx 0x220f01640,%l0,%g2
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
	setx 0x230b0040,%l0,%g2
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
	setx 0x230c0040,%l0,%g2
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
	setx 0x230d0040,%l0,%g2
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
	setx 0x230e0040,%l0,%g2
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
	setx 0x230f0040,%l0,%g2
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
	setx 0x230b0240,%l0,%g2
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
	setx 0x230c0240,%l0,%g2
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
	setx 0x230d0240,%l0,%g2
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
	setx 0x230e0240,%l0,%g2
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
	setx 0x230f0240,%l0,%g2
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
	setx 0x230b0440,%l0,%g2
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
	setx 0x230c0440,%l0,%g2
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
	setx 0x230d0440,%l0,%g2
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
	setx 0x230e0440,%l0,%g2
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
	setx 0x230f0440,%l0,%g2
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
	setx 0x230b0640,%l0,%g2
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
	setx 0x230c0640,%l0,%g2
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
	setx 0x230d0640,%l0,%g2
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
	setx 0x230e0640,%l0,%g2
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
	setx 0x230f0640,%l0,%g2
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
	setx 0x230b0840,%l0,%g2
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
	setx 0x230c0840,%l0,%g2
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
	setx 0x230d0840,%l0,%g2
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
	setx 0x230e0840,%l0,%g2
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
	setx 0x230f0840,%l0,%g2
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
	setx 0x230b01040,%l0,%g2
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
	setx 0x230c01040,%l0,%g2
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
	setx 0x230d01040,%l0,%g2
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
	setx 0x230e01040,%l0,%g2
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
	setx 0x230f01040,%l0,%g2
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
	setx 0x230b01240,%l0,%g2
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
	setx 0x230c01240,%l0,%g2
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
	setx 0x230d01240,%l0,%g2
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
	setx 0x230e01240,%l0,%g2
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
	setx 0x230f01240,%l0,%g2
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
	setx 0x230b01440,%l0,%g2
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
	setx 0x230c01440,%l0,%g2
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
	setx 0x230d01440,%l0,%g2
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
	setx 0x230e01440,%l0,%g2
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
	setx 0x230f01440,%l0,%g2
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
	setx 0x230b01640,%l0,%g2
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
	setx 0x230c01640,%l0,%g2
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
	setx 0x230d01640,%l0,%g2
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
	setx 0x230e01640,%l0,%g2
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
	setx 0x230f01640,%l0,%g2
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
	setx 0x240b0040,%l0,%g2
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
	setx 0x240c0040,%l0,%g2
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
	setx 0x240d0040,%l0,%g2
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
	setx 0x240e0040,%l0,%g2
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
	setx 0x240f0040,%l0,%g2
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
	setx 0x240b0240,%l0,%g2
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
	setx 0x240c0240,%l0,%g2
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
	setx 0x240d0240,%l0,%g2
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
	setx 0x240e0240,%l0,%g2
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
	setx 0x240f0240,%l0,%g2
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
	setx 0x240b0440,%l0,%g2
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
	setx 0x240c0440,%l0,%g2
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
	setx 0x240d0440,%l0,%g2
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
	setx 0x240e0440,%l0,%g2
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
	setx 0x240f0440,%l0,%g2
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
	setx 0x240b0640,%l0,%g2
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
	setx 0x240c0640,%l0,%g2
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
	setx 0x240d0640,%l0,%g2
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
	setx 0x240e0640,%l0,%g2
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
	setx 0x240f0640,%l0,%g2
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
	setx 0x240b0840,%l0,%g2
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
	setx 0x240c0840,%l0,%g2
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
	setx 0x240d0840,%l0,%g2
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
	setx 0x240e0840,%l0,%g2
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
	setx 0x240f0840,%l0,%g2
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
	setx 0x240b01040,%l0,%g2
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
	setx 0x240c01040,%l0,%g2
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
	setx 0x240d01040,%l0,%g2
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
	setx 0x240e01040,%l0,%g2
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
	setx 0x240f01040,%l0,%g2
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
	setx 0x240b01240,%l0,%g2
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
	setx 0x240c01240,%l0,%g2
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
	setx 0x240d01240,%l0,%g2
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
	setx 0x240e01240,%l0,%g2
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
	setx 0x240f01240,%l0,%g2
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
	setx 0x240b01440,%l0,%g2
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
	setx 0x240c01440,%l0,%g2
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
	setx 0x240d01440,%l0,%g2
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
	setx 0x240e01440,%l0,%g2
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
	setx 0x240f01440,%l0,%g2
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
	setx 0x240b01640,%l0,%g2
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
	setx 0x240c01640,%l0,%g2
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
	setx 0x240d01640,%l0,%g2
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
	setx 0x240e01640,%l0,%g2
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
	setx 0x240f01640,%l0,%g2
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
	setx 0x250b0040,%l0,%g2
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
	setx 0x250c0040,%l0,%g2
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
	setx 0x250d0040,%l0,%g2
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
	setx 0x250e0040,%l0,%g2
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
	setx 0x250f0040,%l0,%g2
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
	setx 0x250b0240,%l0,%g2
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
	setx 0x250c0240,%l0,%g2
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
	setx 0x250d0240,%l0,%g2
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
	setx 0x250e0240,%l0,%g2
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
	setx 0x250f0240,%l0,%g2
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
	setx 0x250b0440,%l0,%g2
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
	setx 0x250c0440,%l0,%g2
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
	setx 0x250d0440,%l0,%g2
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
	setx 0x250e0440,%l0,%g2
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
	setx 0x250f0440,%l0,%g2
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
	setx 0x250b0640,%l0,%g2
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
	setx 0x250c0640,%l0,%g2
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
	setx 0x250d0640,%l0,%g2
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
	setx 0x250e0640,%l0,%g2
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
	setx 0x250f0640,%l0,%g2
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
	setx 0x250b0840,%l0,%g2
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
	setx 0x250c0840,%l0,%g2
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
	setx 0x250d0840,%l0,%g2
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
	setx 0x250e0840,%l0,%g2
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
	setx 0x250f0840,%l0,%g2
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
	setx 0x250b01040,%l0,%g2
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
	setx 0x250c01040,%l0,%g2
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
	setx 0x250d01040,%l0,%g2
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
	setx 0x250e01040,%l0,%g2
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
	setx 0x250f01040,%l0,%g2
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
	setx 0x250b01240,%l0,%g2
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
	setx 0x250c01240,%l0,%g2
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
	setx 0x250d01240,%l0,%g2
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
	setx 0x250e01240,%l0,%g2
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
	setx 0x250f01240,%l0,%g2
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
	setx 0x250b01440,%l0,%g2
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
	setx 0x250c01440,%l0,%g2
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
	setx 0x250d01440,%l0,%g2
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
	setx 0x250e01440,%l0,%g2
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
	setx 0x250f01440,%l0,%g2
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
	setx 0x250b01640,%l0,%g2
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
	setx 0x250c01640,%l0,%g2
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
	setx 0x250d01640,%l0,%g2
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
	setx 0x250e01640,%l0,%g2
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
	setx 0x250f01640,%l0,%g2
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
	setx 0x260b0040,%l0,%g2
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
	setx 0x260c0040,%l0,%g2
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
	setx 0x260d0040,%l0,%g2
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
	setx 0x260e0040,%l0,%g2
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
	setx 0x260f0040,%l0,%g2
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
	setx 0x260b0240,%l0,%g2
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
	setx 0x260c0240,%l0,%g2
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
	setx 0x260d0240,%l0,%g2
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
	setx 0x260e0240,%l0,%g2
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
	setx 0x260f0240,%l0,%g2
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
	setx 0x260b0440,%l0,%g2
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
	setx 0x260c0440,%l0,%g2
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
	setx 0x260d0440,%l0,%g2
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
	setx 0x260e0440,%l0,%g2
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
	setx 0x260f0440,%l0,%g2
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
	setx 0x260b0640,%l0,%g2
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
	setx 0x260c0640,%l0,%g2
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
	setx 0x260d0640,%l0,%g2
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
	setx 0x260e0640,%l0,%g2
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
	setx 0x260f0640,%l0,%g2
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
	setx 0x260b0840,%l0,%g2
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
	setx 0x260c0840,%l0,%g2
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
	setx 0x260d0840,%l0,%g2
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
	setx 0x260e0840,%l0,%g2
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
	setx 0x260f0840,%l0,%g2
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
	setx 0x260b01040,%l0,%g2
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
	setx 0x260c01040,%l0,%g2
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
	setx 0x260d01040,%l0,%g2
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
	setx 0x260e01040,%l0,%g2
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
	setx 0x260f01040,%l0,%g2
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
	setx 0x260b01240,%l0,%g2
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
	setx 0x260c01240,%l0,%g2
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
	setx 0x260d01240,%l0,%g2
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
	setx 0x260e01240,%l0,%g2
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
	setx 0x260f01240,%l0,%g2
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
	setx 0x260b01440,%l0,%g2
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
	setx 0x260c01440,%l0,%g2
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
	setx 0x260d01440,%l0,%g2
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
	setx 0x260e01440,%l0,%g2
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
	setx 0x260f01440,%l0,%g2
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
	setx 0x260b01640,%l0,%g2
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
	setx 0x260c01640,%l0,%g2
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
	setx 0x260d01640,%l0,%g2
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
	setx 0x260e01640,%l0,%g2
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
	setx 0x260f01640,%l0,%g2
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
	setx 0x270b0040,%l0,%g2
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
	setx 0x270c0040,%l0,%g2
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
	setx 0x270d0040,%l0,%g2
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
	setx 0x270e0040,%l0,%g2
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
	setx 0x270f0040,%l0,%g2
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
	setx 0x270b0240,%l0,%g2
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
	setx 0x270c0240,%l0,%g2
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
	setx 0x270d0240,%l0,%g2
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
	setx 0x270e0240,%l0,%g2
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
	setx 0x270f0240,%l0,%g2
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
	setx 0x270b0440,%l0,%g2
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
	setx 0x270c0440,%l0,%g2
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
	setx 0x270d0440,%l0,%g2
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
	setx 0x270e0440,%l0,%g2
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
	setx 0x270f0440,%l0,%g2
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
	setx 0x270b0640,%l0,%g2
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
	setx 0x270c0640,%l0,%g2
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
	setx 0x270d0640,%l0,%g2
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
	setx 0x270e0640,%l0,%g2
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
	setx 0x270f0640,%l0,%g2
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
	setx 0x270b0840,%l0,%g2
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
	setx 0x270c0840,%l0,%g2
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
	setx 0x270d0840,%l0,%g2
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
	setx 0x270e0840,%l0,%g2
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
	setx 0x270f0840,%l0,%g2
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
	setx 0x270b01040,%l0,%g2
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
	setx 0x270c01040,%l0,%g2
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
	setx 0x270d01040,%l0,%g2
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
	setx 0x270e01040,%l0,%g2
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
	setx 0x270f01040,%l0,%g2
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
	setx 0x270b01240,%l0,%g2
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
	setx 0x270c01240,%l0,%g2
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
	setx 0x270d01240,%l0,%g2
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
	setx 0x270e01240,%l0,%g2
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
	setx 0x270f01240,%l0,%g2
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
	setx 0x270b01440,%l0,%g2
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
	setx 0x270c01440,%l0,%g2
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
	setx 0x270d01440,%l0,%g2
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
	setx 0x270e01440,%l0,%g2
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
	setx 0x270f01440,%l0,%g2
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
	setx 0x270b01640,%l0,%g2
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
	setx 0x270c01640,%l0,%g2
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
	setx 0x270d01640,%l0,%g2
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
	setx 0x270e01640,%l0,%g2
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
	setx 0x270f01640,%l0,%g2
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
	setx 0x280b0040,%l0,%g2
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
	setx 0x280c0040,%l0,%g2
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
	setx 0x280d0040,%l0,%g2
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
	setx 0x280e0040,%l0,%g2
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
	setx 0x280f0040,%l0,%g2
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
	setx 0x280b0240,%l0,%g2
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
	setx 0x280c0240,%l0,%g2
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
	setx 0x280d0240,%l0,%g2
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
	setx 0x280e0240,%l0,%g2
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
	setx 0x280f0240,%l0,%g2
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
	setx 0x280b0440,%l0,%g2
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
	setx 0x280c0440,%l0,%g2
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
	setx 0x280d0440,%l0,%g2
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
	setx 0x280e0440,%l0,%g2
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
	setx 0x280f0440,%l0,%g2
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
	setx 0x280b0640,%l0,%g2
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
	setx 0x280c0640,%l0,%g2
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
	setx 0x280d0640,%l0,%g2
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
	setx 0x280e0640,%l0,%g2
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
	setx 0x280f0640,%l0,%g2
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
	setx 0x280b0840,%l0,%g2
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
	setx 0x280c0840,%l0,%g2
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
	setx 0x280d0840,%l0,%g2
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
	setx 0x280e0840,%l0,%g2
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
	setx 0x280f0840,%l0,%g2
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
	setx 0x280b01040,%l0,%g2
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
	setx 0x280c01040,%l0,%g2
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
	setx 0x280d01040,%l0,%g2
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
	setx 0x280e01040,%l0,%g2
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
	setx 0x280f01040,%l0,%g2
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
	setx 0x280b01240,%l0,%g2
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
	setx 0x280c01240,%l0,%g2
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
	setx 0x280d01240,%l0,%g2
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
	setx 0x280e01240,%l0,%g2
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
	setx 0x280f01240,%l0,%g2
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
	setx 0x280b01440,%l0,%g2
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
	setx 0x280c01440,%l0,%g2
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
	setx 0x280d01440,%l0,%g2
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
	setx 0x280e01440,%l0,%g2
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
	setx 0x280f01440,%l0,%g2
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
	setx 0x280b01640,%l0,%g2
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
	setx 0x280c01640,%l0,%g2
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
	setx 0x280d01640,%l0,%g2
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
	setx 0x280e01640,%l0,%g2
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
	setx 0x280f01640,%l0,%g2
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
