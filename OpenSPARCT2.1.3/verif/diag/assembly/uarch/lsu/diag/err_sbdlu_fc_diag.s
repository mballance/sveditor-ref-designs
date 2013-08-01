/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: err_sbdlu_fc_diag.s
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
#define MY_USER_TEXT_VA002      0x7a020000
#define MY_USER_TEXT_RA002      0x7b020000
#define MY_USER_TEXT_PA002      0x107b020000
#define MY_USER_TEXT_VA003      0x7a030000
#define MY_USER_TEXT_RA003      0x7b030000
#define MY_USER_TEXT_PA003      0x107b030000
#define MY_USER_TEXT_VA004      0x7a040000
#define MY_USER_TEXT_RA004      0x7b040000
#define MY_USER_TEXT_PA004      0x107b040000
#define MY_USER_TEXT_VA005      0x7a050000
#define MY_USER_TEXT_RA005      0x7b050000
#define MY_USER_TEXT_PA005      0x107b050000
#define MY_USER_TEXT_VA006      0x7a060000
#define MY_USER_TEXT_RA006      0x7b060000
#define MY_USER_TEXT_PA006      0x107b060000
#define MY_USER_TEXT_VA007      0x7a070000
#define MY_USER_TEXT_RA007      0x7b070000
#define MY_USER_TEXT_PA007      0x107b070000
#define MY_USER_TEXT_VA008      0x7a080000
#define MY_USER_TEXT_RA008      0x7b080000
#define MY_USER_TEXT_PA008      0x107b080000

#define MY_USER_DATA_VA000      0x6a000000
#define MY_USER_DATA_RA000      0x6b000000
#define MY_USER_DATA_PA000      0x106b000000
#define MY_USER_DATA_VA001      0x6a010000
#define MY_USER_DATA_RA001      0x6b010000
#define MY_USER_DATA_PA001      0x106b010000
#define MY_nc_DATA_RA001      0xb06b0a0000
#define MY_nc_DATA_PA001      0xc06b0a0000
#define MY_USER_DATA_VA002      0x6a020000
#define MY_USER_DATA_RA002      0x6b020000
#define MY_USER_DATA_PA002      0x106b020000
#define MY_USER_DATA_VA003      0x6a030000
#define MY_USER_DATA_RA003      0x6b030000
#define MY_USER_DATA_PA003      0x106b030000
#define MY_USER_DATA_VA004      0x6a040000
#define MY_USER_DATA_RA004      0x6b040000
#define MY_USER_DATA_PA004      0x106b040000
#define MY_USER_DATA_VA005      0x6a050000
#define MY_USER_DATA_RA005      0x6b050000
#define MY_USER_DATA_PA005      0x106b050000
#define MY_USER_DATA_VA006      0x6a060000
#define MY_USER_DATA_RA006      0x6b060000
#define MY_USER_DATA_PA006      0x106b060000
#define MY_USER_DATA_VA007      0x6a070000
#define MY_USER_DATA_RA007      0x6b070000
#define MY_USER_DATA_PA007      0x106b070000
#define MY_USER_DATA_VA008      0x6a080000
#define MY_USER_DATA_RA008      0x6b080000
#define MY_USER_DATA_PA008      0x106b080000
#define MY_USER_DATA_VA009      0x6a090000
#define MY_USER_DATA_RA009      0x6b090000
#define MY_USER_DATA_PA009      0x106b090000

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

#define  CERER_SBDPC            0x400
#define  CETER_DHCCE    0x1000000000000000
#define  CETER_DE       0x2000000000000000
#define  CETER_PSCCE    0x4000000000000000
#define  DCVP_ERR_TYPE   0x5
#define  SBDPC_ERR_TYPE   0x5
#define  SBDPU_ERR_TYPE   0x6
#define  HPRIV   0x5
#define  PRIV   0x3
#define  USER   0x0
#define DCL2ND_ERR_TYPE          0x2
#define  CETER_ALL      0x7000000000000000


#define MAIN_PAGE_HV_ALSO
#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
	ba MEM_ADDR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop


#define H_HT0_Data_Access_MMU_Error_0x72
#define SUN_H_HT0_Data_Access_MMU_Error_0x72 \
	ba DATA_ACCESS_ERROR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

#define H_HT0_Instruction_Access_MMU_Error_0x71
#define SUN_H_HT0_Instruction_Access_MMU_Error_0x71 \
	ba INST_ACCESS_ERROR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

#define H_HT0_Hw_Corrected_Error_0x63
#define SUN_H_HT0_Hw_Corrected_Error_0x63 \
        ba HW_CORR_ERROR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

#define H_HT0_DAE_invalid_asi_0x14
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
        ba INVALID_ASI_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

!! turn off cerer.dcvp
#define H_HT0_DAE_nc_page_0x16
#define SUN_H_HT0_DAE_nc_page_0x16 \
  	add %g0, CERER_VA, %g3;\
  	stxa %g0, [%g3]ASI_CERER;\
        done;nop;nop;nop;nop;nop

!! turn on cerer.dcvp
#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
  	set 0x04000,  %g1; \
  	add %g0, CERER_VA, %g3;\
  	stxa %g1, [%g3]ASI_CERER;\
        done;nop;nop;nop;nop

#define  H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define My_HT0_Stdf_Mem_Address_Not_Aligned_0x36 \
  	set STDU_ERR_EN,  %g1;\
  	or %g1, %l3, %g1 ;\
	cmp %i3, 1;  \
	be,a .+12;  \
  	stxa %g1, [%g0]ASI_ERR_INJ ;\
  	stxa %g0, [%g0]ASI_ERR_INJ ;\
        done

#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
        ba DATA_ACCESS_ERROR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

#define H_HT0_Sw_Recoverable_Error_0x40
#define SUN_H_HT0_Sw_Recoverable_Error_0x40 \
        ba RECOVERABLE_ERR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop
	

#define H_HT0_Internal_Processor_Error_0x29
#define SUN_H_HT0_Internal_Processor_Error_0x29 \
        ba INT_PROC_ERR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

#include "hboot.s"

/************************************************************************
   Test case:	
 ************************************************************************/

.text
.global main

main:		/* test begin */
  ta    T_CHANGE_HPRIV
  
  !! set CERER.SBDPU
  setx 0x1f000000200, %g1,  %o2   !! enable sbdpu, sbdlu errs
  add %g0, CERER_VA, %g3        !!g3 has cerer va

  stxa %o2, [%g3]ASI_CERER

  !! set all bits in the ceter
  setx CETER_ALL, %l0, %o2
  add %g0, CETER_VA, %g3
  stxa %o2, [%g3]ASI_CETER

!!set nceen to enable nd detection
  !! set NCEEN in l2 err enable reg
set_nccen_l2:
  mov 0xaa, %g1
  sllx %g1, 32, %g1
  mov 0x2, %g2
  stx %g2, [%g1]
  stx %g2, [%g1+0x40]
  stx %g2, [%g1+0x80]
  stx %g2, [%g1+0xc0]
  stx %g2, [%g1+0x100]
  stx %g2, [%g1+0x140]
  stx %g2, [%g1+0x180]
  stx %g2, [%g1+0x1c0]

  ta T_CHANGE_NONHPRIV

  setx user_code_begin_000, %g2, %g3
  !setx user_code_begin_001, %g2, %g3
  jmp  %g3
  nop
  EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
.global user_data_start
user_data_start:
.word 0x12345678
.word 0x9a9b9c9d
.word 0x00000000
.word 0xffffffff

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
attr_text {
NAME = .My_User_Section_4v000,
  hypervisor
}
!! STb has only 7 bits of ecc. So, Flipping bit 7 of
!! the ecc mask has no effect and is not changed.
!! Try all possible 2 bit combinations of errors in ecc bits.
!! combinations of bits tried:70 (70 means bits 7 and 0 are asserted together)
!! With bit 0 = 1:  60, 50, 40, 30, 20, 10  => 7 cases
!! With bit 1 = 1:  61, 51, 41, 31, 21 => 6 cases
!! With bit 2 = 1:  62, 52, 42, 32 => 5 cases
!! With bit 3 = 1:  63, 53, 43 => 4 cases
!! With bit 4 = 1:  64, 54 => 3 cases
!! With bit 5 = 1:  65 => 2 cases

.text
.global user_code_begin_000
user_code_begin_000:
  mov %g0, %l2  !! stb expected index is in l2
  mov %g0, %i4  !! don't need to clear the err in the sw trap handler
  add %g0, 3, %l3
  add %g0, 1, %i3  !! enable err_injection
  add %g0, USER, %i6

  std %d0, [%l4 + 0x4]  !stdf_not_aligned 
  ldxa [%l4]0xE4, %g1  !! invalid asi trap to set to stb ptr to 0

  setx user_data_begin_000, %g1, %l4
  setx user_data_begin_001, %g1, %l5

  ldx [%l4], %o4	!pg  lookup
  ldx [%l5], %o5	!pg  lookup
!!IPE and SWE trap on an stb ue
!! generate a stb ue error which causes both an sbdlu and sbdpu.
!! the ld which causes sbdlu is a hit in the L1$ so we don't see a dae when
!!ld is replayed.
CASE0:
	mov %g0, %i0	!! ipe tracker due to sbdlu
	mov %g0, %i1    !! swe tracker due to sbdpu
	mov %g0, %i2	!!dae tracker
	!add %l4, 0x10, %l4
	!add %l5, 0x10, %l5

        stx %o5, [%l4]	!! UE
	ldx [%l4], %o4	!! ld is a hit in the cache so no data_acc_err trap
			!! on retry from sw_recoverable_err handler
	add %o5, 0x100, %o5
	brz %i0, FAIL
	brz %i1, FAIL
	brnz %i2, FAIL
	nop

!!IPE, SWE, and DAE trap on an stb ue
!! generate a stb ue error which causes both an sbdlu and sbdpu.
!! the ld which causes sbdlu is a miss in the L1$ so we see a dae when
!!ld is replayed.

CASE1:
  add %g0, 3, %l3
  add %g0, 1, %i3  !! enable err_injection
  add %g0, USER, %i6

  std %d0, [%l4 + 0x4]  !stdf_not_aligned 
  ldxa [%l4]0xE4, %g1  !! invalid asi trap to set to stb ptr to 0

  setx user_data_begin_000, %g1, %l4
  setx user_data_begin_001, %g1, %l5

  mov %g0, %i0	!! ipe tracker
  mov %g0, %i1    !! swe tracker
  mov %g0, %i2	!!dae tracker

  stx %o5, [%l4 + 0x10]	 !!ue
  ldx [%l4 + 0x10], %o4	!! ld is a cache miss in the cache so data_acc_err trap
			!! on retry from sw_recoverable_err handler
  brz %i0, FAIL
  brz %i1, FAIL
  brz %i2, FAIL
  nop

!!SWE, and DAE trap on an stb ue
!!These case has 4 back to back stores all of which get ues.
!!There are loads to these stores later on and all of them get daes
CASE2:
  add %g0, 3, %l3
  add %g0, 1, %i3  !! enable err_injection
  add %g0, USER, %i6

  std %d0, [%l4 + 0x4]  !stdf_not_aligned 
  ldxa [%l4]0xE4, %g1  !! invalid asi trap to set to stb ptr to 0

  setx user_data_begin_000, %g1, %l4
  setx user_data_begin_001, %g1, %l5

  mov %g0, %i0	!! ipe tracker
  mov %g0, %i1    !! swe tracker
  mov %g0, %i2	!!dae tracker

  stx %o5, [%l4 + 0x20]	 !!ue
  stx %o5, [%l4 + 0x30]	 !!ue
  stx %o5, [%l4 + 0x40]	 !!ue
  stx %o5, [%l4 + 0x50]	 !!ue
  
  ldx [%l4 + 0x60], %o4	!! 
  ldx [%l4 + 0x70], %o4	!! 
  
  brz %i1, FAIL
  mov %g0, %i1
  
  ldx [%l4 + 0x20], %o1	!! 
  brz %i2, FAIL
  mov %g0, %i2
  ldx [%l4 + 0x30], %o2	!! 
  brz %i2, FAIL
  mov %g0, %i2
  ldx [%l4 + 0x40], %o3	!! 
  brz %i2, FAIL
  mov %g0, %i2
  ldx [%l4 + 0x50], %o4	!! 
  brz %i2, FAIL
  mov %g0, %i2

!!SWE trap on an stb ue
!!These case has 4 back to back stores all of which get ues.
!!In the swe trap handler the stores are rewritten which clears the err
!!in L2$. 
!!There are loads to these stores later on and none of them shd get dae
!!as the err has been cleared in L2$.

CASE3:
  add %g0, 3, %l3
  add %g0, 1, %i3  !! enable err_injection
  mov 1, %i4   !! clear the err in the sw_trap_handler

  std %d0, [%l4 + 0x4]  !stdf_not_aligned
  ldxa [%l4]0xE4, %g1  !! invalid asi trap to set to stb ptr to 0

  setx user_data_begin_000, %g1, %l4

  mov %g0, %i0  !! ipe tracker
  mov %g0, %i1    !! swe tracker
  mov %g0, %i2  !!dae tracker

  add %o4, 0x1fff, %o1
  xor %o4, %o1, %o2
  and %o2, %o5, %o3
  xor %l4, %o5, %o4

  stx %o1, [%l4 + 0x60]  !!hit in L1$
  stx %o2, [%l4 + 0x70]  !!hit in L1$
  stx %o3, [%l4 + 0x90]  !!miss in L1$
  stx %o4, [%l4 + 0xa0]  !!miss in L1$

  ldx [%l5 + 0x30], %o5 !!
  ldx [%l5 + 0x40], %o5 !!
  ldx [%l5 + 0x50], %o5 !!

  brz %i1, FAIL
  mov %g0, %i1

  ldx [%l4 + 0x60], %g1
  brnz %i2, FAIL
  cmp %g1, %o1
  bne FAIL
  ldx [%l4 + 0x70], %g2
  brnz %i2, FAIL
  cmp %g2, %o2
  bne FAIL
  ldx [%l4 + 0x90], %g3
  brnz %i2, FAIL
  cmp %g3, %o3
  bne FAIL
  ldx [%l4 + 0xa0], %g4
  brnz %i2, FAIL
  cmp %g4, %o4
  bne FAIL

  EXIT_GOOD
  nop

FAIL:
        EXIT_BAD

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
attr_data {
NAME = .My_User_Section_4v000,
  hypervisor
}
.data
.global user_data_begin_000
user_data_begin_000:
.xword 0xe0066361bd9fcb86
.xword 0xea22901c101f6f52
.xword 0x806faa2171350467
.xword 0xff54f2cd06a0d342
.xword 0x566bff718cddb905
.xword 0x6d367bc4d165d37a
.xword 0x5efc42b18f920522
.xword 0x584c92dec4bc66de
.xword 0xed9efe0d05896ce1
.xword 0xf9d45b94972117c8
.xword 0xd0c647618c9e43f3
.xword 0xfe04ead3b77c2d11
.xword 0x06d2d7f29e76397c
.xword 0x234c366110eddd38
.xword 0xa80656d4288044bc
.xword 0x12e763fbd8e2970d
.xword 0x7320217fab3eae0e
.xword 0x38683cebedefb5af
.xword 0xefc4e1f1b35853fc
.xword 0xe790a0c1689eb683
.xword 0x88c650f170c41710
.xword 0x614126cf9fc8dca3
.xword 0x4be2f60911e465ce
.xword 0x4e22352a0c29c95c
.xword 0xf18efdf01ce79e24
.xword 0x294aaa56144d7cf1
.xword 0xe0066361bd9fcb86
.xword 0xea22901c101f6f52
.xword 0x806faa2171350467
.xword 0xff54f2cd06a0d342
.xword 0x566bff718cddb905
.xword 0x6d367bc4d165d37a
.xword 0x5efc42b18f920522
.xword 0x584c92dec4bc66de
.xword 0xefc4e1f1b35853fc
.xword 0xe790a0c1689eb683
.xword 0x88c650f170c41710
.xword 0x614126cf9fc8dca3
.xword 0x5efc42b18f920522
.xword 0x584c92dec4bc66de
.xword 0xed9efe0d05896ce1
.xword 0xf9d45b94972117c8
.xword 0xd0c647618c9e43f3
.xword 0xfe04ead3b77c2d11
.xword 0x06d2d7f29e76397c
.xword 0x234c366110eddd38
.xword 0xa80656d4288044bc
.xword 0x12e763fbd8e2970d
.xword 0x7320217fab3eae0e
.xword 0x38683cebedefb5af
.xword 0xefc4e1f1b35853fc
.xword 0xe790a0c1689eb683
.xword 0x88c650f170c41710


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
! Check, if CETER.DE is clear then no trap is taken.
! After that once CETER.DE is set, trap will be taken.

.text
.global user_code_begin_001
user_code_begin_001:
  EXIT_GOOD
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
	TTE_CV      = 1,
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
.xword 0xfa474991f13e3460
.xword 0x1446415baecf3609
.xword 0xe3215e901114ad4b
.xword 0xf91d897e92d1ee95
.xword 0x33458a48805d888b
.xword 0x7f5a3ddb7d8e3c23
.xword 0xaa80311fb1e17e79
.xword 0x0f59d0e1ac35dbd4
.xword 0x057c893bc8fc1e7e
.xword 0xcfb9e3a29c786cc0
.xword 0x7257becb4609969e
.xword 0x4b1896677e83abae
.xword 0xc2e35a285574f037
.xword 0x2e42eb5835020e2e
.xword 0x90775b99929f43cc
.xword 0xd0c647618c9e43f3
.xword 0xfe04ead3b77c2d11
.xword 0x06d2d7f29e76397c
.xword 0x234c366110eddd38
.xword 0xa80656d4288044bc
.xword 0x12e763fbd8e2970d
.xword 0x7320217fab3eae0e
.xword 0x38683cebedefb5af
.xword 0xefc4e1f1b35853fc
.xword 0xe790a0c1689eb683
.xword 0x9fac4ae85a4ecd4e

	.word 0x10731
	.word 0xd027
	.word 0x1350e
	.word 0x10e9d



.global DATA_ACCESS_ERROR_HANDLER
.global INST_ACCESS_ERROR_HANDLER
.global MEM_ADDR_HANDLER
.global RECOVERABLE_ERR_HANDLER
.global INT_PROC_ERR_HANDLER

SECTION .HTRAPS
.text
DATA_ACCESS_ERROR_HANDLER:
        add     %g0, SFSR_VA, %g5               !
        ldxa  [%g5]ASI_DSFSR, %o1     !
        stxa  %g0, [%g5]ASI_DSFSR       ! clear the err
        add %g0, 1, %i2
        done
        nop

INST_ACCESS_ERROR_HANDLER:
        add     %g0, SFSR_VA, %g5               !
        !!ldxa  [%g5]ASI_ISFSR, %o1     !
        !!cmp   %o1, 0x1  
        !!bne   FAIL
        add     %g0, SFAR_VA, %g6       !!g6 has sfar va
        ldxa    [%g6]ASI_SFAR, %o1
        !!brnz    %o1, FAIL
        rdpr    %tpc, %o1
        cmp     %o1, %l4                !! cmp pc matches the expected pc
        bne     FAIL
        !!issue demap pg
        srlx    %o1, 0xd, %o1
        sllx    %o1, 0xd, %o1
        stxa    %g0, [%o1] ASI_IMMU_DEMAP
        add %g0, 1, %i0         !
        retry

MEM_ADDR_HANDLER:
 done
 nop

HW_CORR_ERROR_HANDLER:
  ldxa [%g0]0x4c, %g1   !! read the DESR
  ldxa [%g0]0x4c, %g2   !! g2 shd be 0.
  retry
  nop

INVALID_ASI_HANDLER:
  set STDU_ERR_EN,  %g1
  or %g1, %l3, %g1 

  add %g0, 0x100, %g3	!! read the stb ptr
  ldxa [%g3]ASI_STB_ACCESS, %g2
  !srlx %g2, 3, %g2
  brz %g2, DONE
  cmp %g2, 1
  be STORES_7
  cmp %g2, 2
  be STORES_6
  cmp %g2, 3
  be STORES_5
  cmp %g2, 4
  be STORES_4
  cmp %g2, 5
  be STORES_3
  cmp %g2, 6
  be STORES_2
  cmp %g2, 7
  be,a DONE
STORES_7:
  stxa %g1, [%g0]ASI_ERR_INJ   ! no err injected on wr to err inj
STORES_6:
  stxa %g1, [%g0]ASI_ERR_INJ   ! no err injected on wr to err inj
STORES_5:
  stxa %g1, [%g0]ASI_ERR_INJ   ! no err injected on wr to err inj
STORES_4:
  stxa %g1, [%g0]ASI_ERR_INJ   ! no err injected on wr to err inj
STORES_3:
  stxa %g1, [%g0]ASI_ERR_INJ   ! no err injected on wr to err inj
STORES_2:
  stxa %g1, [%g0]ASI_ERR_INJ   ! no err injected on wr to err inj
  stxa %g1, [%g0]ASI_ERR_INJ   ! no err injected on wr to err inj

DONE:
        done
        nop

RECOVERABLE_ERR_HANDLER:
stxa %g0, [%g0]ASI_ERR_INJ  !! turn off err injection
  ldxa [%g0]0x4c, %g1   !! read the DESR
  ldxa [%g0]0x4c, %g2   !! g2 shd be 0.
CHK_ERRT:
  srlx %g1, 56, %g2     !! chk the err_type
  and %g2, 0x1F, %g3
  cmp %g3, SBDPU_ERR_TYPE
  !bne FAIL
CHK_S_BIT:
  srlx %g2, 5, %g2 !! chk s bit
  and %g2, 1, %g3
  cmp %g3, 1
  !bne FAIL
CHK_F_BIT:
  srlx %g2, 2, %g3 !! chk F bit set
  cmp %g3, 1
  !bne FAIL
CHK_WAY:
  and %g1, 0x7, %g2  !! SB index
  cmp %g2, %l2
  !bne FAIL
  nop

  brz %i4, RET  !!if i4 is 1 then clear the err in the trap handler.
  nop
CLR_ERR:
  mov %l4, %l5
  add %l5, 0x60, %l5
  stxa %o1, [%l5]0x10
  add %l5, 0x10, %l5
  stxa %o2, [%l5]0x10
  add %l5, 0x20, %l5
  stxa %o3, [%l5]0x10
  add %l5, 0x10, %l5
  stxa %o4, [%l5]0x10
  membar #Sync
RET: add %g0, 1, %i1
  retry


INT_PROC_ERR_HANDLER:
CHK_ERR_TYP:
  stxa %g0, [%g0]ASI_ERR_INJ
  add %g0, SFSR_VA, %g1
  ldxa [%g1]ASI_DSFSR, %g2   !! read the DSFSR
  stxa %g0, [%g1]ASI_DSFSR   !! clear the dsfsr
  and %g2, 0xF, %g2
  !cmp %g2, SBDLC_ERR_TYPE
  !bne FAIL
CHK_INDEX:
  add %g0, SFAR_VA, %g1
  ldxa [%g1]ASI_SFAR, %g2   !! read the DSFAR
  and %g2, 0x7, %g2
  !cmp %g2, %l2
  !bne FAIL
  nop

  membar #Sync
  add %g0, 1, %i0
  retry

FAIL: EXIT_BAD
	nop

.data




