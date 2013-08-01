/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_l2_fc_bank0_wayb_f_ldx.s
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
	setx 0x200b0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f0000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f0200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f0400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f0600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f0800,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f01000,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f01200,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f01400,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f01600,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
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
