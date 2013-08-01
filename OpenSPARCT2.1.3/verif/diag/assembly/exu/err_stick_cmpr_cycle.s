/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: err_stick_cmpr_cycle.s
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
#define MY_HP_TEXT_PA     0x1050000000
#define MY_HP_DATA_PA     0x1050001000

#define ASI_PRIMARY_CONTEXT_0   0x21
#define ASI_ITLB_DATA_IN_REG    0x54
#define ASI_DMMU_TAG_ACCESS     0x58
#define ASI_DTLB_DATA_IN_REG    0x5c
#define ASI_DMMU_SFAR           0x58

			
#define IMDU_ERR_EN     0xa0000000
#define IMTU_ERR_EN     0x90000000
#define DMDU_ERR_EN     0x88000000
#define DMTU_ERR_EN     0x84000000
#define IRCU_ERR_EN     0x82000000
#define FRCU_ERR_EN     0x81000000
#define SCAU_ERR_EN     0x80800000
#define TCCU_ERR_EN     0x80400000
#define TSAU_ERR_EN     0x80200000
#define MRAU_ERR_EN     0x80100000
#define STAU_ERR_EN     0x80080000
#define STDU_ERR_EN     0x80020000

#define  ASI_DESR               0x4c
#define  ASI_DFESR              0x4c
#define  DFESR_VA               0x8
#define  ASI_DSFSR              0x58
#define  ASI_ISFSR              0x50
#define  SFSR_VA                0x18
#define  ASI_SFAR              	0x58
#define  SFAR_VA               	0x20
#define  ASI_ERR_INJ            0x43
#define  ASI_CETER              0x4C
#define  CETER_VA               0x18
#define  ASI_CERER              0x4C
#define  CERER_VA               0x10

#define  ASI_SEI                0x43
#define  ASI_SES                0x4C	

	
! #define  CERER_SBDPC            0x400
! #define  CETER_DHCCE    0x1000000000000000
! #define  CETER_DE       0x2000_0000_0000_0000
! #define  CETER_PSCCE    0x4000000000000000
#define  DCVP_ERR_TYPE   0x5

#define MAIN_PAGE_HV_ALSO

#define H_HT0_Internal_Processor_Error_0x29 My_Internal_Processor_Error_Trap
#define H_HT0_Sw_Recoverable_Error_0x40       My_Sw_Recoverable_Error
	
#include "hboot.s"

/************************************************************************
   Test case:	
 ************************************************************************/

.text
.global  main
.global  My_Internal_Processor_Error_Trap
.global  My_Sw_Recoverable_Error	
	
main:		/* test begin */
  ta    T_CHANGE_HPRIV


!!  Start new Tick compare code	
START_TICK_CMP_HERE:
    !! set CERER.TCCP
  setx 0x0000000000000080, %g1, %o2   !! enable tccp errs...bit 6&7
  add  %g0, CERER_VA, %g3     !! g3 has cerer va
  stxa %o2, [%g3]ASI_CERER

  setx  0x18, %g0, %g1   !  VA for pscce 12.8.2 
  set_pscce_bit52:		
  setx  0x7000000000000000, %l0, %l2
  stxa  %l2, [%g0+%g1] ASI_SES
  ldxa  [%g0+%g1] ASI_SES, %l6

	
!! Enable error injection
  setx TCCU_ERR_EN, %l0, %l1
  or %l1, 0x2, %l1            !! set mask bit 0 to 1
  stxa %l1, [%g0]ASI_ERR_INJ

  wr %o3, %o3,  %sys_tick_cmpr    !!  write bad ecc

  stxa %g0, [%g0]ASI_ERR_INJ   !! turn off err inject
	
TICK_CMP_INST_HERE:		
!  rd %tick_cmpr, %l3	  !! should trap here???

  sdivx  %o3, %o3, %o3  
  sdivx  %o3, %o3, %o3
  sdivx  %o3, %o3, %o3
  sdivx  %o3, %o3, %o3  
  sdivx  %o3, %o3, %o3
  sdivx  %o3, %o3, %o3
  sdivx  %o3, %o3, %o3  
  sdivx  %o3, %o3, %o3
  sdivx  %o3, %o3, %o3
  sdivx  %o3, %o3, %o3  
  sdivx  %o3, %o3, %o3
  sdivx  %o3, %o3, %o3
  sdivx  %o3, %o3, %o3  
  sdivx  %o3, %o3, %o3
  sdivx  %o3, %o3, %o3
  sdivx  %o3, %o3, %o3  
  sdivx  %o3, %o3, %o3	
	
!!  End new Tick compare code	

END_TICK_CMP_HERE:	

 ba    test_fail
 nop
	

My_Internal_Processor_Error_Trap:	 
add  %g0,  SFSR_VA, %g3         !! g3 has  va = 18
ldxa  [%g0+%g3] ASI_DSFSR, %l6	!!  ASI 0x58

setx  0x000000000000000C, %o0, %o6
cmp   %o6, %l6
bne   test_fail	

add  %g0,  SFAR_VA, %g3         !! g3 has  va = 20
ldxa  [%g0+%g3] ASI_DSFSR, %l7	!!  ASI 0x58

setx  0x0000000000000209, %o0, %o7
cmp   %o7, %l7
bne   test_fail	
			
  ba  test_pass
  nop

My_Sw_Recoverable_Error:

ldxa  [%g0+%g0] ASI_DESR, %l7	!!  ASI 0x58

setx  0xee00000000000209, %o0, %o7
cmp   %o7, %l7
bne   test_fail	
	
!! ADD CHECKING HERE
	
 ba  test_pass
 nop

	
	
/*******************************************************
 * Exit code
 *******************************************************/

	
test_pass:
ta	T_GOOD_TRAP

test_fail:
ta	T_BAD_TRAP
