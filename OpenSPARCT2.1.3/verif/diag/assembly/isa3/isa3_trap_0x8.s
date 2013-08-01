/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_trap_0x8.s
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
#define MY_USER_VA   0xa0000
#define MY_USER_RA   0x00000000400b0000
#define MY_USER_PA   0x00000010400b0000
#define MY_PRIV_VA   0xd0000
#define MY_PRIV_RA   0x00000000400e0000
#define MY_PRIV_PA   0x00000010400e0000

#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_NUCLEUS_ALSO
	
!!! Custom trap handler
#define H_HT0_IAE_privilege_violation_0x08
#define My_HT0_IAE_privilege_violation_0x08 	\
	EXIT_GOOD		; \
	nop			; 
!	setx my_hp_code, %l1, %l2 ; \
!	jmp %l2  		; \
!	nop			; 

#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b	\
	EXIT_GOOD	;	\
	nop		;

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	!ta T_CHANGE_HPRIV
	!mov 16, %l1
	!ldxa [%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %l2
	!add %l2, 2, %l2
	!stxa	%l2, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	!ta T_CHANGE_NONHPRIV
	!ta T_CHANGE_NONPRIV
	!ta T_CHANGE_PRIV
	setx supervisor_code_begin, %l1, %l3
	jmp %l3
	nop

	EXIT_BAD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.word 0xD6B3479D
.word 0xDB28926C

SECTION .My_User_Section TEXT_VA=MY_USER_VA
attr_text {
	Name = .My_User_Section,
	VA = MY_USER_VA,
        RA = MY_USER_RA,
        PA = MY_USER_PA,
	part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
	}

.text
.global user_code_begin
	
user_code_begin:
	nop
	nop
	EXIT_GOOD

SECTION .My_Priv_Section TEXT_VA=MY_PRIV_VA
attr_text {
	Name = .My_Priv_Section,
	VA = MY_PRIV_VA,
        RA = MY_PRIV_RA,
        PA = MY_PRIV_PA,
	part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
	}

.text
.global supervisor_code_begin

supervisor_code_begin:
	nop	! should take a trap here
	nop
	EXIT_BAD
	
.end
