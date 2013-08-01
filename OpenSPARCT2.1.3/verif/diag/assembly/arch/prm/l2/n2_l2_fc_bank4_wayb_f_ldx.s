/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_l2_fc_bank4_wayb_f_ldx.s
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
	setx 0x200b0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200b8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200c8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200d8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200e8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x200f8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210b8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210c8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210d8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210e8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x210f8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220b8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220c8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220d8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220e8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x220f8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230b8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230c8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230d8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230e8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x230f8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240b8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240c8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240d8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240e8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x240f8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250b8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250c8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250d8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250e8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x250f8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260b8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260c8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260d8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260e8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x260f8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270b8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270c8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270d8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270e8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x270f8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f0100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f1100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f2100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f3100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f4100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f5100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f6100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f7100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280b8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280c8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280d8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280e8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
	membar #Sync
	ldx [%g2], %g3
	ldx [%g2], %g3
	membar #Sync
	ldx [%g2+8], %g3
	membar #Sync
	ldx [%g2+16], %g3
	membar #Sync
	setx 0x280f8100,%l0,%g2
	stx %g5,[%g2]
	stx %g5,[%g2+8]
	stx %g5,[%g2+16]
	stx %g5,[%g2+32]
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
