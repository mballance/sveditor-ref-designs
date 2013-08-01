/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: err_tsa_diag.s
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
#define MY_USER_TEXT_VA009      0x7a090000
#define MY_USER_TEXT_RA009      0x7b090000
#define MY_USER_TEXT_PA009      0x107b090000
#define MY_USER_TEXT_VA010      0x7a0a0000
#define MY_USER_TEXT_RA010      0x7b0a0000
#define MY_USER_TEXT_PA010      0x107b0a0000
#define MY_USER_TEXT_VA011      0x7a0b0000
#define MY_USER_TEXT_RA011      0x7b0b0000
#define MY_USER_TEXT_PA011      0x107b0b0000
#define MY_USER_TEXT_VA012      0x7a0c0000
#define MY_USER_TEXT_RA012      0x7b0c0000
#define MY_USER_TEXT_PA012      0x107b0c0000
#define MY_USER_TEXT_VA013      0x7a0d0000
#define MY_USER_TEXT_RA013      0x7b0d0000
#define MY_USER_TEXT_PA013      0x107b0d0000

#define MY_USER_DATA_VA000      0x6a000000
#define MY_USER_DATA_RA000      0x6b000000
#define MY_USER_DATA_PA000      0x106b000000
#define MY_USER_DATA_VA001      0x6a010000
#define MY_USER_DATA_RA001      0x6b010000
#define MY_USER_DATA_PA001      0x106b010000
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
#define MY_USER_DATA_VA010      0x6a0a0000
#define MY_nc_DATA_RA010      0xb06b0a0000
#define MY_nc_DATA_PA010      0xc06b0a0000
#define MY_USER_DATA_VA011      0x6a0b0000
#define MY_nc_DATA_RA011      0xb06b0b0000
#define MY_nc_DATA_PA011      0xc06b0b0000
#define MY_USER_DATA_VA012      0x6a0c0000
#define MY_nc_DATA_RA012      0xb06b0c0000
#define MY_nc_DATA_PA012      0xc06b0c0000
#define MY_USER_DATA_VA013      0x6a0d0000
#define MY_nc_DATA_RA013      0xb06b0d0000
#define MY_nc_DATA_PA013      0xc06b0d0000

#define IMDU_ERR_EN     0xa0000000
#define IMTU_ERR_EN     0x90000000
#define DMDU_ERR_EN     0x88000000
#define DMTU_ERR_EN     0x84000000
#define IRCU_ERR_EN     0x82000000
#define FRCU_ERR_EN     0x81000000
#define SCAU_ERR_EN     0x80800000
#define TCCU_ERR_EN     0x80400000
#define TSA_ERR_EN     0x80200000
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

#define MAIN_PAGE_HV_ALSO

#define H_HT0_Internal_Processor_Error_0x29
#define SUN_H_HT0_Internal_Processor_Error_0x29 \
        ba INT_PROC_ERR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

#define My_RED_Mode_Other_Reset
#define My_RED_Mode_Other_Reset \
        add %g0, 1, %i0;  \
	nop;done;nop;nop;nop;nop;nop;nop

#define My_Watchdog_Reset
#define My_Watchdog_Reset \
    wrpr %o2, %g0, %tnpc;\
    sub %o2, 4, %g1;\
    wrpr %g1, %g0, %tpc;\
    add %g0, 1, %i0;  \
    nop;done;nop;nop

#include "hboot.s"

/************************************************************************
   Test case:	
 ************************************************************************/

.text
.global main
.global CLEAR_TSAC

main:		/* test begin */
  ta    T_CHANGE_HPRIV

  !! set CERER.TSAC
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  add %g0, CERER_VA, %g3 

  stxa %o2, [%g3]ASI_CERER

  !! set CETER.PSCCE
  setx CETER_PSCCE, %l0, %o2
  add %g0, CETER_VA, %g3
  stxa %o2, [%g3]ASI_CETER
  
!! change to TL1
!!  add %g0, 1, %l2  
!! wrpr %g0, %l2, %tl
!!  wrpr %g0, %g1, %tstate  
!!  ldxa [%g0]0x5b, %g2		!! read ecc before err injection

!! Enable error injection
!!  setx TSA_ERR_EN, %l0, %l5
!!  or %l5, 0x1, %l5   ! set mask bit 0 to 1
!!  stxa %l5, [%g0]ASI_ERR_INJ

  add %g0, 1, %l1  
  add %g0, 1, %l2  
  add %g0, 1, %l3  !!err injection mask  
  
  setx CLEAR_TSAC, %g1, %g4

  mov %g0, %o3        
  setx user_code_begin_000, %g1, %g2
  jmp  %g2
  nop

CLEAR_TSAC:
!! disable error injection
!!stxa %g0, [%g0]ASI_ERR_INJ
!! disable error detection
 add %g0, CERER_VA, %g3 
 stxa %g0, [%g3]ASI_CERER

  wrpr %g0, 0x1, %tl
  wrpr %g0, %g0, %tstate
  wrpr %g0, %g0, %tt
  wrpr %g0, %g0, %tpc
  wrpr %g0, %g0, %tnpc
  wrhpr %g0, %g0, %htstate

  wrpr %g0, 0x2, %tl
  wrpr %g0, %g0, %tstate
  wrpr %g0, %g0, %tt
  wrpr %g0, %g0, %tpc
  wrpr %g0, %g0, %tnpc
  wrhpr %g0, %g0, %htstate
  
  wrpr %g0, 0x3, %tl
  wrpr %g0, %g0, %tstate
  wrpr %g0, %g0, %tt
  wrpr %g0, %g0, %tpc
  wrpr %g0, %g0, %tnpc
  wrhpr %g0, %g0, %htstate

  wrpr %g0, 0x4, %tl
  wrpr %g0, %g0, %tstate
  wrpr %g0, %g0, %tt
  wrpr %g0, %g0, %tpc
  wrpr %g0, %g0, %tnpc
  wrhpr %g0, %g0, %htstate

  wrpr %g0, 0x5, %tl
  wrpr %g0, %g0, %tstate
  wrpr %g0, %g0, %tt
  wrpr %g0, %g0, %tpc
  wrpr %g0, %g0, %tnpc
  wrhpr %g0, %g0, %htstate

/*
  wrpr %g0, 0x6, %tl
  wrpr %g0, %g0, %tstate
  wrpr %g0, %g0, %tt
  wrpr %g0, %g0, %tpc
  wrpr %g0, %g0, %tnpc
  wrhpr %g0, %g0, %htstate
*/
  jmp %g5
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
!!Inject error in all the entries, by writing to tstate reg.
.text
.global user_code_begin_000
user_code_begin_000:
  add %g0, 1, %l1  
  add %g0, 1, %l2  
  add %g0, 0x55, %g1
  
  mov %g0, %l6

LOOP_000:
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ
!! change TL
  wrpr %g0, %l2, %tl
  wrpr %g0, %g1, %tstate  
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  ldxa [%g0]0x5b, %g2		!! read ecc after err iinjection

  rdpr %tstate, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tt, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tpc, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tnpc, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdhpr %htstate, %o2
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tt   
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tpc   
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tnpc   
  brz %i0, FAIL
  mov %g0, %i0

  wrhpr %g0, %g1, %htstate   
  brz %i0, FAIL
  mov %g0, %i0
  
  wrpr %g0, %g1, %tstate  
  brz %i0, FAIL
  mov %g0, %i0

  ldxa [%l6]0x5b, %g2		!! read ecc for entry with err
  brnz %i0, FAIL
  mov %g0, %i0

  sllx %l2, 8, %l6
  cmp %l2, 5
  bnz LOOP_000
  add %l2, 1, %l2

  setx user_code_begin_001, %g1, %g5
  jmp  %g4		!! call CLEAR_TSAC
  nop

  EXIT_GOOD
  nop

FAIL:
        EXIT_BAD
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
.text
.global user_code_begin_001
!! inject err by writing to %tt register
user_code_begin_001:
!! Enable error detection 
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER
  
  add %g0, 0xaa, %g1
  add %g0, 0x1, %l2
  add %g0, 1, %l1  

LOOP_001:
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ
!! change TL
  wrpr %g0, %l2, %tl
  wrpr %g0, %g1, %tt   
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  ldxa [%g0]0x5b, %g2		!! read ecc after err iinjection

  rdpr %tstate, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tt, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tpc, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tnpc, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdhpr %htstate, %o2
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tt   
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tpc   
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tnpc   
  brz %i0, FAIL
  mov %g0, %i0

  wrhpr %g0, %g1, %htstate   
  brz %i0, FAIL
  mov %g0, %i0
  
  wrpr %g0, %g1, %tstate  
  brz %i0, FAIL
  mov %g0, %i0

  cmp %l2, 4
  bnz LOOP_001
  add %l2, 1, %l2

  setx user_code_begin_002, %g1, %g5
  jmp  %g4		!! call CLEAR_TSAC
  nop

FAIL:
        EXIT_BAD

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
.xword 0x9fac4ae85a4ecd4e

	.word 0x10731
	.word 0xd027
	.word 0x1350e
	.word 0x10e9d


SECTION .My_User_Section_4v002 TEXT_VA=MY_USER_TEXT_VA002, DATA_VA=MY_USER_DATA_VA002
attr_text {
	Name = .My_User_Section_4v002,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA002,
	RA = MY_USER_TEXT_RA002,
	PA = ra2pa(MY_USER_TEXT_RA002, 0),
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
NAME = .My_User_Section_4v002,
  hypervisor
}
.text
.global user_code_begin_002
!!inject err by writing to tpc
user_code_begin_002:
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER
  
  add %g0, 0xaa, %g1
  add %g0, 0x1, %l2
  add %g0, 1, %l1  

LOOP_002:
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ
!! change TL
  wrpr %g0, %l2, %tl
 wrpr %g0, %g1, %tpc
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  ldxa [%g0]0x5b, %g2		!! read ecc after err iinjection

  rdpr %tstate, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tt, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tpc, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tnpc, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdhpr %htstate, %o2
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tt   
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tpc   
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tnpc   
  brz %i0, FAIL
  mov %g0, %i0

  wrhpr %g0, %g1, %htstate   
  brz %i0, FAIL
  mov %g0, %i0
  
  wrpr %g0, %g1, %tstate  
  brz %i0, FAIL
  mov %g0, %i0

  cmp %l2, 4
  bnz LOOP_002
  add %l2, 1, %l2

  setx user_code_begin_003, %g1, %g5
  jmp  %g4		!! call CLEAR_TSAC
  nop

FAIL:
        EXIT_BAD
	nop

attr_data {
	Name = .My_User_Section_4v002,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA002,
	RA = MY_USER_DATA_RA002,
	PA = ra2pa(MY_USER_DATA_RA002, 0),
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
NAME = .My_User_Section_4v002,
  hypervisor
}
.data
.global user_data_begin_002
user_data_begin_002:
.xword 0x050a211e918857f3
.xword 0x7980bbbf09b95bba
.xword 0x55f410e2b57433f6
.xword 0x106c3aa95e2aa3c3
.xword 0xbcb980bc1bb072d8
.xword 0x63da435c10b717dd
.xword 0x375d99be87bef073
.xword 0x03a5206ac6d08fd2
.xword 0xfa474991f13e3460
.xword 0x1446415baecf3609
.xword 0xe3215e901114ad4b
.xword 0xf91d897e92d1ee95
.xword 0x33458a48805d888b
.xword 0x7f5a3ddb7d8e3c23
.xword 0xaa80311fb1e17e79
.xword 0x0f59d0e1ac35dbd4

	.word 0x1eb9
	.word 0x43ec
	.word 0xc619
	.word 0x11a06


SECTION .My_User_Section_4v003 TEXT_VA=MY_USER_TEXT_VA003, DATA_VA=MY_USER_DATA_VA003
attr_text {
	Name = .My_User_Section_4v003,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA003,
	RA = MY_USER_TEXT_RA003,
	PA = ra2pa(MY_USER_TEXT_RA003, 0),
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
NAME = .My_User_Section_4v003,
  hypervisor
}
.text
.global user_code_begin_003
!! inject err by writing to %tnpc register
user_code_begin_003:
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER
  
  add %g0, 0xaa, %g1
  add %g0, 0x1, %l2
  add %g0, 1, %l1  

LOOP_003:
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ
!! change TL
  wrpr %g0, %l2, %tl
  wrpr %g0, %g1, %tnpc   
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  ldxa [%g0]0x5b, %g2		!! read ecc after err iinjection

  rdpr %tstate, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tt, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tpc, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tnpc, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdhpr %htstate, %o2
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tt   
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tpc   
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tnpc   
  brz %i0, FAIL
  mov %g0, %i0

  wrhpr %g0, %g1, %htstate   
  brz %i0, FAIL
  mov %g0, %i0
  
  wrpr %g0, %g1, %tstate  
  brz %i0, FAIL
  mov %g0, %i0

  cmp %l2, 4
  bnz LOOP_003
  add %l2, 1, %l2

  setx user_code_begin_004, %g1, %g5
  jmp  %g4		!! call CLEAR_TSAC
  nop

FAIL:
        EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v003,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA003,
	RA = MY_USER_DATA_RA003,
	PA = ra2pa(MY_USER_DATA_RA003, 0),
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
NAME = .My_User_Section_4v003,
  hypervisor
}
.data
.global user_data_begin_003
user_data_begin_003:
.xword 0xca12fd23b5b1b1d6
.xword 0x3428a18f797bd42a
.xword 0x0d0630dd16ca2db5
.xword 0x281c49cf3f51a83f
.xword 0x8fc66b8940c55c03
.xword 0xfd6f2a2b60aee94c
.xword 0xec72846b0261894e
.xword 0xf1bd6c544120f822

.xword 0xefc4e1f1b35853fc
.xword 0xe790a0c1689eb683
.xword 0x88c650f170c41710
.xword 0x614126cf9fc8dca3
.xword 0x4be2f60911e465ce
.xword 0x4e22352a0c29c95c
.xword 0xf18efdf01ce79e24
.xword 0x294aaa56144d7cf1

	.word 0xdfaa
	.word 0x39a9
	.word 0xb967
	.word 0x280c


SECTION .My_User_Section_4v004 TEXT_VA=MY_USER_TEXT_VA004, DATA_VA=MY_USER_DATA_VA004
attr_text {
	Name = .My_User_Section_4v004,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA004,
	RA = MY_USER_TEXT_RA004,
	PA = ra2pa(MY_USER_TEXT_RA004, 0),
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
NAME = .My_User_Section_4v004,
  hypervisor
}
.text
.global user_code_begin_004
!!inject err by writing to htstate
user_code_begin_004:
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER
  
  add %g0, 0xaa, %g1
  add %g0, 0x1, %l2
  add %g0, 1, %l1  

LOOP_004:
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ
!! change TL
  wrpr %g0, %l2, %tl
  wrhpr %g0, %g1, %htstate   
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  ldxa [%g0]0x5b, %g2		!! read ecc after err iinjection

  rdpr %tstate, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tt, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tpc, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdpr %tnpc, %o2
  brz %i0, FAIL
  mov %g0, %i0

  rdhpr %htstate, %o2
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tt   
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tpc   
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tnpc   
  brz %i0, FAIL
  mov %g0, %i0

  wrhpr %g0, %g1, %htstate   
  brz %i0, FAIL
  mov %g0, %i0
  
  wrpr %g0, %g1, %tstate  
  brz %i0, FAIL
  mov %g0, %i0

  cmp %l2, 4
  bnz LOOP_004
  add %l2, 1, %l2

  setx user_code_begin_005, %g1, %g5
  jmp  %g4		!! call CLEAR_TSAC
  nop

FAIL:	EXIT_BAD
	nop

attr_data {
	Name = .My_User_Section_4v004,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA004,
	RA = MY_USER_DATA_RA004,
	PA = ra2pa(MY_USER_DATA_RA004, 0),
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
NAME = .My_User_Section_4v004,
  hypervisor
}
.data
.global user_data_begin_004
user_data_begin_004:
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
	.word 0x4069
	.word 0x41ed
	.word 0x14c07
	.word 0x29de


SECTION .My_User_Section_4v005 TEXT_VA=MY_USER_TEXT_VA005, DATA_VA=MY_USER_DATA_VA005
attr_text {
	Name = .My_User_Section_4v005,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA005,
	RA = MY_USER_TEXT_RA005,
	PA = ra2pa(MY_USER_TEXT_RA005, 0),
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
NAME = .My_User_Section_4v005,
  hypervisor
}
! Use done inst. to catch errors in TSA
.text
.global user_code_begin_005
user_code_begin_005:
!! Enable error detection 
  add %g0, CERER_VA, %g3 
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER

!! Enable error injection 
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ
  
  wrpr %g0, 1, %tl  !!change to tl1
  wrhpr %g0, %g1, %htstate   !!
  stxa %g0, [%g0]ASI_ERR_INJ

done_tl1:
  done  !!trap
  brz %i0, FAIL
  mov %g0, %i0
 
done_tl2:
 !tl2
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, 2, %tl  
  wrpr %g0, %g1, %tstate   
  stxa %g0, [%g0]ASI_ERR_INJ
  done  !!trap
  brz %i0, FAIL
  mov %g0, %i0

done_tl3:
 !tl3
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, 3, %tl  
  wrpr %g0, %g1, %tpc   
  stxa %g0, [%g0]ASI_ERR_INJ
  done  !!trap
  brz %i0, FAIL
  mov %g0, %i0

done_tl4:
 !tl4
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, 4, %tl  
  wrpr %g0, %g1, %tnpc   
  stxa %g0, [%g0]ASI_ERR_INJ
  done  !!trap
  brz %i0, FAIL
  mov %g0, %i0

done_tl5:
 !tl5
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, 5, %tl
  wrpr %g0, %g1, %tt
  stxa %g0, [%g0]ASI_ERR_INJ
  done  !!trap
  brz %i0, FAIL
  mov %g0, %i0

done_tl6:
 !tl6
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, 6, %tl
  wrpr %g0, %g1, %tt
  stxa %g0, [%g0]ASI_ERR_INJ
  setx clr_err_done, %l0, %o2
  done  !!trap
clr_err_done:
  brz %i0, FAIL
  mov %g0, %i0


!! Now clear all the errors from TSA
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %g0, [%g3]ASI_CERER
  wrpr %g0, 0x1, %tl
  wrpr %g0, %tstate
  wrpr %g0, 0x2, %tl
  wrpr %g0, %tstate
  wrpr %g0, 0x3, %tl
  wrpr %g0, %tstate
  wrpr %g0, 0x4, %tl
  wrpr %g0, %tstate
  wrpr %g0, 0x5, %tl
  wrpr %g0, %tstate
  wrpr %g0, 0x6, %tl
  wrpr %g0, %tstate

  
  setx user_code_begin_006, %g1, %g2
  jmp  %g2
  nop

FAIL:	EXIT_BAD
	nop

attr_data {
	Name = .My_User_Section_4v005,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA005,
	RA = MY_USER_DATA_RA005,
	PA = ra2pa(MY_USER_DATA_RA005, 0),
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
NAME = .My_User_Section_4v005,
  hypervisor
}
.data
.global user_data_begin_005
user_data_begin_005:
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
.xword 0x4be2f60911e465ce
.xword 0x4e22352a0c29c95c
.xword 0xf18efdf01ce79e24
	.word 0xf93b
	.word 0xe34b
	.word 0x127e6
	.word 0xd915


SECTION .My_User_Section_4v006 TEXT_VA=MY_USER_TEXT_VA006, DATA_VA=MY_USER_DATA_VA006
attr_text {
	Name = .My_User_Section_4v006,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA006,
	RA = MY_USER_TEXT_RA006,
	PA = ra2pa(MY_USER_TEXT_RA006, 0),
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
NAME = .My_User_Section_4v006,
  hypervisor
}
! Use retry inst. to catch errors in TSA
.text
.global user_code_begin_006
user_code_begin_006:
!! Enable error detection 
  add %g0, CERER_VA, %g3 
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER

!! Enable error injection 
retry_tl1:
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ
  
  wrpr %g0, 1, %tl  !!change to tl1
  wrhpr %g0, %g1, %htstate   !!
  stxa %g0, [%g0]ASI_ERR_INJ

  retry  !!trap
  brz %i0, FAIL
  mov %g0, %i0
 
retry_tl2:
 !tl2
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, 2, %tl  
  wrpr %g0, %g1, %tstate   
  stxa %g0, [%g0]ASI_ERR_INJ
  retry  !!trap
  brz %i0, FAIL
  mov %g0, %i0

retry_tl3:
 !tl3
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, 3, %tl  
  wrpr %g0, %g1, %tpc   
  stxa %g0, [%g0]ASI_ERR_INJ
  retry  !!trap
  brz %i0, FAIL
  mov %g0, %i0

retry_tl4:
 !tl4
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, 4, %tl  
  wrpr %g0, %g1, %tnpc   
  stxa %g0, [%g0]ASI_ERR_INJ
  retry  !!trap
  brz %i0, FAIL
  mov %g0, %i0

retry_tl5:
 !tl5
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, 5, %tl
  wrpr %g0, %g1, %tt
  stxa %g0, [%g0]ASI_ERR_INJ
  retry  !!trap
  brz %i0, FAIL
  mov %g0, %i0

retry_tl6:
 !tl6
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, 6, %tl
  wrpr %g0, %g1, %tt
  stxa %g0, [%g0]ASI_ERR_INJ
  setx clr_err_retry, %l0, %o2
  retry  !!trap
clr_err_retry:
  brz %i0, FAIL
  mov %g0, %i0


!! Now clear all the errors from TSA
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %g0, [%g3]ASI_CERER
  wrpr %g0, 0x1, %tl
  wrpr %g0, %tstate
  wrpr %g0, 0x2, %tl
  wrpr %g0, %tstate
  wrpr %g0, 0x3, %tl
  wrpr %g0, %tstate
  wrpr %g0, 0x4, %tl
  wrpr %g0, %tstate
  wrpr %g0, 0x5, %tl
  wrpr %g0, %tstate
  wrpr %g0, 0x6, %tl
  wrpr %g0, %tstate

  setx user_code_begin_007, %g1, %g2
  jmp  %g2
  nop

FAIL:   EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v006,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA006,
	RA = MY_USER_DATA_RA006,
	PA = ra2pa(MY_USER_DATA_RA006, 0),
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
NAME = .My_User_Section_4v006,
  hypervisor
}
.data
.global user_data_begin_006
user_data_begin_006:
	.word 0x7551
	.word 0x1535d
	.word 0x59
	.word 0x72f7


SECTION .My_User_Section_4v007 TEXT_VA=MY_USER_TEXT_VA007, DATA_VA=MY_USER_DATA_VA007
attr_text {
	Name = .My_User_Section_4v007,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA007,
	RA = MY_USER_TEXT_RA007,
	PA = ra2pa(MY_USER_TEXT_RA007, 0),
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
NAME = .My_User_Section_4v007,
  hypervisor
}

!! inject err in entry 6/7 by doing stxa.

.text
.global user_code_begin_007
user_code_begin_007:
  wrpr %g0, %g0, %tl
!! Enable error detection 
  add %g0, CERER_VA, %g3 
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER

!! Enable error injection 
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ

  mov 0x3c0, %l0
  mov 0x3e0, %l1
  stxa %g0, [%l0]0x25 
  stxa %g0, [%l1]0x25 
  mov %g0, %i0

!disable err injection
  stxa %g0, [%g0]ASI_ERR_INJ

  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0
  
  stxa %g0, [%l0]0x25 
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0
  
  mov 0x3c8, %l0
  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0
  
  stxa %g0, [%l0]0x25  
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0

  mov 0x3d0, %l0
  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0
  
  stxa %g0, [%l0]0x25 
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0

  mov 0x3d8, %l0
  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0
  
  stxa %g0, [%l0]0x25 
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0

  mov 0x3e0, %l0
  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0
  
  stxa %g0, [%l0]0x25 
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0

  mov 0x3e8, %l0
  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0
  
  stxa %g0, [%l0]0x25 
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0

  mov 0x3f0, %l0
  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0
  
  stxa %g0, [%l0]0x25    
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0
  
  mov 0x3f8, %l0
  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0
  
  stxa %g0, [%l0]0x25     
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0
 
  mov 0x38, %l6		        !! read ecc and chk no err 
  ldxa [%l6]0x5b, %g2		!! read ecc for entry with err
  brnz %i0, FAIL
  mov %g0, %i0

!! Now disable err detection and clear the error from entry 6/7
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %g0, [%g3]ASI_CERER
  
  stxa %g0, [%l0]0x25     
  mov 0x3c0, %l0
  stxa %g0, [%l0]0x25     
 
mondo_tail:
!!enable err injection and err detection
!!inject err using write to dev head 
!! Enable error detection 
  add %g0, CERER_VA, %g3 
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER

!! Enable error injection 
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ

  mov 0x3c8, %l0
  stxa %g0, [%l0]0x25 
  mov %g0, %i0

!disable err injection
  stxa %g0, [%g0]ASI_ERR_INJ

  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0

!! Now clear the error from entry 6
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %g0, [%g3]ASI_CERER
 
  stxa %g0, [%l0]0x25     
dev_head:
!!enable err injection and err detection
!!inject err using write to dev head 
!! Enable error detection 
  add %g0, CERER_VA, %g3 
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER

!! Enable error injection 
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ

  mov 0x3d0, %l0
  stxa %g0, [%l0]0x25 
  mov %g0, %i0

!disable err injection
  stxa %g0, [%g0]ASI_ERR_INJ

  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0

!! Now clear the error from entry 6
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %g0, [%g3]ASI_CERER
 
  stxa %g0, [%l0]0x25     
dev_tail:
!!enable err injection and err detection
!!inject err using write to dev head 
!! Enable error detection 
  add %g0, CERER_VA, %g3 
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER

!! Enable error injection 
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ

  mov 0x3d8, %l0
  stxa %g0, [%l0]0x25 
  mov %g0, %i0

!disable err injection
  stxa %g0, [%g0]ASI_ERR_INJ

  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0

!! Now clear the error from entry 6
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %g0, [%g3]ASI_CERER
 
  stxa %g0, [%l0]0x25     
res_head:
!!enable err injection and err detection
!!inject err using write to dev head 
!! Enable error detection 
  add %g0, CERER_VA, %g3 
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER

!! Enable error injection 
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ

  mov 0x3e0, %l0
  stxa %g0, [%l0]0x25 
  mov %g0, %i0

!disable err injection
  stxa %g0, [%g0]ASI_ERR_INJ

  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0

!! Now clear the error from entry 6
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %g0, [%g3]ASI_CERER
 
  stxa %g0, [%l0]0x25     
res_tail:
!!enable err injection and err detection
!!inject err using write to dev head 
!! Enable error detection 
  add %g0, CERER_VA, %g3 
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER

!! Enable error injection 
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ

  mov 0x3e8, %l0
  stxa %g0, [%l0]0x25 
  mov %g0, %i0

!disable err injection
  stxa %g0, [%g0]ASI_ERR_INJ

  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0

!! Now clear the error from entry 6
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %g0, [%g3]ASI_CERER
 
  stxa %g0, [%l0]0x25     
non_res_head:
!!enable err injection and err detection
!!inject err using write to dev head 
!! Enable error detection 
  add %g0, CERER_VA, %g3 
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER

!! Enable error injection 
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ

  mov 0x3f0, %l0
  stxa %g0, [%l0]0x25 
  mov %g0, %i0

!disable err injection
  stxa %g0, [%g0]ASI_ERR_INJ

  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0

!! Now clear the error from entry 6
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %g0, [%g3]ASI_CERER
  stxa %g0, [%l0]0x25     
non_res_tail:
!!enable err injection and err detection
!!inject err using write to dev head 
!! Enable error detection 
  add %g0, CERER_VA, %g3 
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER

!! Enable error injection 
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ

  mov 0x3f8, %l0
  stxa %g0, [%l0]0x25 
  mov %g0, %i0

!disable err injection
  stxa %g0, [%g0]ASI_ERR_INJ

  ldxa [%l0]0x25, %l2
  brz %i0, FAIL   !! chk ipe trap taken
  mov %g0, %i0

!! Now clear the error from entry 6
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %g0, [%g3]ASI_CERER
  stxa %g0, [%l0]0x25     

  setx user_code_begin_008, %g1, %g2
  jmp  %g2
  nop

FAIL:	EXIT_BAD
	nop


attr_data {
	Name = .My_User_Section_4v007,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA007,
	RA = MY_USER_DATA_RA007,
	PA = ra2pa(MY_USER_DATA_RA007, 0),
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
NAME = .My_User_Section_4v007,
  hypervisor
}
.data
.global user_data_begin_007
user_data_begin_007:
	.word 0x14a3d
	.word 0x798d
	.word 0xfdd5
	.word 0x9d05


SECTION .My_User_Section_4v008 TEXT_VA=MY_USER_TEXT_VA008, DATA_VA=MY_USER_DATA_VA008
attr_text {
	Name = .My_User_Section_4v008,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA008,
	RA = MY_USER_TEXT_RA008,
	PA = ra2pa(MY_USER_TEXT_RA008, 0),
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
NAME = .My_User_Section_4v008,
  hypervisor
}
.text
.global user_code_begin_008
user_code_begin_008:
!! Enable error detection 
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  stxa %o2, [%g3]ASI_CERER

  add %g0, 1, %l1  
  add %g0, 6, %l2  
  add %g0, 0x55, %g1
  
  mov %g0, %l6
rd_tstate:
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ
!! change TL
  wrpr %g0, %l2, %tl
  wrpr %g0, %g1, %tstate  
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ

  setx rd_tt, %l0, %o2
  rdpr %tstate, %o2

rd_tt:
  brz %i0, FAIL
  mov %g0, %i0
  wrpr %g0, %l2, %tl
!!enable err injection
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, %g1, %tpc  
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  setx rd_tpc, %l0, %o2

  rdpr %tt, %o2

rd_tpc:
  brz %i0, FAIL
  mov %g0, %i0
  wrpr %g0, %l2, %tl
!!enable err injection
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, %g1, %tnpc  
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  setx rd_tnpc, %l0, %o2

  rdpr %tpc, %o2

rd_tnpc:
  brz %i0, FAIL
  mov %g0, %i0
  wrpr %g0, %l2, %tl
!!enable err injection
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, %g1, %tt  
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  setx rd_hpstate, %l0, %o2

  rdpr %tnpc, %o2

rd_hpstate:
  brz %i0, FAIL
  mov %g0, %i0
  wrpr %g0, %l2, %tl
!!enable err injection
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, %g1, %tt  
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  setx wr_tt, %l0, %o2

  rdhpr %htstate, %o2

wr_tt:
  brz %i0, FAIL
  mov %g0, %i0
  wrpr %g0, %l2, %tl
!!enable err injection
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, %g1, %tt  
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  setx wr_tpc, %l0, %o2

  wrpr %g0, %g1, %tt   

wr_tpc:
  brz %i0, FAIL
  mov %g0, %i0
  wrpr %g0, %l2, %tl
!!enable err injection
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, %g1, %tpc   
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  setx wr_tnpc, %l0, %o2

  wrpr %g0, %g1, %tpc   

wr_tnpc:
  brz %i0, FAIL
  mov %g0, %i0
  wrpr %g0, %l2, %tl
!!enable err injection
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, %g1, %tnpc   
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  setx wr_htstate, %l0, %o2

  wrpr %g0, %g1, %tnpc   

wr_htstate:
  brz %i0, FAIL
  mov %g0, %i0
  wrpr %g0, %l2, %tl
!!enable err injection
  stxa %l5, [%g0]ASI_ERR_INJ
  wrhpr %g0, %g1, %htstate   
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  setx wr_tstate, %l0, %o2

  wrhpr %g0, %g1, %htstate   

wr_tstate:
  brz %i0, FAIL
  mov %g0, %i0
  wrpr %g0, %l2, %tl
!!enable err injection
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, %g1, %tstate  
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ
  setx wr_diag_6, %l0, %o2

  wrpr %g0, %g1, %tstate  
wr_diag_6:
  brz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %l2, %tl
!!enable err injection
  stxa %l5, [%g0]ASI_ERR_INJ
  wrpr %g0, %g1, %tstate  
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ

  mov 0x28, %l6
  ldxa [%l6]0x5b, %g2		!! read ecc for entry with err
  brnz %i0, FAIL
  mov %g0, %i0

!! Now clear the err in entry 5
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %g0, [%g3]ASI_CERER
  mov 1, %l2
  wrpr %g0, %g1, %tstate  
 
  wrpr %g0, %l2, %tl

  setx user_code_begin_010, %g1, %g2
  jmp  %g2
  nop

  EXIT_GOOD


FAIL:	EXIT_BAD
	nop

attr_data {
	Name = .My_User_Section_4v008,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA008,
	RA = MY_USER_DATA_RA008,
	PA = ra2pa(MY_USER_DATA_RA008, 0),
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
NAME = .My_User_Section_4v008,
  hypervisor
}
.data
.global user_data_begin_008
user_data_begin_008:
	.word 0xfd87
	.word 0x6aa3
	.word 0x4d58
	.word 0x547a


SECTION .My_User_Section_4v009 TEXT_VA=MY_USER_TEXT_VA009, DATA_VA=MY_USER_DATA_VA009
attr_text {
	Name = .My_User_Section_4v009,
	part_0_ctx_nonzero_tsb_config_3,
	VA = MY_USER_TEXT_VA009,
	RA = MY_USER_TEXT_RA009,
	PA = ra2pa(MY_USER_TEXT_RA009, 0),
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
NAME = .My_User_Section_4v009,
  hypervisor
}
!! inject errors but don't enable cerer.tsac. Chk that the error is not detected.
.text
.global user_code_begin_009
user_code_begin_009:
  set 0xaabbccdd, %g1
  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5  
  stxa %l5, [%g0]ASI_ERR_INJ   !! enable error injection
 
  mov %g0, %l1
  wrpr %g0, 1, %tl  !!change to tl1
  wrhpr %g0, %g1, %htstate  

  rdpr %tstate, %o2
  rdpr %tt, %o2
  rdpr %tpc, %o2
  rdpr %tnpc, %o2
  rdhpr %htstate, %o2
  wrpr %g0, %g1, %tstate   
  wrpr %g0, %g1, %tt   
  wrpr %g0, %g1, %tpc   
  wrpr %g0, %g1, %tnpc   

  cmp %l1, %i0
  bne FAIL

  wrpr %g0, 2, %tl  !!change to tl2
  wrpr %g0, %g1, %tstate   
  
  rdpr %tstate, %o2
  rdpr %tt, %o2
  rdpr %tpc, %o2
  rdpr %tnpc, %o2
  rdhpr %htstate, %o2
  wrpr %g0, %g1, %tstate   
  wrpr %g0, %g1, %tt   
  wrpr %g0, %g1, %tpc   
  wrpr %g0, %g1, %tnpc   

  cmp %l1, %i0
  bne FAIL
  
  wrpr %g0, 3, %tl  !!change to tl2
  wrpr %g0, %g1, %tt   
  
  rdpr %tstate, %o2
  rdpr %tt, %o2
  rdpr %tpc, %o2
  rdpr %tnpc, %o2
  rdhpr %htstate, %o2
  wrpr %g0, %g1, %tstate   
  wrpr %g0, %g1, %tt   
  wrpr %g0, %g1, %tpc   
  wrpr %g0, %g1, %tnpc   

  cmp %l1, %i0
  bne FAIL
  
  wrpr %g0, 4, %tl  !!change to tl2
  wrpr %g0, %g1, %tpc   
  
  rdpr %tstate, %o2
  rdpr %tt, %o2
  rdpr %tpc, %o2
  rdpr %tnpc, %o2
  rdhpr %htstate, %o2
  wrpr %g0, %g1, %tstate   
  wrpr %g0, %g1, %tt   
  wrpr %g0, %g1, %tpc   
  wrpr %g0, %g1, %tnpc   

  cmp %l1, %i0
  bne FAIL
  
  wrpr %g0, 5, %tl  !!change to tl2
  wrpr %g0, %g1, %tnpc   
  
  rdpr %tstate, %o2
  rdpr %tt, %o2
  rdpr %tpc, %o2
  rdpr %tnpc, %o2
  rdhpr %htstate, %o2
  wrpr %g0, %g1, %tstate   
  wrpr %g0, %g1, %tt   
  wrpr %g0, %g1, %tpc   
  wrpr %g0, %g1, %tnpc   

  cmp %l1, %i0
  bne FAIL
  
  setx user_code_begin_010, %g1, %g2
  jmp  %g2
  nop
  
FAIL:   EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v009,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA009,
	RA = MY_USER_DATA_RA009,
	PA = ra2pa(MY_USER_DATA_RA009, 0),
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 0,
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
NAME = .My_User_Section_4v009,
  hypervisor
}
.data
.global user_data_begin_009
user_data_begin_009:
.xword 0x9f9cf317c6bf6c3e
.xword 0x6e5072dea1536687
.xword 0xecd6c1a2d916c251
.xword 0x3ae5485cda37f88a
.xword 0x1a2c7d4ed5edb96c
.xword 0x9e3b9e188934db9d
.xword 0x6fc59d2722a580de
.xword 0x69b382cc58c91552

	.word 0x26f5
	.word 0x14ad8
	.word 0x6417
	.word 0x17560


SECTION .My_User_Section_4v010 TEXT_VA=MY_USER_TEXT_VA010, DATA_VA=MY_USER_DATA_VA010
attr_text {
	Name = .My_User_Section_4v010,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA010,
	RA = MY_USER_TEXT_RA010,
	PA = ra2pa(MY_USER_TEXT_RA010, 0),
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
NAME = .My_User_Section_4v010,
  hypervisor
}
!! inject errors, enable cerer.tsac. Turn off CETER.PSCCE. 
!! chk that the stores are not committed and the trap is
!! not taken.
.text
.global user_code_begin_010
user_code_begin_010:

mov %g0, %i0

!! set CERER.TSAC
  setx 0x100000000, %g1, %o2   !! enable tsac errs
  add %g0, CERER_VA, %g3

  stxa %o2, [%g3]ASI_CERER

  !! clear CETER.PSCCE but set the DE and pscce bits
  mov 3, %g1
  sllx %g1, 60, %g1
  add %g0, CETER_VA, %g3
  stxa %g1, [%g3]ASI_CETER

  setx TSA_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 to 1
  stxa %l5, [%g0]ASI_ERR_INJ
!! change TL
  mov 1, %l2
  wrpr %g0, %l2, %tl
  wrpr %g0, %g1, %tstate
!! disable error injection
  stxa %g0, [%g0]ASI_ERR_INJ

  rdpr %tstate, %o2
  brnz %i0, FAIL
  mov %g0, %i0

  wrpr %g0, %g1, %tstate        !! shd also clear the err
  brnz %i0, FAIL
  mov %g0, %i0

 !! enable err detection and see that no trap is taken
  mov 1, %g1
  sllx %g1, 62, %g1
  add %g0, CETER_VA, %g3
  stxa %g1, [%g3]ASI_CETER

  rdpr %tstate, %o2
  brnz %i0, FAIL
  mov %g0, %i0


  EXIT_GOOD
  nop

FAIL:   EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v010,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA010,
	RA = MY_nc_DATA_RA010,
	PA = ra2pa(MY_nc_DATA_RA010, 0),
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 0,
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
NAME = .My_User_Section_4v010,
  hypervisor
}
.data
.global user_data_begin_010
user_data_begin_010:
.xword 0x54007d9c96e7a9ff
.xword 0x930027e0327f4f59
.xword 0xe0dcea6ac80eb2ff
.xword 0x970ef238b6fd38f3
.xword 0x1044dc7715f25a67
.xword 0xd7a62736b8af1568
.xword 0x0f5fcf05ff8a547a
.xword 0x853766fbc6f6eaa8

	.word 0xc750
	.word 0x36b
	.word 0x4f6d
	.word 0x108ec


SECTION .My_User_Section_4v011 TEXT_VA=MY_USER_TEXT_VA011, DATA_VA=MY_USER_DATA_VA011
attr_text {
	Name = .My_User_Section_4v011,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA011,
	RA = MY_USER_TEXT_RA011,
	PA = ra2pa(MY_USER_TEXT_RA011, 0),
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
NAME = .My_User_Section_4v011,
  hypervisor
}
.text
.global user_code_begin_011
user_code_begin_011:
!! The index 40 has errors.
!! turn off cerer.dcvp.
!! access an index with errros.
!! The ld reqs shd be hits and no err shd be reported.
!! Now turn on the cerer.dcvp, chk that an error is reported.

  setx user_data_begin_011, %g1, %o4
  swap  [%o4 + %i1], %g2	!! Take a dae_nc_pg exception to turn of cerer.dcvp

  !!now do a bunch of lds from the index with err and see no trap is reported 
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1

  mov %g0, %l1
  cmp     %i0, %l1
  bne     FAIL
  mov     %g0, %i0
  add     %g0, 1, %l1

! turn on cerer.dcvp
  ldxa [%g3]0x4, %g1  !!priv_action trap

  ld [%g3+%i1], %g1  !! err reported
  cmp     %i0, %l1
  bne     FAIL
  mov     %g0, %i0

!! Ld data in 2 ways in cache. Inject error in invalid way. Chk that the error
!! is still reported when we access the index.

INVALID_LINE_CASE:
  add %i1, 0x20, %i1  !! index is 60
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  add %g0, 2, %l0 	!! inject err in way2

  ld [%g3+1], %g1	!! Take misaligned trap to inject err
setx user_data_begin_005, %g1, %o3
  ld [%o3+%i1], %g1  !! err shd be reported
  setx user_code_begin_012, %g1, %g2
  jmp %g2
  nop

FAIL:   EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v011,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA011,
	RA = MY_nc_DATA_RA011,
	PA = ra2pa(MY_nc_DATA_RA011, 0),
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 0,
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
NAME = .My_User_Section_4v011,
  hypervisor
}
.data
.global user_data_begin_011
user_data_begin_011:
.xword 0xe2faba6d06c28930
.xword 0xeb17ac2bc38a58c1
.xword 0xb82aeb3b264dd259
.xword 0xb68211db06aea937
.xword 0x05082906aae4d7b4
.xword 0x6ddfd83f3e9a6b87
.xword 0x15f5c009f48a5dfe
.xword 0x57519c7e517d5a47

	.word 0x1684b
	.word 0xe9eb
	.word 0x39e
	.word 0x15b8


SECTION .My_User_Section_4v012 TEXT_VA=MY_USER_TEXT_VA012, DATA_VA=MY_USER_DATA_VA012
attr_text {
	Name = .My_User_Section_4v012,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA012,
	RA = MY_USER_TEXT_RA012,
	PA = ra2pa(MY_USER_TEXT_RA012, 0),
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
NAME = .My_User_Section_4v012,
  hypervisor
}
.text
.global user_code_begin_012
user_code_begin_012:
        cmp     %i0, %l1
        bne     FAIL
        mov     %g0, %i0
	add %g0, 0x40, %i1

	add %g0, 4, %l0  !! err in all ways

! turn off ceter.dhcce
	mov %g0, %l7
  	ldd [%g3 + 0x4], %d0	
! ld data

  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1

!take misaligned trap
  
  ld [%g3+1], %g1

!now access from same page, no err shd be reported, desr shd still be updated
!! and the err cleared and D$ invalidated.
  
  ld [%g3+%i1], %g1
  mov %g0, %l1
  cmp     %i0, %l1
  bne     FAIL
  mov %g0, %o6  !! ME bit clear
! chk that desr is still updated
  std %d0, [%g3 + 0x4]	!stdf_not_aligned

! If I turn on ceter.dhcce now, the trap won't be taken because the TLU
! clears the F bit once we read the DESR.

! Do a bunch of bogus lds and then turn on ceter.dhcce. 
  ld [%g3], %g1
  ld [%g4], %g1
  ld [%g5], %g1

! turn on dhcce  
  add %g0, 1, %l7
  ldd [%g3 + 0x4], %d0	

! Do a bunch of bogus lds. The TLU will still take the trap. Clear the io
  ld [%g3], %g1
  ld [%g4], %g1
  ld [%g5], %g1
  mov %g0, %l1
  mov %g0, %i0

! By this time the trap shd be taken.
! now do a bunch of lds from the index that had the err. No trap shd be taken as 
! the error shd have been cleared.

  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  mov %g0, %l1  
  cmp     %i0, %l1
  bne     FAIL
  setx user_code_begin_013, %g1, %g2
  jmp  %g2
  nop

FAIL:   EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v012,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA012,
	RA = MY_nc_DATA_RA012,
	PA = ra2pa(MY_nc_DATA_RA012, 0),
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 0,
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
NAME = .My_User_Section_4v012,
  hypervisor
}
.data
.global user_data_begin_012
user_data_begin_012:
.xword 0xe7719c91a7d39000
.xword 0x897bf53fdfab4acf
.xword 0x33641c943c252a55
.xword 0x7a6152bedcb6d45a
.xword 0xc402d285b09a5315
.xword 0x113780fae604dd95
.xword 0xf4b4dc9fdda745da
.xword 0x4541714dba5a4e49

	.word 0x1001b
	.word 0x8080
	.word 0x1008a
	.word 0x9431


SECTION .My_User_Section_4v013 TEXT_VA=MY_USER_TEXT_VA013, DATA_VA=MY_USER_DATA_VA013
attr_text {
	Name = .My_User_Section_4v013,
	part_0_ctx_nonzero_tsb_config_2,
	VA = MY_USER_TEXT_VA013,
	RA = MY_USER_TEXT_RA013,
	PA = ra2pa(MY_USER_TEXT_RA013, 0),
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
NAME = .My_User_Section_4v013,
  hypervisor
}
.text
.global user_code_begin_013
user_code_begin_013:
	add %g0, 4, %l0  !! err in all ways

! turn off ceter.dhcce
	mov %g0, %l7
  	ldd [%g3 + 0x4], %d0	

!take misaligned trap
  
  ld [%g3+1], %g1

!now access from same page, no err shd be reported, desr shd still be updated
!! and the err cleared and D$ invalidated.
  
  ld [%g3+%i1], %g1
  mov %g0, %l1
  cmp     %i0, %l1
  bne     FAIL

!! Now inject error in another index.
!! ld in all the ways
 add %i1, 0x10, %i1  !! index is 0x50
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1
  
  ld [%g3+1], %g1  !! inject err

!now access from same page, no err shd be reported, desr shd still be updated
! and ME bit be set.
!!And the err cleared and D$ invalidated.

!now access from same page, no err shd be reported, desr shd still be updated
!! and the err cleared and D$ invalidated.
  
  ld [%g3+0x50], %g1
  mov %g0, %l1
  cmp     %i0, %l1
  bne     FAIL
  add %g0, 0x40, %i1  !! DESR recoreds the info for the first index
  add %g0,1, %o6  !! ME bit set
! chk that desr is still updated
  std %d0, [%g3 + 0x4]	!stdf_not_aligned

! Do a bunch of bogus lds and then turn on ceter.dhcce. 
  ld [%g3], %g1
  ld [%g4], %g1
  ld [%g5], %g1

! turn on dhcce  
  add %g0, 1, %l7
  ldd [%g3 + 0x4], %d0	

! Do a bunch of bogus lds. The TLU will still take the trap. Clear the io
  ld [%g3], %g1
  ld [%g4], %g1
  ld [%g5], %g1
  mov %g0, %l1
  mov %g0, %i0

! By this time the trap shd be taken.
! now do a bunch of lds from the index that had the err. No trap shd be taken as 
! the error shd have been cleared.

  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1
  ld [%g3+0x50], %g1
  ld [%g4+0x50], %g1
  ld [%g5+0x50], %g1
  ld [%g6+0x50], %g1
  
  mov %g0, %l1  
  cmp     %i0, %l1
  bne     FAIL
  nop

  EXIT_GOOD
  nop

FAIL: 
	EXIT_BAD
	nop
attr_data {
	Name = .My_User_Section_4v013,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA013,
	RA = MY_nc_DATA_RA013,
	PA = ra2pa(MY_nc_DATA_RA013, 0),
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 0,
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
NAME = .My_User_Section_4v013,
  hypervisor
}
.data
.global user_data_begin_013
user_data_begin_013:
.xword 0xf9d14275b20204ee
.xword 0xcbd5e7e62934200b
.xword 0x88d5a3eb459d773d
.xword 0x1113616971dbf6ad
.xword 0x9208e6261dbbac60
.xword 0x6ad4e3984dc85a86
.xword 0x5b8aaa327733b2bc
.xword 0x0178b83acce0d7fa
.xword 0xd6cc7f8e1fe93d33
	.word 0x137a8
	.word 0xa14
	.word 0xc9a1
	.word 0x14d93


.global INT_PROC_ERR_HANDLER

SECTION .HTRAPS
.text

INT_PROC_ERR_HANDLER:  
!! read the dsfsr
  add %g0, SFSR_VA, %o1
  ldxa [%o1]ASI_DSFSR, %o2   !! read the dsfsr
  cmp %o2, DSFSR_TSAC 
  bne FAIL

  add %g0, 1, %i0
  nop
  done
  nop

FAIL: EXIT_BAD
	nop



