/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: err_dcdp_halt_diag.s
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
#define THREAD_COUNT	8
#define THREAD_STRIDE	1

#define MY_HP_TEXT_PA     0x1050000000
#define MY_HP_DATA_PA     0x1050001000

#define ASI_PRIMARY_CONTEXT_0   0x21
#define ASI_ITLB_DATA_IN_REG    0x54
#define ASI_DMMU_TAG_ACCESS     0x58
#define ASI_DTLB_DATA_IN_REG    0x5c
#define ASI_DMMU_SFAR           0x58

#define PART0_NZ_RANOTPA_2      0
			
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
#define MY_USER_DATA_RA000      0x6a000000
#define MY_USER_DATA_PA000      0x6a000000
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

#define  CETER_DHCCE    0x1000000000000000
#define  CETER_DE       0x2000_0000_0000_0000
#define  CETER_PSCCE    0x4000_0000_0000_0000
#define DCDP_ERR_TYPE 0x8

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

#define  H_HT0_DAE_nfo_page_0x17
#define SUN_H_HT0_DAE_nfo_page_0x17 \
        ba DAE_NFO_PG_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

#include "hboot.s"

/************************************************************************
   Test case:	
 ************************************************************************/

.text
.global main

main:		/* test begin */
 ta    T_CHANGE_HPRIV

  setx 0x0000000000000800, %l0, %o2   !! enable DCDP errs
  add %g0, CERER_VA, %g3        !!g3 has cerer va

  stxa %o2, [%g3]ASI_CERER

  !! set CETER.DHCCE
  setx CETER_DHCCE, %l0, %o2
  add %g0, CETER_VA, %g3
  stxa %o2, [%g3]ASI_CETER

  !! Put cache in direct mapped mode
  add %g0, 0x10, %g1
  or %g0, 0x2, %g2
  stxa %g2, [%g1]ASI_DIAG

  ta    T_CHANGE_NONHPRIV
  

  add %g0, 0x800, %i2   !!way 1
  set 0x1000, %i3               !!way 2
  set 0x1800, %i4               !!way 3
  setx user_data_begin_000, %g1, %g3
  setx user_data_begin_001, %g1, %g4
  setx user_data_begin_002, %g1, %g5
  setx user_data_begin_003, %g1, %g6
  
  !! change g4, g5 and g6 to ways 1, 2 and 3
  or	%g4, %i2, %g4
  or	%g5, %i3, %g5
  or	%g6, %i4, %g6
  
  add %g0, 32, %i1      !!i1 has the cache index

  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1
  
  setx user_data_begin_005, %g1, %g2
  stx %g0, [%g2]   !! take a trap

  mov %g3, %o7

  mov %g0, %l0  !! l0 has the way no.
  mov %g0, %l4 !! iteration #
  mov %g0, %l5 
  mov %g0, %l1  !! 
  add %g0, 1, %l6  !! no. of valid ways in the index when trap is taken
        
 ta    T_CHANGE_HPRIV

        setx user_code_begin_000, %g1, %g2
        jmp  %g2
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
	RA = MY_USER_TEXT_PA000,
	PA = MY_USER_TEXT_PA000,
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
        cmp %i0, %l1
        bne     FAIL
        mov     %g0, %i0
!!ld all 4 ways of the cache
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1

        ld [%g3+1], %g1         !cause mem_addr_not_aligned trap
	add %i1, %l4, %l5
        ldub [%g3+%l5], %g1       !! access the line to chk for trap
        wrhpr %g0, 0x0, %halt
	add %g0, 1, %l1
        
	setx user_code_begin_001, %g1, %g2
        jmp  %g2
        add %i1, 0x10, %i1  !!mov to next index

FAIL:
        EXIT_BAD

attr_data {
	Name = .My_User_Section_4v000,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA000,
	RA = MY_USER_DATA_RA000,
	PA = MY_USER_DATA_PA000,
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
	RA = MY_USER_TEXT_PA001,
	PA = MY_USER_TEXT_PA001,
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
        cmp %i0, %l1
        bne     FAIL
        mov     %g0, %i0
        add %g0, 1,  %l0  !! inject err in way 1

!!ld all 4 ways of the cache
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1
	
	add %i1, %l4, %l5

        ld [%l3+1], %g1         !cause mem_addr_not_aligned trap
        ldub [%g3+%l5], %g1       !! access the line to chk for trap
        wrhpr %g0, 0x0, %halt

        setx user_code_begin_002, %g1, %g2
        jmp  %g2
        add %i1, 0x10, %i1  !!mov to next index

FAIL:
        EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v001,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA001,
	RA = MY_USER_DATA_RA001,
	PA = MY_USER_DATA_PA001,
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
.skip 0x800
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
	RA = MY_USER_TEXT_PA002,
	PA = MY_USER_TEXT_PA002,
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
        cmp %i0, %l1
        bne     FAIL
        mov     %g0, %i0
        add %g0, 2, %l0  !! inject err in way 2

!!ld all 4 ways of the cache
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1

	add %i1, %l4, %l5
        ld [%l3+1], %g1         !cause mem_addr_not_aligned trap
        ldub [%g3+%l5], %g1       !! access the line to chk for trap
        wrhpr %g0, 0x0, %halt

        setx user_code_begin_003, %g1, %g2
        jmp  %g2
        add %i1, 0x10, %i1  !!mov to next index

FAIL:
        EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v002,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA002,
	RA = MY_USER_DATA_RA002,
	PA = MY_USER_DATA_PA002,
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
	.skip 0x1000
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
	RA = MY_USER_TEXT_PA003,
	PA = MY_USER_TEXT_PA003,
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
user_code_begin_003:
        cmp %i0, %l1
        bne     FAIL
        mov     %g0, %i0
        add %g0, 3, %l0  !! inject err in way 3

!!ld all 4 ways of the cache
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1
	add %i1, %l4, %l5

        ld [%l3+1], %g1         !cause mem_addr_not_aligned trap
        ldub [%g3+%l5], %g1       !! access the line to chk for trap
        wrhpr %g0, 0x0, %halt

        setx user_code_begin_004, %g1, %g2
        jmp  %g2
        add %i1, 0x10, %i1  !!mov to next index

FAIL:
        EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v003,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA003,
	RA = MY_USER_DATA_RA003,
	PA = MY_USER_DATA_PA003,
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
	.skip 0x1800
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
	RA = MY_USER_TEXT_PA004,
	PA = MY_USER_TEXT_PA004,
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
user_code_begin_004:
        cmp %i0, %l1
        bne     FAIL
        mov     %g0, %i0
        add %g0, 4, %l0  !! inject err in all ways

!!ld all 4 ways of the cache
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1

	add %i1, %l4, %l5
        ld [%l3+1], %g1         !cause mem_addr_not_aligned trap
        ldub [%g3+%l5], %g1       !! access the line to chk for trap
        wrhpr %g0, 0x0, %halt

        setx user_code_begin_000, %g1, %g2
  	add %g0, 32, %i1      !!i1 has the cache index
	cmp %l4, 0xF
	bnz GO_BACK
	add %l4, 1, %l4

    ta T_CHANGE_NONHPRIV
        setx user_code_begin_005, %g1, %g2
  	add %g0, 32, %i1      !!i1 has the cache index
	mov %g0, %l4
GO_BACK:
        jmp  %g2
	add %i1, %l4, %l5

FAIL:	EXIT_BAD
	nop

attr_data {
	Name = .My_User_Section_4v004,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA004,
	RA = MY_USER_DATA_PA004,
	PA = MY_USER_DATA_PA004,
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
	PA = MY_USER_TEXT_PA005,
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
!!Inject error into first 8 bytes of the cacheline in all ways. Access data from 
!!next 8 bytes. No trap shd be taken.
user_code_begin_005:
        cmp %i0, %l1
        bne     FAIL
        mov     %g0, %i0
        add %g0, 4, %l0  !! inject err in all ways
        add %g0, 1, %l4  !! inject error in byte 1

!!ld all 4 ways of the cache
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1

	add %i1, 15, %l5
        ld [%l3+1], %g1         !cause mem_addr_not_aligned trap

        ldub [%g3+%l5], %g1       !! access the next 8 bytes, no trap
	add %i1, 8, %l5
        ldx [%g3+%l5], %g1       !! access the next 8 bytes, no trap, access using ldx

	mov %g0, %l1 
	cmp %i0, %l1
        bne     FAIL
	nop
!! Do different type of store accesses and the error shd not be detected.
!! The error is in all the 4 ways of the index 20 in the first 8 bytes.
!! On a read parity is chked across 8 bytes but for a write the parity 
!! is stored only for bytes that I am writing.
!! The following stores will recreate new paroty for bytes 0 to 3 and
!! overwrite the rror.

	add %i1, 4, %i5
	stw  %g2, [%g3 + %i5]	!! store 
  	ldub [%g3+%i5], %g1  !! This will get the data bypassed from STB. As
			!! there is raw match no error shd be seen
	st  %f0, [%g4 + %i5]   !! fp store
	add %g5, %i1, %l5
	or %g0, 0xff, %i5
	stda  %d0, [%l5 + %i5]0xC0   !! pst store
	add %i1, 8, %l5
	stwa  %g3, [%g6 + %l5]0xE2   !! bis store, L1$ is invalidated

!! Now do lds from above lines and chk that the error is cleared
  
  membar #Sync   

  ld [%g4+%i1], %f0	
  ldda [%g5+%i1]0xD2, %d2  !! short fp ld
  ldx [%g6+%i1], %g1
  add %i1, 15, %i5 
  ldub [%g3+%i5], %g1

  cmp     %i0, %l1
  bne     FAIL
  setx user_code_begin_006, %g1, %g2

  jmp  %g2
  add %i1, 0x20, %i1

FAIL:	EXIT_BAD
	nop

attr_data {
	Name = .My_User_Section_4v005,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA005,
	RA = MY_USER_DATA_RA005,
	PA = MY_USER_DATA_PA005,
	TTE_Context = PCONTEXT,
	TTE_V       = 1,
	TTE_NFO     = 1,
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
	PA = MY_USER_TEXT_PA006,
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
.text
.global user_code_begin_006
user_code_begin_006:
        cmp %i0, %l1
        bne     FAIL
        mov     %g0, %i0
        add %g0, 4, %l0  !! inject err in all ways
        add %g0, 1, %l4  !! inject error in byte 1
	add %g0, 0x40, %i1
!!ld all 4 ways of the cache, index is 40
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1

  ld [%l3+1], %g1         !cause mem_addr_not_aligned trap
				!inject error in all ways

  mov %g0, %l6  !! blk ld is not loaded into cache
  ! do a blk ld
  ! for blk lds err is seen if it is in the first D$ line and in the first 8 bytes.
  ldda [%g3 + %i1]0xF0, %d0  !! error shd be seen
  setx user_code_begin_007, %g1, %g2
  add %g0, 1, %l1
  cmp     %i0, %l1
  bne     FAIL
  mov %g0, %i0

  !! now inject error in way3 only, i.e. inject in the way the address of which
  !! we are not accessing, LSU shd still flag the error.

BLK_LD_CASE_2:
        add %g0, 3, %l0  !! inject err in way3
!!ld all 4 ways of the cache, index is 40
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1

  ld [%l3+1], %g1         !cause mem_addr_not_aligned trap
  ldda [%g3 + %i1]0xF0, %d0  !! error shd be seen here too
  jmp %g2
  add %g0, 4, %l0  !! inject err in all ways



FAIL:   EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v006,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA006,
	RA = MY_USER_DATA_RA006,
	PA = MY_USER_DATA_PA006,
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
	PA = MY_USER_TEXT_PA007,
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

!! inject error in all the 4 ways and do special memops and chk the effect.
!! Also do nc accesses

.text
.global user_code_begin_007
user_code_begin_007:
  cmp     %i0, %l1
  bne     FAIL
  mov %g0, %i0
  mov %g0, %l1

!!ld all 4 ways of the cache, index is 40
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %o3
  ldx [%g6+%i1], %o4


  ld [%l3+1], %g1         !cause mem_addr_not_aligned trap
				!inject error in all ways

  ! do atomic lds to clear errors in all the ways
  ldstub  [%g4 + %i1], %g1	!! no error shd be flagged
  swap  [%g3 + %i1], %g2	!! no error shd be flagged
  add %g5, %i1, %i5
  casa [%i5]0x80, %o3, %g2	!! no error shd be flagged
  add %g6, %i1, %i5
  casxa [%i5]0x80, %o4, %g1	!! no error shd be flagged
  prefetch [%g6 + %i1], 0	!! no err
  setx user_code_begin_008, %g1, %g2  !! add cycles to wait
  cmp     %i0, %l1
  bne     FAIL
  ldda  [%g5 + %i1]0xE2, %i6	!Bis ld
  jmp %g2
  mov %g0, %l1


FAIL:	EXIT_BAD
	nop


attr_data {
	Name = .My_User_Section_4v007,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA007,
	RA = MY_USER_DATA_RA007,
	PA = MY_USER_DATA_PA007,
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
	PA = MY_USER_TEXT_PA008,
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
  cmp     %i0, %l1
  bne     FAIL
  mov %g0, %i0
  mov %g0, %l1

!!ld all 4 ways of the cache, index is 40
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1

  ld [%l3+1], %g1         !cause mem_addr_not_aligned trap
				!inject error in all ways

  ! do a blk st, it shd clear all the 4 ways
  stda  %d0, [%g3 + %i1]0xF0
  stda  %d0, [%g4 + %i1]0xF8
  stda  %d0, [%g5 + %i1]0xE0
  stda  %d0, [%g6 + %i1]0xF0
  
  membar #Sync   !! wait for all the previous stores to be done
		 !! and then check all the errors are cleared
  
  ldx [%g6+%i1], %g1
  add %i1, 15, %i5 
  ldub [%g3+%i5], %g1

  cmp     %i0, %l1
  bne     FAIL
  nop
  setx user_code_begin_009, %g1, %g2  
  jmp %g2
  mov %g0, %l1


FAIL:   EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v008,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA008,
	RA = MY_USER_DATA_RA008,
	PA = MY_USER_DATA_PA008,
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
	PA = MY_USER_TEXT_PA009,
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
.text
.global user_code_begin_009
user_code_begin_009:
add %g0, 0x20, %i1    !! index is 20
!!ld all 4 ways of the cache, index is 40
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1

  ld [%l3+1], %g1         !cause mem_addr_not_aligned trap
				!inject error in all ways

  !! now do nc lds to the same addr as the cp space. Check that the
  !! err is not cleared.
  setx user_data_begin_010, %g1, %o3
  setx user_data_begin_011, %g1, %o4
  setx user_data_begin_012, %g1, %o5
  setx user_data_begin_013, %g1, %o6
  ld [%o3+%i1], %g1  !! no error shd be flagged
  ld [%o4+%i1], %g1  !! no error shd be flagged
  ld [%o5+%i1], %g1  !! no error shd be flagged
  ld [%o6+%i1], %g1  !! no error shd be flagged
  mov %g0, %l1 
  cmp     %i0, %l1
  bne     FAIL

  !! access a line with cp=0 from the same index as the faulty ld and see
  !! that the error is still reported.
  setx user_data_begin_009, %g1, %o7
  ld [%o7+%i1], %g1  !! the error shd be flagged
  add %g0, 1, %l1
  cmp     %i0, %l1
  bne     FAIL
  mov     %g0, %i0

NC_CASE_2:
!! Now again ld all the 4 ways of the cache
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1

  ld [%l3+1], %g1         !cause mem_addr_not_aligned trap
				!inject error in all ways
  
  !! now do nc stores to the same addr as the cp space. Check that the
  !! err is not cleared.
  st %g2, [%o3+%i1]
  st %g3, [%o4+%i1]
  st %g4, [%o5+%i1]
  st %g5, [%o6+%i1]
  
  mov %g0, %l1 
  cmp     %i0, %l1
  bne     FAIL
  
  !! access a line with cp=0 from the same index as the faulty ld and see
  !! that the error is still reported.
  ld [%o7+%i1], %g1  !! the error shd be flagged
  add %g0, 1, %l1
  cmp     %i0, %l1
  bne     FAIL
  mov     %g0, %i0

NC_CASE_3:
!! Now again ld all the 4 ways of the cache
  ld [%g3+%i1], %g1
  ld [%g4+%i1], %g1
  ld [%g5+%i1], %g1
  ld [%g6+%i1], %g1

  ld [%l3+1], %g1         !cause mem_addr_not_aligned trap
				!inject error in all ways
  
  !!Now do store to cp =0, err shd not be cleared
  stb %o3, [%o7+%i1]
  
  ld [%o7+%i1], %g1  !! the error shd be flagged
  add %g0, 1, %l1
  cmp     %i0, %l1
  bne     FAIL
  mov     %g0, %i0

  EXIT_GOOD
   nop


FAIL:   EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v009,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA009,
	RA = MY_USER_DATA_RA009,
	PA = MY_USER_DATA_PA009,
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
	RA = MY_USER_TEXT_PA010,
	PA = MY_USER_TEXT_PA010,
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
.text
.global user_code_begin_010
user_code_begin_010:
        cmp     %i0, %l1
        bne     FAIL
        mov     %g0, %i0
        setx user_code_begin_011, %g2, %l4
        jmp  %l4
        nop
FAIL:   EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v010,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA010,
	RA = MY_nc_DATA_RA010,
	PA = MY_nc_DATA_PA010,
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
	RA = MY_USER_TEXT_PA011,
	PA = MY_USER_TEXT_PA011,
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
        cmp     %i0, %l1
        bne     FAIL
        mov     %g0, %i0
        setx user_code_begin_012, %g2, %l4
        jmp  %l4
        nop
FAIL:   EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v011,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA011,
	RA = MY_nc_DATA_RA011,
	PA = MY_nc_DATA_PA011,
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
	RA = MY_USER_TEXT_PA012,
	PA = MY_USER_TEXT_PA012,
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
        setx user_code_begin_013, %g2, %l4
        jmp  %l4
        nop
FAIL:   EXIT_BAD
        nop

attr_data {
	Name = .My_User_Section_4v012,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA012,
	RA = MY_nc_DATA_RA012,
	PA = MY_nc_DATA_PA012,
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
	RA = MY_USER_TEXT_PA013,
	PA = MY_USER_TEXT_PA013,
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
	EXIT_GOOD
	nop

attr_data {
	Name = .My_User_Section_4v013,
	part_0_ctx_nonzero_tsb_config_1,
	VA = MY_USER_DATA_VA013,
	RA = MY_nc_DATA_RA013,
	PA = MY_nc_DATA_PA013,
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


.global DATA_ACCESS_ERROR_HANDLER
.global INST_ACCESS_ERROR_HANDLER
.global MEM_ADDR_HANDLER

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
	!!issue demap pg
	xor 	%o1, 0x1fff, %o1
	stxa    %g0, [%o1] ASI_DMMU_DEMAP
	!!disable errors
  	add %g0, CERER_VA, %g3	
  	stxa %g0, [%g3]ASI_CERER
        add %g0, 1, %i0		!
        retry
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
  !!read the four D$ entries and inject errors
  !!D$ entry 0
  sll %i3, 1, %g1
  mov %g0, %g2
  cmp %l4, 7
  bg,a .+8
  or %g0, 0x8, %g2
  and %l4, 0x7, %g3
  sll %g1, %g3, %g4
  
  setx cache_index_data, %g5, %g6

DC_ENTRY0:
  ldx [%g6], %o1
  stxa %o1, [%g0+%i1]ASI_DC_TAG
  ldx [%g6 +0x8], %o2
  add %g4, %g2, %i5
  !! inject err in way0
  cmp %l0, 0
  bz,a .+8
  stxa %o2, [%i5+%i1]ASI_DC_DATA        !! store data with parity err
  cmp %l0, 4
  bz,a .+8
  stxa %o2, [%i5+%i1]ASI_DC_DATA        !! store data with parity err

DC_ENTRY1:

  !!D$ entry 1
  ldx [%g6 + 0x10], %o1
  stxa %o1, [%i2 + %i1]ASI_DC_TAG
  ldx [%g6 + 0x18], %o2
  !! inject err in way1
  add %g4, %g2, %i5
  add %i2, %i5, %i5
  cmp %l0, 1
  bz,a .+8
  stxa %o2, [%i5+%i1]ASI_DC_DATA        !! store data with parity err
  cmp %l0, 4
  bz,a .+8
  stxa %o2, [%i5+%i1]ASI_DC_DATA        !! store data with parity err

DC_ENTRY2:

  !!D$ entry 2
  ldx [%g6 + 0x20], %o1
  stxa %o1, [%i3 + %i1]ASI_DC_TAG
  ldx [%g6 + 0x28], %o2
  add %g4, %g2, %i5
  add %i3, %i5, %i5
  !! inject err in way2
  cmp %l0, 2
  bz,a .+8
  stxa %o2, [%i5+%i1]ASI_DC_DATA        !! store data with parity err
  cmp %l0, 4
  bz,a .+8
  stxa %o2, [%i5+%i1]ASI_DC_DATA        !! store data with parity err

DC_ENTRY3:

  !!D$ entry 3
  ldx [%g6 + 0x30], %o1
  stxa %o1, [%i4 + %i1]ASI_DC_TAG
  ldx [%g6 + 0x38], %o2
  
  add %g4, %g2, %i5
  add %i4, %i5, %i5
  !! inject err in way3
  cmp %l0, 3
  bge,a .+8
  stxa %o2, [%i5+%i1]ASI_DC_DATA        !! store data with parity err
  nop
  done

HW_CORR_ERROR_HANDLER:
RD_DESR:
  ldxa [%g0]0x4c, %o1   !! read the DESR
CHL_ERRT:
  srlx %o1, 56, %o2	!! chk the err_type
  and %o2, 0x1F, %o0
  cmp %o0, DCDP_ERR_TYPE
  bne FAIL
CHK_S_M_BIT:
  srlx %o2, 5, %o2 !! chk s and M bit clear
  and %o2, 3, %o0
  cmp %o0, 0
  bne FAIL
CHK_F_BIT:
  
  srlx %o2, 2, %o0 !! chk F bit set
  cmp %o0, 1
  bne FAIL
CHK_WAY:
  srlx %i1, 4, %o0 !! get the index from i1
  and %o1, 0x3f, %o2  !! get the index
  cmp %o2, %o0
  bne FAIL
  sra %o1, 7, %o2  !! get the way
  subcc %l0, %o2, %o0   !! in case of err in all ways, way 0 is reported.
  bz .+16
  cmp %o0, %l0
  bnz FAIL
  nop
RD_DTAG0:
  mov %g0, %o2
  ldxa [%g0+%i1]ASI_DC_TAG, %o1
  and %o1, 0x3, %i6
  cmp %i6, 3
  bz,a .+8
  add %o2, 1, %o2

RD_DTAG1:
  ldxa [%i2+%i1]ASI_DC_TAG, %o1
  and %o1, 0x3, %i6
  cmp %i6, 3
  bz,a .+8
  add %o2, 1, %o2

RD_DTAG2:
  ldxa [%i3+%i1]ASI_DC_TAG, %o1
  and %o1, 0x3, %i6
  cmp %i6, 3
  bz,a .+8
  add %o2, 1, %o2

RD_DTAG3:
  ldxa [%i4+%i1]ASI_DC_TAG, %o1
  and %o1, 0x3, %i6
  cmp %i6, 3
  bz,a .+8
  add %o2, 1, %o2

  cmp %l6, %o2 	!! make sure no. of valid ways equal expected data
  bne FAIL
  add %g0, 1, %i0
  retry

INVALID_ASI_HANDLER:
        done
        nop

DAE_NFO_PG_HANDLER:
  setx cache_index_data, %g1, %g4
  sll %i3, 1, %g1
  mov %g0, %g2

 ST_WAY0:
  ldxa [%g0+%i1]ASI_DC_TAG, %o1
  sllx %o1, 1, %o1  !! move tag parity into bit 32
  srl %o1, 1, %o1   !! make upper 32 bits 0
  stx %o1, [%g4]
  add %g1, %g2, %i5
  ldxa [%i5+%i1]ASI_DC_DATA, %o2
  stx %o2, [%g4 + 0x8]

  srl %o1, 2, %o1   
  sllx %o1, 11, %o1

 ST_WAY1:
  ldxa [%i2 + %i1]ASI_DC_TAG, %o1
  sllx %o1, 1, %o1  !! move tag parity into bit 32
  srl %o1, 1, %o1   !! make upper 32 bits 0
  stx %o1, [%g4 + 0x10]
  add %g1, %g2, %i5
  add %i2, %i5, %i5
  ldxa [%i5 + %i1]ASI_DC_DATA, %o2
  stx %o2, [%g4 + 0x18]
  
  srl %o1, 2, %o1   
  sllx %o1, 11, %o1

 ST_WAY2:
  ldxa [%i3 + %i1]ASI_DC_TAG, %o1
  sllx %o1, 1, %o1  !! move tag parity into bit 32
  srl %o1, 1, %o1   !! make upper 32 bits 0
  stx %o1, [%g4 + 0x20]
  add %g1, %g2, %i5
  add %i3, %i5, %i5
  ldxa [%i5 + %i1]ASI_DC_DATA, %o2
  stx %o2, [%g4 + 0x28]
  
  srl %o1, 2, %o1   
  sllx %o1, 11, %o1

 ST_WAY3:
  ldxa [%i4 + %i1]ASI_DC_TAG, %o1
  sllx %o1, 1, %o1  !! move tag parity into bit 32
  srl %o1, 1, %o1   !! make upper 32 bits 0
  stx %o1, [%g4 + 0x30]
  add %g1, %g2, %i5
  add %i4, %i5, %i5
  ldxa [%i5 + %i1]ASI_DC_DATA, %o2
  stx %o2, [%g4 + 0x38]
  
  srl %o1, 2, %o1   
  sllx %o1, 11, %o1

  done
  nop

FAIL: EXIT_BAD
	nop

.data
.align 64
cache_index_data:
.xword 0
.xword 0
.xword 0
.xword 0
.xword 0
.xword 0
.xword 0
.xword 0
.xword 0
.xword 0
.xword 0
.xword 0
.xword 0
