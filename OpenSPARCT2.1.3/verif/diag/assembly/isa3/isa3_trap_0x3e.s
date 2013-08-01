/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_trap_0x3e.s
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
#define MY_USER_TEXT_VA   0xa0000
#define MY_USER_TEXT_RA   0x00000000400b0000
#define MY_USER_TEXT_PA   0x00000010400b0000
#define MY_PRIV_TEXT_VA   0xc0000
#define MY_PRIV_TEXT_RA   0x00000000400d0000
#define MY_PRIV_TEXT_PA   0x00000010400d0000
#define MY_PRIV_DATA_VA   0xe0000
#define MY_PRIV_DATA_RA   0x00000000400f0000
#define MY_PRIV_DATA_PA   0x00000010400f0000
#define MY_HP_TEXT_PA     0x0000001050000000
	
!!! Custom trap handler
#define H_HT0_Instr_Real_Tran_Miss_0x3e
#define My_HT0_Instr_Real_Tran_Miss_0x3e	\
	setx My_HP_Code_Begin, %l1, %l3		; \
	jmp %l3			; \
	nop			; 

#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_NUCLEUS_ALSO
	
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main
.global test_point
		
main:		/* test begin */
	!!! We are assuming IM bit is set at this point!
	ta T_CHANGE_HPRIV
	! Can't do the read and xor to flip the IM bit because of a bug in Simics
	! Hard-code the value for lsu_ctl_reg with IM=0
	!ldxa [%g0] ASI_LSU_CTL_REG, %l1
	!xor %l1, 4, %l1 ! clearing IM bit
	setx 0x01b, %l1, %l2
	stxa %l2, [%g0] ASI_LSU_CTL_REG
	!!! The following code is still in bypass mode
	ta T_CHANGE_NONHPRIV
	!!! Trap should occur here, IM = 0, HPRIV = 0, HRED = 0
test_point:	
	ta T_CHANGE_NONPRIV
	EXIT_BAD
	nop

/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.word 0xD6B3479D
.word 0xDB28926C

SECTION .My_HP_Section TEXT_VA=MY_HP_TEXT_PA
attr_text {
	Name = .My_HP_Section,
	hypervisor
	}
.text
.global My_HP_Code_Begin

My_HP_Code_Begin:
	setx test_point, %l1, %l3
	rdpr %tpc, %l2
	cmp %l2, %l3
	bne test_failed
	nop	
	EXIT_GOOD
test_failed:
	EXIT_BAD
	
SECTION .My_User_Section TEXT_VA=MY_USER_TEXT_VA
attr_text {
	Name = .My_User_Section,
	VA = MY_USER_TEXT_VA,
        RA = MY_USER_TEXT_RA,
        PA = MY_USER_TEXT_PA,
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

SECTION .My_Priv_Section TEXT_VA=MY_PRIV_TEXT_VA
attr_text {
	Name = .My_Priv_Section,
	VA = MY_PRIV_TEXT_VA,
        RA = MY_PRIV_TEXT_RA,
        PA = MY_PRIV_TEXT_PA,
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
	
SECTION .My_Priv_Data_Section DATA_VA=MY_PRIV_DATA_VA
attr_data {
	Name = .My_Priv_Data_Section,
	VA = MY_PRIV_DATA_VA,
        RA = MY_PRIV_DATA_RA,
        PA = MY_PRIV_DATA_PA,
	part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
	}

.data
.global supervisor_data_begin

supervisor_data_begin:	
	.xword 1212121212121212
	.xword 1313131313131313
	.xword 1414141414141414
	.xword 1515151515151515

.end
