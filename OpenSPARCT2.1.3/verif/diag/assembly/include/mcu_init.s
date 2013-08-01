/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mcu_init.s
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
#define H_HT0_Watchdog_Reset_0x02
#define My_HT0_Watchdog_Reset_0x02 \
	ta T_BAD_TRAP; \
	nop
#define My_RED_Mode_Other_Reset \
	ta T_BAD_TRAP; \
	nop

#define H_HT0_Hw_Corrected_Error_0x63
#define SUN_H_HT0_Hw_Corrected_Error_0x63 \
    setx My_H_HT0_Hw_Corrected_Error_0x63, %g1, %g2;\
    jmp %g2;\
    nop

#define H_HT0_Sw_Recoverable_Error_0x40
#define SUN_H_HT0_Sw_Recoverable_Error_0x40 \
    setx My_H_HT0_Sw_Recoverable_Error_0x40, %g1, %g2;\
    jmp %g2;\
    nop

#define H_HT0_Instruction_access_error_0x0a 
#define SUN_H_HT0_Instruction_access_error_0x0a \
    setx My_H_HT0_Instruction_access_error_0x0a, %g1, %g2;\
    jmp %g2;\
    nop

#define H_HT0_Data_access_error_0x32 
#define SUN_H_HT0_Data_access_error_0x32 \
    setx My_H_HT0_Data_access_error_0x32, %g1, %g2;\
    jmp %g2;\
    nop

!#define H_HT0_Instruction_Access_MMU_Error_0x71
!#define SUN_H_HT0_Instruction_Access_MMU_Error_0x71 \
!    setx My_H_HT0_Instruction_Access_MMU_Error_0x71, %g1, %g2;\
!    jmp %g2;\
!    nop
!
!#define H_HT0_Data_Access_MMU_Error_0x72
!#define SUN_H_HT0_Data_Access_MMU_Error_0x72 \
!    setx My_H_HT0_Data_Access_MMU_Error_0x72, %g1, %g2;\
!    jmp %g2;\
!    nop


#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define  L2_ESR_WRITE_1_TO_CLEAR                0xc03ffffc00000000
#define  L2_NOTDATA_REGISTER_WRITE_1_TO_CLEAR	0x000b000000000000
#define  L2_CONTROL_REGISTER               	0xa900000000
#define  L2_ERROR_ENABLE_REGISTER               0xaa00000000
#define  L2_ERROR_STATUS_REGISTER               0xab00000000
#define  L2_LAST_ERROR_STATUS_REGISTER          0xab000001c0
#define  L2_ERROR_ADDRESS_REGISTER              0xac00000000
#define  L2_NOTDATA_REGISTER		        0xae00000000

#define  DRAM_ESR_WRITE_1_TO_CLEAR              0xffc0000000000000
#define	 DRAM_SCRUB_FREQ_REG                    0x8400000018
#define	 DRAM_SCRUB_ENABLE_REG                  0x8400000040
#define  DRAM_ERROR_STATUS_REGISTER             0x8400000280
#define  DRAM_ERROR_ADDRESS_REGISTER            0x8400000288
#define	 DRAM_ERROR_INJECTION_REG               0x8400000290
#define  DRAM_ERROR_RETRY_REGISTER              0x84000002a8
#define  DRAM_FBD_ERROR_SYNDROME_REGISTER       0x8400000c00

#define  PREFETCH_ICE_BASE_ADDRESS              0x6000000000
#define  VALID_BIT	                        0x8000000000
#define  MYDATA                                 0xdeadbeefdeadbeef


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


.text
.global main

.global My_H_HT0_Hw_Corrected_Error_0x63
.global My_H_HT0_Sw_Recoverable_Error_0x40
.global My_H_HT0_Instruction_access_error_0x0a
.global My_H_HT0_Data_access_error_0x32
!.global My_H_HT0_Instruction_Access_MMU_Error_0x71
!.global My_H_HT0_Data_Access_MMU_Error_0x72



!*******************             BEGIN OF TEST         ******************** 

main:
  ta T_CHANGE_HPRIV

disable_L1_d_cache:
  ldxa [%g0] 0x45, %l0
  andn %l0, 0x2, %l0
  stxa %l0, [%g0] 0x45

L2_direct_mapped_mode:
  setx L2_CONTROL_REGISTER, %l0, %g3
  mov 2, %g1
  mov 8, %g2
1:
  stx %g1, [%g3]
  add %g3, 0x40, %g3
  dec %g2
  brnz %g2,1b
  nop

report_error_from_L2_to_core:
  setx L2_ERROR_ENABLE_REGISTER, %l0, %g3
  mov 3, %g1
  mov 8, %g2
1:
  ldx [%g3], %g4
  or %g4, %g1, %g4
  stx %g4, [%g3]
  add %g3, 0x40, %g3
  dec %g2
  brnz %g2,1b
  nop

start_diag:
  clr %o7

