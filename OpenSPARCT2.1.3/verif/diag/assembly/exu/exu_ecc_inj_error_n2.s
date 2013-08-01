/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: exu_ecc_inj_error_n2.s
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
#define H_HT0_Internal_Processor_Error_0x29 My_Internal_Processor_Error_Trap

#define  MAIN_PAGE_HV_ALSO
#define  ASI_DMMU               0x58
#define  ASI_SEI                0x43
#define  ASI_SES                0x4C	
	
#include "hboot.s"

.text
.global  main
.global  My_Internal_Processor_Error_Trap 


.align 64

main:
	
  ta    T_CHANGE_HPRIV
		
! Sparc Error Injection Register should power up 0
  ldxa  [%g0] ASI_SEI, %l1
  cmp   %l1, 0
  bne   test_fail
  nop
	
!  New Stuff

setx 0x0f0d0f0f, %i0, %i3
setx 0x0f0d0f0f, %i0, %i4

		
!enable cerer.bit_52
	
setx  0x10, %g0, %g1   !  VA for pscce 12.7.1 
setx  0x18, %g0, %g2   !  VA for ceter 12.7.2
	
set_pscce_bit52:		
setx  0x0010000000000000, %l0, %l2
stxa  %l2, [%g0+%g1] ASI_SES
ldxa  [%g0+%g1] ASI_SES, %l6
cmp   %l2, %l6
bne   test_fail	

	
set_ceter_bit62:
setx  0x4000000000000000, %l0, %l3
stxa  %l3, [%g0+%g2] ASI_SES    !enable ceter.pscce 12.7.2
ldxa  [%g0+%g2] ASI_SES, %l7	
cmp   %l3, %l7
bne   test_fail	
	
enable_err_inj_reg:
setx 0x0000000082000001, %i0, %l4   ! Enable error injection	
setx 0x0000000000000000, %i0, %l5   ! Enable error injection	
stxa  %l4, [%g0] ASI_SEI   !write_asi_err_inject_reg  pg:12.7.9
!ldxa  [%g0] ASI_SEI, %l6		
!cmp   %l4, %l6
!bne   test_fail	
	 
execute_instr_with_bad_ecc:	
add  %i3, %i4, %i4   ! <= shd cause an error to be injected
add  %i3, %i3, %i5   ! <= shd cause an error to be injected
		
stxa  %l5, [%g0]     ASI_SEI   !turn off error inject
		
add  %i0, %i0, %i0
add  %i0, %i0, %i0		
add  %i0, %i0, %i0	
add  %i0, %i0, %i0	
add  %i0, %i0, %i0	
add  %i0, %i0, %i0		
add  %i5, %i2, %i7      ! <= err shd be detected
add  %i0, %i0, %i0	
add  %i0, %i0, %i0	
add  %i0, %i0, %i0
add  %i4, %i0, %i4	
add  %i0, %i0, %i0	
add  %i0, %i0, %i0	
add  %i0, %i0, %i0	
		
	
  ba    test_fail
  nop


My_Internal_Processor_Error_Trap:

setx  0x10, %g0, %g1   !  VA for pscce 12.7.1 
setx  0x18, %g0, %g2   !  VA for ceter 12.7.2
setx  0x20, %g0, %g3   !  VA for ceter 12.7.4.2

!Check status registers
ldxa  [%g0+%g2] ASI_DMMU, %l6
ldxa  [%g0+%g3] ASI_DMMU, %l7	

setx  0x0000000000000002, %o0, %o6
cmp   %o6, %l6
bne   test_fail	
setx  0x000000000000409d, %o0, %o7
cmp   %o7, %l7
bne   test_fail
	
  ba    test_pass
  nop

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:


				
ta	T_GOOD_TRAP

test_fail:
ta	T_BAD_TRAP

	
