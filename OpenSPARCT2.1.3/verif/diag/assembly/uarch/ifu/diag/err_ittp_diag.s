/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: err_ittp_diag.s
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

			
#define MY_USER_TEXT_VA000      0x7a000000
#define MY_USER_TEXT_RA000      0x7b000000
#define MY_USER_TEXT_PA000      0x107b000000
#define MY_USER_TEXT_VA001      0x7a010000
#define MY_USER_TEXT_RA001      0x7b010000
#define MY_USER_TEXT_PA001      0x107b010000

#define MY_USER_DATA_VA000      0x6a000000
#define MY_USER_DATA_RA000      0x6b000000
#define MY_USER_DATA_PA000      0x106b000000
#define MY_USER_DATA_VA001      0x6a010000
#define MY_USER_DATA_RA001      0x6b010000
#define MY_USER_DATA_PA001      0x106b010000

#define MAIN_PAGE_HV_ALSO
!! enable error detcetion. Disable error injection.
#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
  	add %g0, CERER_VA, %g3;	\
  	stxa %o2, [%g3]ASI_CERER; \
  	stxa %g0, [%g0]ASI_ERR_INJ; \
        done;nop;nop;nop;nop

#define H_HT0_Data_Access_MMU_Error_0x72
#define SUN_H_HT0_Data_Access_MMU_Error_0x72 \
	ba DATA_ACCESS_ERROR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

#define H_HT0_Instruction_Access_MMU_Error_0x71
#define SUN_H_HT0_Instruction_Access_MMU_Error_0x71 \
	ba INST_ACCESS_MMU_ERROR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

#define  ERR_INJ_IMTU 1
#define CERER_ITTP 1
#define CETER_PSCCE 0
#define CETER_DE 0
#define CETER_DHCCE 0
#include "hboot.s"

/************************************************************************
   Test case:	
 ************************************************************************/

.text
.global main
!! Enable err_injection and err_detection. The pg to which we are jumping 
!! is a tLB miss, it will be loaded in TLB with err injected and then
!! on the TLB lookup error will be seen. When we first lookup the pg, it is
!! a TLB miss. The err_hanlder clears error detection but err_injection is
!!on so pg is reloaded with parity err.
main:		/* test begin */
  ta    T_CHANGE_HPRIV

  !! Enable error injection
  setx ERR_INJ_REG_DATA, %l0, %l1
  stxa %l1, [%g0]ASI_ERR_INJ

  setx CERER_DATA, %l0, %o2

  ta T_CHANGE_NONHPRIV	
  mov %g0, %i0
  setx user_code_begin_000, %g1, %l4
  jmp  %l4
  nop
  EXIT_BAD
  nop
	


/************************************************************************
   Test case data start
 ************************************************************************/
.data
.global user_data_start
user_data_start:
.word 0xD6B3479D
.word 0xDB28926C

!#***********************************************************************
	
SECTION .My_User_Section_4v000 TEXT_VA=MY_USER_TEXT_VA000, DATA_VA=MY_USER_DATA_VA000
attr_text {
	Name = .My_User_Section_4v000,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA000,
	RA = MY_USER_TEXT_RA000,
	PA = ra2pa(MY_USER_TEXT_RA000, 0),
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}

!! Take mis aligned trap. The trap handler enables err_detection and 
!! clears err_injection. On return from trap handler, mmu_err trap is
!! taken for label TH0_done. The pg is reloaded with no err.
.text
.global user_code_begin_000
user_code_begin_000:
	cmp     %i0, 0x1
	bne     FAIL
	mov 	%g0, %i0
	setx user_data_begin_000, %g1, %l3
	setx TH0_DONE, %g1, %l4
	ld [%l3+1], %g1  !cause mem_addr_not_aligned trap
TH0_DONE:
	cmp     %i0, 0x1
	bne     FAIL
  	setx user_code_begin_001, %g1, %l4
  	jmp  %l4
  	mov %g0, %i0

FAIL:	EXIT_BAD
	nop

attr_data {
	Name = .My_User_Section_4v000,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA000,
	RA = MY_USER_DATA_RA000,
	PA = ra2pa(MY_USER_DATA_RA000, 0),
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	}
.data
.global user_data_begin_000
user_data_begin_000:
	.word 0x6c7e
	.word 0x2fbf
	.word 0x2c83
	.word 0x11ab0

SECTION .My_User_Section_4v001 TEXT_VA=MY_USER_TEXT_VA001, DATA_VA=MY_USER_DATA_VA001
attr_text {
        Name = .My_User_Section_4v001,
        part_0_ctx_nonzero_tsb_config_2,
        VA = MY_USER_TEXT_VA001,
        RA = MY_USER_TEXT_RA001,
 PA = ra2pa(MY_USER_TEXT_RA001, 0),
        TTE_Context = PCONTEXT,
        TTE_V       = 1,
        TTE_NFO     = 0,
        TTE_L       = 0,
        TTE_Soft    = 0,
        TTE_IE      = 0,
        TTE_E       = 0,
        TTE_CP      = 1,
        TTE_CV      = 0,
        TTE_P       = 0,
        TTE_EP      = 1,
        TTE_W       = 0,
        TTE_SW1     = 0,
        TTE_SW0     = 0,
        TTE_RSVD1   = 0,
        TTE_Size    = 0,
        }
attr_text {
NAME = .My_User_Section_4v001,
  hypervisor
}

!! Chk if there is an err in the delay slot and delay slot is annulled
!! then err is not reported.
!! pg _001 has no error. Lable TGT0 represents the first inst. of
!! next_page and TGT1 represents the 2nd inst.
!! There are two iterations, in the first iteration inst in delay slot is
!! executed and causes pg to be loaded with err in tlb. Alignment trap
!! is taken that causes err_detection to be enabled. On return from
!!trap handler the delay slot inst has an err but it is not reported as
!! the delay slot os annulled.
.text
.global user_code_begin_001
.skip 8124
user_code_begin_001:
	mov %g0, %i1 	! to control branch execution
  	ta   T_CHANGE_HPRIV
  	!! Enable error injection
  	stxa %l1, [%g0]ASI_ERR_INJ
  	ta T_CHANGE_NONHPRIV	
        setx TGT1, %g1, %l4
	setx user_data_begin_000, %g1, %l3
GO_BACK: brz,a  %i1, TGT1	!! load entry in ITLB
TGT0:	add %g0, %g7, %g5  !! dummy inst
TGT1:	add %g0, 1, %i1
	brz,a  %i0, GO_BACK
	ld [%l3+1], %g1  !cause mem_addr_not_aligned trap
	cmp %i0, 1
	bnz FAIL
	nop
	EXIT_GOOD
	nop

FAIL:   EXIT_BAD
        nop

attr_data {
        Name = .My_User_Section_4v001,
        part_0_ctx_nonzero_tsb_config_1,
        VA = MY_USER_DATA_VA001,
        RA = MY_USER_DATA_RA001,
 PA = ra2pa(MY_USER_DATA_RA001, 0),
        TTE_Context = PCONTEXT,
        TTE_V       = 1,
        TTE_NFO     = 0,
        TTE_L       = 0,
        TTE_Soft    = 0,
        TTE_IE      = 0,
        TTE_E       = 0,
        TTE_CP      = 1,
        TTE_CV      = 0,
        TTE_P       = 0,
        TTE_EP      = 0,
        TTE_W       = 1,
        TTE_SW1     = 0,
        TTE_SW0     = 0,
        TTE_RSVD1   = 0,
        TTE_Size    = 0,
        }
attr_data {
NAME = .My_User_Section_4v001,
  hypervisor
}

.data
.global user_data_begin_001
user_data_begin_001:
        .word 0x10731
        .word 0xd027
        .word 0x1350e
        .word 0x10e9d

.global DATA_ACCESS_ERROR_HANDLER
.global INST_ACCESS_ERROR_HANDLER

SECTION .HTRAPS
.text
DATA_ACCESS_ERROR_HANDLER:
        add %g0, SFSR_VA, %g5		!
	ldxa 	[%g5]ASI_DSFSR, %o1	!
	cmp	%o1, 0x1
	bne 	FAIL
        add     %g0, SFAR_VA, %g6	!!g6 has sfar va
	ldxa 	[%g6]ASI_SFAR, %o1	
	cmp 	%o1, %l3
	bne 	FAIL
	//issue demap pg
	xor 	%o1, 0x1fff, %o1
	stxa    %g0, [%o1] ASI_DMMU_DEMAP
	//disable errors
  	add %g0, CERER_VA, %g3	
  	stxa %g0, [%g3]ASI_CERER
        add %g0, 1, %i0		!
        retry
	nop


INST_ACCESS_MMU_ERROR_HANDLER:
        add 	%g0, SFSR_VA, %g5		!
	ldxa 	[%g5]ASI_ISFSR, %o1	!
	cmp	%o1, ISFSR_ITTP  
	bne 	FAIL
	stxa 	%g0, [%g5]ASI_ISFSR
        add     %g0, SFAR_VA, %g6	!!g6 has sfar va
	rdpr 	%tpc, %o1
	cmp 	%o1, %l4  		!! cmp pc matches the expected pc
	bne 	FAIL
	!issue demap pg
	srlx 	%o1, 0xd, %o1
	sllx 	%o1, 0xd, %o1
	stxa    %g0, [%o1] ASI_IMMU_DEMAP
	!disable errors
  	add %g0, CERER_VA, %g3	
  	stxa %g0, [%g3]ASI_CERER
        add %g0, 1, %i0		!
	retry

FAIL: EXIT_BAD
	nop
