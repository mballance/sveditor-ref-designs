/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: err_sca_diag.s
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
#define  SCAC_ERR_TYPE   0xa

#define MAIN_PAGE_HV_ALSO

#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
        add %g0, CERER_VA, %g3; \
  	set SCAU_ERR_EN, %g1; \
  	or %g1, %l2, %g1 ;\
  	stxa %g1, [%g0]ASI_ERR_INJ;\
        done;nop

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

  !! set CERER.SCAC
  setx 0x40000000, %g1, %o2   !! enable scac errs
  add %g0, CERER_VA, %g3        !!g3 has cerer va

  stxa %o2, [%g3]ASI_CERER

  !! set CETER.DHCCE
  setx CETER_PSCCE, %l0, %o2
  add %g0, CETER_VA, %g3
  stxa %o2, [%g3]ASI_CETER

  add %g0, 1, %l2	!! mask 

!! Enable error injection
  set SCAU_ERR_EN, %l1
  or %l1, %l2, %l1   ! set mask bit 0 to 1
  stxa %l1, [%g0]ASI_ERR_INJ

  ta T_CHANGE_NONHPRIV

        ta T_CHANGE_PRIV
        mov %g0, %i0
        add %g0, 1, %l1 
	mov %g0, %i1
	add %g0, 0x20, %o4  !! asi to clear the err in trap handler
        setx user_data_begin_000, %g1, %l4
        setx user_code_begin_000, %g1, %g2

        jmp  %g2
        mov %g0, %o3
        EXIT_BAD

/*
begin_thread_1:
        add %g0, 4, %i7
        setx THS_START, %g1, %g2
        jmp  %g2
        nop
        EXIT_BAD

begin_thread_2:
        add %g0, 8, %i7
        setx THS_START, %g1, %g2
        jmp  %g2
        nop
        EXIT_BAD
*/

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
.text
.global user_code_begin_000
user_code_begin_000:
	ldx [%l4 + %i1], %i2	    !! data to be stored in scratchpad
	stxa %i2, [%g0 + %i1]0x20
	ldxa [%g0 + %i1]0x20, %i3   !! error is precise
	cmp %i3, %i2
        bne     FAIL
        cmp     %i0, %l1
        bne     FAIL
        mov %g0, %i0
	add %i1, 8, %i1
	cmp %i1, 0x20
	be,a .+8
	add %g0, 0x30, %i1
	cmp %i1, 0x38
	ble user_code_begin_000
	nop

LOOP_000:
	add %o3, 8, %o3  !! pt o3 to next location of the ecc value
	mov %g0, %i1 
	sll %l2, 1, %l2
	cmp %l2, 0x80
	!be,a .+8
	!mov %g0, %l1	!! no trap if error in bit 7 of syndrome
	ble user_code_begin_000
	ldx [%l4 + 0x2], %i2   	! mem_aligned trap to change the mask in err_inject_reg

	setx user_code_begin_001, %g1, %g2
	jmp %g2
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
user_code_begin_001:
  ta    T_CHANGE_HPRIV
  add %g0, 1, %l2	!! mask 
  mov %g0, %o3

!! Enable error injection
  set SCAU_ERR_EN, %l3
  or %l3, %l2, %l3   
  stxa %l3, [%g0]ASI_ERR_INJ
  setx user_data_begin_001, %g1, %l4
  mov %g0, %i1
  add %g0, 1, %l1
  add %g0, 0x40, %o4  !! asi to clear the err in trap handler

START:
	ldx [%l4 + %i1], %i2	    !! data to be stored in scratchpad
	stxa %i2, [%g0 + %i1]0x4F
	ldxa [%g0 + %i1]0x4F, %i3   !! error is precise
	cmp %i3, %i2
        bne     FAIL
        cmp     %i0, %l1
        bne     FAIL
        mov %g0, %i0
	add %i1, 8, %i1
	cmp %i1, 0x38
	ble START
	nop

LOOP_001:
	add %o3, 8, %o3
        set SCAU_ERR_EN, %l3
	mov %g0, %i1 
	sll %l2, 1, %l2
	or %l3, %l2, %l3
	cmp %l2, 0x80
	!be,a .+8
	!mov %g0, %l1
	ble START
  	stxa %l3, [%g0]ASI_ERR_INJ
	
	setx user_code_begin_002, %g1, %g2
	jmp %g2


FAIL:
        EXIT_BAD
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
.xword 0xe0066361bd9fcb86
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
user_code_begin_002:
  add %g0, 1, %l2
  set SCAU_ERR_EN, %l3
  or %l3, %l2, %l3   
  stxa %l3, [%g0]ASI_ERR_INJ
  mov %g0, %i1
  setx user_data_begin_002, %g1, %l4
  add %g0, 1, %l1
  mov %g0, %o3
  set 0xffffff00, %g1
  add %g0, 0x40, %o4  !! asi to clear the err in trap handler

ST0:
	ldx [%l4 + %i1], %i2	    !! data to be stored in scratchpad
	stxa %i2, [%g0 + %i1]0x4F
	sll %l2, 1, %l2
	and %l3, %g1, %l3
	or %l3, %l2, %l3
	add %i1, 8, %i1
	cmp %i1, 0x38
	ble ST0
  	stxa %l3, [%g0]ASI_ERR_INJ

  	mov %g0, %i1
  	add %g0, 1, %l2
LD0:
	ldx [%l4 + %i1], %i2	    
	ldxa [%g0 + %i1]0x4F, %i3   !! error is precise
        cmp     %i0, %l1
        bne     FAIL
        mov %g0, %i0
	sll %l2, 1, %l2
	add %o3, 8, %o3
	cmp %i1, 0x30
	ble LD0	
	add %i1, 8, %i1

	setx user_code_begin_003, %g1, %g2
	jmp %g2
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
!! Chk that no err is seen on a write.
!! Also no err is falgged on a diagnostic read.
.text
.global user_code_begin_003
user_code_begin_003:
  add %g0, 1, %l2
  set SCAU_ERR_EN, %l3
  or %l3, %l2, %l3   
  stxa %l3, [%g0]ASI_ERR_INJ
  mov %g0, %i1
  mov %g0, %l1
  mov %g0, %i3
  mov %g0, %i0
  setx user_data_begin_003, %g1, %l4
  set 0xffffff00, %g1

ST1:
	ldx [%l4 + %i1], %i2	    !! data to be stored in scratchpad
	stxa %i2, [%g0 + %i1]0x4F
	sll %l2, 1, %l2
	and %l3, %g1, %l3
	or %l3, %l2, %l3
	add %i1, 8, %i1
	cmp %i1, 0x38
	ble ST1
  	stxa %l3, [%g0]ASI_ERR_INJ

        add %g0, 1, %l2
	and %l3, %g1, %l3
	or %l3, %l2, %l3
  	stxa %l3, [%g0]ASI_ERR_INJ
  	mov %g0, %i1
	cmp %i3, 0x0
	be ST1
	add %i3, 1, %i3

        brnz %i0, FAIL
        mov     %g0, %i0

!! ALL scratch pad entries have errors. Do a diagnostic read from all entries
!!and see that no error is flagged.
  mov %g0, %i1
  mov %g0, %l1
  mov %g0, %i3
  mov %g0, %i0

LD1:
  ldxa [%g0 + %i1]0x59, %o3   !! read the ecc
  add %i1, 0x40, %g1
  ldxa [%g1]0x59, %g3   !! read the data
  brnz %i0, FAIL
  mov     %g0, %i0
  cmp %i1, 0x30
  ble LD1
  add %i1, 8, %i1

  setx user_code_begin_004, %g1, %g2
  jmp %g2
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

!! check if cerer.scac is clear or ceter.pscce is clear then the error is
!! not detected and the sfsr is not updated.
!! When we enter this testcase all the scratchpad entries have errors.
!! Errors are put by the stxa's in the loop above.

.text
.global user_code_begin_004
user_code_begin_004:
  mov %g0, %i1
  !! clear CERER.SCAC
  add %g0, CERER_VA, %g3     
  stxa %g0, [%g3]ASI_CERER
  add %g0, SFSR_VA, %g1
  add %g0, 0x1000, %o1
  mov %g0, %o3

LD4:
	ldx [%l4 + %i1], %i2	    
	ldxa [%g0 + %i1]0x4F, %i3   
	cmp %i3, %i2
        bne     FAIL
  	ldxa [%g1]ASI_DSFSR, %o1   !! read the DSFSR
	brnz	%o1, FAIL
	brnz	%i0, FAIL
	cmp %i1, 0x30
	ble LD4
	add %i1, 8, %i1


!! Now set CERER.SCAC, but clear CETER.PSCCE. CHk that no error again.
  setx 0x40000000, %g4, %o2   !! enable scac errs
  add %g0, CERER_VA, %g3        !!g3 has cerer va

  stxa %o2, [%g3]ASI_CERER
  
  add %g0, CETER_VA, %g3
  stxa %g0, [%g3]ASI_CETER

  mov %g0, %i1
  add %g0, 0x1000, %o1

LD5:
	ldx [%l4 + %i1], %i2	    
	ldxa [%g0 + %i1]0x4F, %i3   
	cmp %i3, %i2
        bne     FAIL
  	ldxa [%g1]ASI_DSFSR, %o1   !! read the DSFSR
	brnz	%o1, FAIL
	brnz	%i0, FAIL
	cmp %i1, 0x30
	ble LD5
	add %i1, 8, %i1


!! Now set both CERER.SCAC, and  CETER.PSCCE. Chk that error comes.
  !! set CETER.PSCCE
  setx CETER_PSCCE, %l0, %o2
  add %g0, CETER_VA, %g3
  stxa %o2, [%g3]ASI_CETER
  
  mov %g0, %i1
  add %g0, 1, %l1
  add %g0, 1, %l2

LD5_1:
	ldx [%l4 + %i1], %i2	    
	ldxa [%g0 + %i1]0x4F, %i3   
	cmp %i3, %i2
        bne     FAIL
        cmp %i0, %l1
        bne     FAIL
	mov %g0, %i0
	sll %l2, 1, %l2
	add %o3, 8, %o3
	cmp %i1, 0x30
	ble LD5_1
	add %i1, 8, %i1


!! All errors shd be cleared now and no errors shd be seen
  
  mov %g0, %i1
  mov %g0, %l1

LD6:
	ldx [%l4 + %i1], %i2	    
	ldxa [%g0 + %i1]0x4F, %i3   
	cmp %i3, %i2
        bne     FAIL
        brnz %i0, FAIL
	mov %g0, %i0
	cmp %i1, 0x30
	ble LD6
	add %i1, 8, %i1

  setx user_code_begin_005, %g1, %g2
  jmp %g2
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
.text
.global user_code_begin_005
user_code_begin_005:
!!Now again inject errors in all the entries, but set cerer.scau bit.
!! Make sure that error is not flagged.

  add %g0, 1, %l3
  add %g0, 1, %l2
  set SCAU_ERR_EN, %l3
  or %l3, %l2, %l3   
  stxa %l3, [%g0]ASI_ERR_INJ

!! Set cerer.scau bit
  setx 0x20000000, %g1, %o2   !! enable scau errs
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %o2, [%g3]ASI_CERER

	mov %g0, %i1
  	setx user_data_begin_005, %g1, %l4
  	set 0xffffff00, %g1
  	mov %g0, %o3
ST5:
	ldx [%l4 + %i1], %i2	    !! data to be stored in scratchpad
	stxa %i2, [%g0 + %i1]0x4F
	sll %l2, 1, %l2
	and %l3, %g1, %l3
	or %l3, %l2, %l3
	add %i1, 8, %i1
	cmp %i1, 0x38
	ble ST5
  	stxa %l3, [%g0]ASI_ERR_INJ

	mov %g0, %l1
	mov %g0, %i1
LD7:
	ldx [%l4 + %i1], %i2	    
	ldxa [%g0 + %i1]0x4F, %i3   
	cmp %i3, %i2
        bne     FAIL
        brnz %i0, FAIL
	cmp %i1, 0x30
	ble LD7
	add %i1, 8, %i1


!! Now set CERER.SCAC, and see that the error is flagged.
!! Set cerer.scac bit
  setx 0x40000000, %g1, %o2   !! enable scac errs
  add %g0, CERER_VA, %g3        !!g3 has cerer va
  stxa %o2, [%g3]ASI_CERER

	add %g0, 1, %l1
	add %g0, 1, %l2
	mov %g0, %i1
LD8:
	ldx [%l4 + %i1], %i2	    
	ldxa [%g0 + %i1]0x4F, %i3   
	cmp %i3, %i2
        bne     FAIL
        cmp %i0, %l1
        bne     FAIL
	mov %g0, %i0
	sll %l2, 1, %l2
	add %o3, 8, %o3
	cmp %i1, 0x30
	ble LD8
	add %i1, 8, %i1

	EXIT_GOOD
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

.global INT_PROC_ERR_HANDLER
.global INVALID_ASI_HANDLER

SECTION .HTRAPS
.text

INT_PROC_ERR_HANDLER:  
CHK_ERR_TYP:
  setx  ecc_syndrome_table, %g1, %g2
  add %g0, SFSR_VA, %g1
  ldxa [%g1]ASI_DSFSR, %o1   !! read the DSFSR
  stxa %g0, [%g1]ASI_DSFSR   !! clear the dsfsr
  and %o1, 0xF, %o1
  cmp %o1, SCAC_ERR_TYPE
  bne FAIL
CHK_INDEX:
  add %g0, SFAR_VA, %g1
  ldxa [%g1]ASI_SFAR, %o1   !! read the DSFAR
  srl %i1, 3, %g6	!! expected value of index
  and %o1, 0x7, %o2
  cmp %o2, %g6
  bne FAIL

!!diagnostic read the bad data  and ecc
CHK_SYNDROME:
  srl %o1, 3, %o2	!! o2 has the bad syndrome
  and %o2, 0x80, %g6	!! look at the overall parity. Shd be 1 for correctable errors. 
  brz %g6, FAIL
  and %o2, 0x7F, %g6
  sllx %l2, 3, %g3
  ldx [%g2 + %o3], %g4
  cmp %g4, %g6
  bne FAIL

  ldxa [%g0 + %i1]0x59, %g6   !! read the ecc

  add %i1, 0x40, %g1
  ldxa [%g1]0x59, %g3   !! read the data
  cmp %i2, %g3	  !! 	i2 has the expceted data
  bne FAIL

TURN_OFF_ERR_INJ:
  !!turn off error
  stxa %g0, [%g0]ASI_ERR_INJ
  !! do a normal wr to the scratchpad entry to clear the err
  cmp %o4, 0x20
  be,a .+12
  stxa %g3, [%i1]0x20
  stxa %g3, [%i1]0x4f

CHECK_ERR_INJECT:
  !! diag read the ecc
  ldxa [%g0 + %i1]0x59, %g4   !! read the ecc
  xor %g4, %l2, %g5
  cmp %g5, %g6
  bne FAIL

ENABLE_ERR_INJ:

  !! enable error injection
  setx SCAU_ERR_EN, %l0, %g1
  or %g1, %l2, %g1   ! set mask bit 0 to 1
  stxa %g1, [%g0]ASI_ERR_INJ
  add %g0, 1, %i0
  retry

PASS: EXIT_GOOD
	nop

FAIL: EXIT_BAD
	nop

.data
.align 64
ecc_syndrome_table:
.xword  0x01	!! C0
.xword  0x02	!! C1
.xword  0x04	!! C2
.xword  0x08	!! C3
.xword  0x10	!! C4
.xword  0x20	!! C5
.xword  0x40	!! C6
.xword  0x00	!! C7
