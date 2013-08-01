/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_l2_fc_bank2_wayb_f_ldx.s
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
	setx 0x200b0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f0080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f0280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f0480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f0680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f0880,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f01080,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f01280,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f01480,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f01680,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
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
