/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ecc_inj_error_n2.s
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

!include "err_defines_n2.h"

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
setx  0x0004000000000000, %l0, %l2
stxa  %l2, [%g0+%g1] ASI_SES
ldxa  [%g0+%g1] ASI_SES, %l6

set_ceter_bit62:
setx  0x4000000000000000, %l0, %l3
stxa  %l3, [%g0+%g2] ASI_SES    !enable ceter.pscce 12.7.2
ldxa  [%g0+%g2] ASI_SES, %l7	

enable_err_inj_reg:
setx 0x0000000081000001, %i0, %l4   ! Enable error injection	
setx 0x0000000000000000, %i0, %l5   ! Enable error injection	
stxa  %l4, [%g0] ASI_SEI   !write_asi_err_inject_reg  pg:12.7.9
ldxa  [%g0] ASI_SEI, %l6		

execute_instr_with_bad_ecc:	
fadds  %f3, %f4, %f5
fadds  %f0, %f0, %f0
		
stxa  %l5, [%g0]     ASI_SEI   !turn off error inject
!stxa  %l5, [%g0+%g1] ASI_SES	 
!stxa  %l5, [%g0+%g2] ASI_SES 	
		
	
fadds  %f5, %f2, %f7
fadds  %f0, %f0, %f0
fadds  %f0, %f0, %f0	
fadds  %f0, %f0, %f0	
fadds  %f0, %f0, %f0	
fadds  %f0, %f0, %f0	
fadds  %f0, %f0, %f0	
fadds  %f0, %f0, %f0	
fadds  %f5, %f2, %f7	
							
		
!add  %i3, %i4, %i5     ! <= shd cause an error to be injected
!add  %i5, %i4, %i2     ! <= err shd be detected

	
  ba    test_fail
  nop


My_Internal_Processor_Error_Trap:

setx  0x10, %g0, %g1   !  VA for pscce 12.7.1 
setx  0x18, %g0, %g2   !  VA for ceter 12.7.2
setx  0x20, %g0, %g3   !  VA for ceter 12.7.4.2

!Check status registers
ldxa  [%g0+%g2] ASI_DMMU, %l6
ldxa  [%g0+%g3] ASI_DMMU, %l7	

setx  0x0000000000000004, %o0, %o6
cmp   %o6, %l6
bne   test_fail	
setx  0x0000000000001045, %o0, %o7
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

	
