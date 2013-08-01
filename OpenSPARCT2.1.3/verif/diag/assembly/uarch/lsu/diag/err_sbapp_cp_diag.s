/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: err_sbapp_cp_diag.s
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

#define MY_USER_DATA_VA000      0x6a000000
#define MY_nc_DATA_RA000      0xb06b000000
#define MY_nc_DATA_PA000      0xc06b000000
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
#define  ASI_DECR               0x45
#define  DECR_VA                0x8
    
#define  CERER_SBDPC            0x400
#define  CETER_DHCCE    0x1000000000000000
#define  CETER_DE       0x2000000000000000
#define  CETER_PSCCE    0x4000000000000000
#define  DCVP_ERR_TYPE   0x5
#define  SBDPC_ERR_TYPE   0x5
#define  SBDPU_ERR_TYPE   0x6
#define  HPRIV   0x2
#define  PRIV   0x1
#define  USER   0x0

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

!! turn on/off ceter.de
!! i4 =1 . turn on ceter.de
!! l4 =0 . turn off ceter.e
#define H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define My_HT0_Lddf_Mem_Address_Not_Aligned_0x35 \
  	setx CETER_DE, %g2, %g1;\
  	add %g0, CETER_VA, %g3; \
	cmp %i4, 1;  \
	be,a .+12;  \
  	stxa %g1, [%g3]ASI_CETER; \
  	stxa %g0, [%g3]ASI_CETER; \
        done

#define  H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define My_HT0_Stdf_Mem_Address_Not_Aligned_0x36 \
        set STAU_ERR_EN,  %g1;\
        cmp %i3, 1;  \
        be,a .+12;  \
        stxa %g1, [%g0]ASI_ERR_INJ ;\
        stxa %g0, [%g0]ASI_ERR_INJ ;\
        done

#define H_HT0_Sw_Recoverable_Error_0x40
#define SUN_H_HT0_Sw_Recoverable_Error_0x40 \
        ba RECOVERABLE_ERR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

#define H_HT0_Store_Error_0x07
#define SUN_H_HT0_Store_Error_0x07 \
        ba STORE_ERR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop
	

#include "hboot.s"

/************************************************************************
   Test case:	
 ************************************************************************/

.text
.global main

main:		/* test begin */
  ta    T_CHANGE_HPRIV

  ! store 1 to DECR
  setx 0x1111111111111111, %o1, %o2
  setx DECR_VA, %o1, %o3
  stxa %o2, [%o3]ASI_DECR
    
  !! set CERER.SBAPP
  set 0x0800000,  %o2   !! enable sbapp errs
  add %g0, CERER_VA, %g3        !!g3 has cerer va


  stxa %o2, [%g3]ASI_CERER
  ta T_CHANGE_NONHPRIV

  mov %g0, %o6	!! start with user mode
  add %g0, USER, %l4
  setx user_code_begin_000, %g2, %g3
  !setx HPRIV_MODE, %g2, %g3
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
.global HPRIV_MODE
user_code_begin_000:
  setx user_data_begin_000, %g1, %g2
  setx original_data, %g1, %g3
  setx st_address, %g1, %g4
  setx st_address_1, %g1, %g5
user_code_begin_hp:  
  mov %g0, %l2  !! stb expected index is in l2
  add %g0, 0x5, %l3  !! mask
  add %g0, 1, %l1
  add %g0, 1, %i3  !! enable err_injection
  
  std %d0, [%g2 + 0x4]  !stdf_not_aligned  to set err_inject
  ldxa [%g2]0xE4, %g1  !! invalid asi trap to set the stb ptr to 0

  add %g0, 1, %g6	!! start with 1 entries in stb

LOOP0_000:
        ldx [%g4], %i1
        ldx [%g2 + 0x8], %i2
        ldx [%g2 + 0x10], %i3
        ldx [%g2 + 0x18], %i4
        ldx [%g2 + 0x20], %i5
        ldx [%g2 + 0x28], %i6
        ldx [%g2 + 0x30], %i7
        ldx [%g2 + 0x38], %l1

  cmp %g6, 1
  be STORES_1
  cmp %g6, 2
  be STORES_2
  cmp %g6, 3
  be STORES_3
  cmp %g6, 4
  be STORES_4
  cmp %g6, 5
  be STORES_5
  cmp %g6, 6
  be STORES_6
  cmp %g6, 7
  be STORES_7
  nop
STORES_8:
  stx %l1, [%g4 + 0x38]
STORES_7:
  stx %i7, [%g4 + 0x30]
STORES_6:
  stx %i6, [%g4 + 0x28]
STORES_5:
  stx %i5, [%g4 + 0x20]
STORES_4:
  stx %i4, [%g4 + 0x18]
STORES_3:
  stx %i3, [%g4 + 0x10]
STORES_2:
  stx %i2, [%g4 + 0x8]
STORES_1:
  !!stx %i1, [%g4]
  casa [%g4]0x80, %i1, %l1

  ldx [%g2 + 0x8], %g7
  ldub [%g2], %g7
  ldub [%g2 + 0x1], %g7
  ld [%g2 + 0x4], %g7
  ldx [%g2], %g7
  ldx [%g2 + 0x8], %g7
  ldub [%g2], %g7
  brz %i0, FAIL
  mov %g0, %i0

CHK_STORE_FLUSHED:
  cmp %g6, 1
  be FLUSH_LD_1
  cmp %g6, 2
  be FLUSH_LD_2
  cmp %g6, 3
  be FLUSH_LD_3
  cmp %g6, 4
  be FLUSH_LD_4
  cmp %g6, 5
  be FLUSH_LD_5
  cmp %g6, 6
  be FLUSH_LD_6
  cmp %g6, 7
  be FLUSH_LD_7
  nop
FLUSH_LD_8:
  ldx [%g4 + 0x38], %o4
  ldx [%g3 + 0x38], %o5
  cmp %o4, %o5
  bne FAIL
FLUSH_LD_7:
  ldx [%g4 + 0x30], %o4
  ldx [%g3 + 0x30], %o5
  cmp %o4, %o5
  bne FAIL
FLUSH_LD_6:
  ldx [%g4 + 0x28], %o4
  ldx [%g3 + 0x28], %o5
  cmp %o4, %o5
  bne FAIL
FLUSH_LD_5:
  ldx [%g4 + 0x20], %o4
  ldx [%g3 + 0x20], %o5
  cmp %o4, %o5
  bne FAIL
FLUSH_LD_4:
  ldx [%g4 + 0x18], %o4
  ldx [%g3 + 0x18], %o5
  cmp %o4, %o5
  bne FAIL
FLUSH_LD_3:
  ldx [%g4 + 0x10], %o4
  ldx [%g3 + 0x10], %o5
  cmp %o4, %o5
  bne FAIL
FLUSH_LD_2:
  ldx [%g4 + 0x8], %o4
  ldx [%g3 + 0x8], %o5
  cmp %o4, %o5
  bne FAIL
FLUSH_LD_1:
  ldx [%g4], %o4
  ldx [%g3], %o5
  cmp %o4, %o5
  bne FAIL

  add %g2, 0x10, %g2
  add %g3, 0x10, %g3
  add %g4, 0x10, %g4
  add %g5, 0x10, %g5
  add %l2, %g6, %l2	!!the stb entry in which data will be stored next
  add %l2, 2, %l2	!! three stores, turn off and on err_inject
  and %l2, 0x7, %l2
  add %g0, 1, %i3  !! enable err_injection
  add %g6, 1, %g6
  cmp %g6, 8
  ble,a  LOOP0_000
  std %d0, [%g2 + 0x4]  !Turn on err_inject, err_injection turned off
			!by trap hanlder

  add %o6, 1, %o6
  cmp %o6, 1
  be PRIV_MODE
  cmp %o6, 2
  be,a HPRIV_MODE
  ta T_CHANGE_NONPRIV

  ba NEXT_CASE
  ta    T_CHANGE_NONHPRIV

PRIV_MODE:
  ta    T_CHANGE_PRIV
  ba  user_code_begin_000
  add %g0, PRIV, %l4

!! For hp mode load vas which pt to nc range.
HPRIV_MODE:
  ta    T_CHANGE_HPRIV
	
  ! store 2 to DECR
  setx 0x2222222222222222, %g1, %g2
  setx DECR_VA, %g1, %g3
  stxa %g2, [%g3]ASI_DECR
    
  setx user_data_begin_003, %g1, %g2
  setx original_data_hp, %g1, %g3
  setx st_address_hp, %g1, %g4
  setx st_address_1_hp, %g1, %g5
  ba  user_code_begin_hp
  add %g0, HPRIV, %l4

NEXT_CASE:
  setx user_code_begin_001, %g2, %g3
  jmp  %g3
  nop

FAIL:
	ta 0xa1
	nop

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
attr_data {
NAME = .My_User_Section_4v000,
  hypervisor
}
.data
.global user_data_begin_000
user_data_begin_000:
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
.xword 0x4be2f60911e465ce
.xword 0x4e22352a0c29c95c
.xword 0xf18efdf01ce79e24
original_data:	!! copy of the data at the st_address location. St location
!! shd not be overwritten
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

st_address:
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
st_address_1:
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
.xword 0x38683cebedefb5af
.xword 0xefc4e1f1b35853fc
.xword 0xe790a0c1689eb683
.xword 0x88c650f170c41710
.xword 0xed9efe0d05896ce1
.xword 0xf9d45b94972117c8
.xword 0xd0c647618c9e43f3
.xword 0xfe04ead3b77c2d11


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
! Check, uncorrectable errors are detected for blk stores also.

.text
.global user_code_begin_001
user_code_begin_001:
  add %g0, USER, %l4
  mov %g0, %l2  !! In case of address parity the addr parity err is reported when
		!! the blk store is written in the STB.
  add %g0, 0x30, %l3	!! double bit err
  setx user_data_begin_001, %g1, %g2

  setx original_data, %g1, %g3
  setx st_address, %g1, %g4
  mov %g0, %i0
  mov %g0, %l1
 
  add %g0, 1, %i3  !! Enable err_injection
  std %d0, [%g2 + 0x4]  
  ldxa [%g2]0xE4, %g1  !! invalid asi trap to set to stb ptr to 0
  !ldda [%g2]0xf0, %d0
  ldx [%g4], %i1
  ldd [%g2], %f0
  ldd [%g2 + 0x8], %f2
  ldd [%g2 + 0x10], %f4
  ldd [%g2 + 0x18], %f6
  ldd [%g2 + 0x20], %f8
  ldd [%g2 + 0x28], %f10
  ldd [%g2 + 0x30], %f12
  ldd [%g2 + 0x38], %f14

	stda %d0, [%g4]0xF0
        ldx [%g2], %i1
        ldx [%g2 + 0x8], %i2
        ldx [%g2 + 0x10], %i3
        ldx [%g2 + 0x18], %i4
        ldx [%g2 + 0x20], %i5
        ldx [%g2 + 0x28], %i6
        ldx [%g2 + 0x30], %i7
        ldx [%g2 + 0x38], %l1
        cmp %i0, 1
        bne FAIL
	mov %g0, %i0

CASE1_000:
	ldx [%g3 + %i0], %o4
	ldx [%g4 + %i0], %o5
  	cmp %o4, %o5
  	bne FAIL
	add %i0, 8, %i0
 	cmp %i0, 0x38	
	ble CASE1_000
	nop

  setx user_code_begin_002, %g2, %g3
  jmp  %g3
  nop
FAIL:
	ta 0xa1
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
st_address:
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
original_data:
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

! Chk that asi writes are squashed too in case of uncorrectable errors.
! The testcase runs in a loop and in each iteration the stb pts to next entry.
! 6 asi stores are squashed.
! For first iteration, stb pts to entry 0. 6 asi stores are written that move the ptr to 5. 
! Trap is taken. 2 stores occur in trap handler:1st to disable err
!  injection and 2nd to clear dsfsr. That moves the stb ptr to 0. The test case then
! uses 1 stb entry to enable err injection. Which moves teh ptr to 1 for 
! next iteration of loop. So, 9 stores happen in each iteration which move the stb ptr
! to next entry for each iteration.
! the loop runs for 8 iterations correpsonding to stb entry 0,1,2,3, 4...to 7.
! So the testcase checks that squashing can occur from every entry in STB.
! The test runs in HP mode too.

.text
.global user_code_begin_002
user_code_begin_002:
  ta    T_CHANGE_PRIV
  mov %g0, %o6 !! priv mode
  add %g0, PRIV, %l4
  setx user_data_begin_000, %g1, %g2

!! Init the scratchpad array
  mov %g0, %i0
ST_LOOP_2:
  ldx [%g2 + %i0], %i1
  stxa %i1, [%i0]0x20
  add %i0, 8, %i0
  cmp %i0, 0x20
  be,a ST_LOOP_2
  add %g0, 0x30, %i0
  cmp %i0, 0x38
  ble ST_LOOP_2
  nop

NEXT_MODE:
	setx new_data, %g1, %g3
	setx new_store_loc, %g1, %g4
        add %g0, 0x6, %l3  !! mask
        mov %g0, %l2
	add %g0, 1, %i3  !! enable err_injection
	std %d0, [%g2 + 0x4]  !stdf_not_aligned  to set err_inject
	ldxa [%g4]0xE4, %g1  !! invalid asi trap to set the stb ptr to 0
	mov %g0, %i0

START_ASI_LOOP:
	mov %g0, %l0
	add %g0, 8, %i2
	add %g0, 0x10, %i3
	add %g0, 0x18, %i4
	add %g0, 0x30, %i5
	add %g0, 0x38, %i6

	!!now do 6 asi stores. These will have err injected
  	stxa %i1, [%l0]0x20
  	stxa %i1, [%i2]0x20
  	stxa %i1, [%i3]0x20
  	stxa %i1, [%i4]0x20
  	stxa %i1, [%i5]0x20
  	stxa %i1, [%i6]0x20

        ldx [%g3 + 0x8], %i2
        ldx [%g3 + 0x10], %i3
        ldx [%g3 + 0x18], %i4
        ldx [%g3 + 0x20], %i5
	brz %i0, FAIL
	nop

	!! Chk that the stores were squashed
	mov %g0, %i0
LD_LOOP_2:
  ldx [%g2 + %i0], %o4
  ldxa [%i0]0x20, %o5
  cmp %o4, %o5
  bne FAIL
  add %i0, 8, %i0
  cmp %i0, 0x20
  be,a LD_LOOP_2
  add %g0, 0x30, %i0
  cmp %i0, 0x38
  ble LD_LOOP_2
  nop
/*
!! now do 5 stores
!! 5 stores are required to advance the ptr from 0 to 1 and so on.
  mov %g0, %i0
DST_LOOP_2:
  ldx [%g3 + %i0], %i1
  stx %i1, [%g4 + %i0]
  add %i0,8, %i0
  cmp %i0, 0x28
  bl  DST_LOOP_2
  nop

!! now chk that these stores were not squashed
  mov %g0, %i0
DLD_LOOP_2:
  ldx [%g3 + %i0], %o4
  ldx [%g4 + %i0], %o5
  cmp %o4, %o5
  bne FAIL
  add %i0,8, %i0
  cmp %i0, 0x28
  bl  DLD_LOOP_2
  nop

*/
!! enable err injection.
  add %g3, 0x10, %g3
  add %g4, 0x10, %g4
  add %g0, 1, %i3  !! enable err_injection
  !! do a dummy store to advance store ptr.
  !! since the store_error handler no longer has a wr to to clear the dsfsr, I had
  !!to add a dummy store here to make the diag work
  stx %g2, [%g2+0x200]
  add %l2, 1, %l2
  cmp %l2, 8
  bl,a START_ASI_LOOP
  std %d0, [%g2 + 0x4]  !stdf_not_aligned  to set err_inject

  brnz %o6, DONE
  add %o6, 1, %o6

  ta    T_CHANGE_HPRIV
	
  ! store 3 to DECR
  setx 0x3333333333333333, %g6, %g7
  setx DECR_VA, %g6, %g6
  stxa %g7, [%g6]ASI_DECR
    
  ba NEXT_MODE
  add %g0, HPRIV, %l4


DONE:
  setx user_code_begin_003, %g2, %g3
  jmp  %g3
  nop

FAIL:
	ta 0xa1
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
.xword 0x050a211e918857f3
.xword 0x7980bbbf09b95bba
.xword 0x55f410e2b57433f6
.xword 0x106c3aa95e2aa3c3
.xword 0xbcb980bc1bb072d8
.xword 0x63da435c10b717dd
.xword 0x375d99be87bef073
.xword 0x03a5206ac6d08fd2
new_data:
.xword 0xfa474991f13e3460
.xword 0x1446415baecf3609
.xword 0xe3215e901114ad4b
.xword 0xf91d897e92d1ee95
.xword 0x33458a48805d888b
.xword 0x7f5a3ddb7d8e3c23
.xword 0xaa80311fb1e17e79
.xword 0x0f59d0e1ac35dbd4
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

new_store_loc:
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
	.word 0xdfaa
	.word 0x39a9

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
! same as case 2 uses hp stores.
.text
.global user_code_begin_003
user_code_begin_003:
  ta T_CHANGE_NONHPRIV
  ta    T_CHANGE_PRIV
  add %g0, PRIV, %l4
  mov %g0, %l2
  add %g0, 0x30, %l3	!! double bit err
  setx user_data_begin_003, %g1, %g2
  mov %g0, %o6

hpriv_003:
  mov %g0, %i0
  mov %g0, %l1
 
  add %g0, 1, %i3  !! Enable err_injection
  std %d0, [%g2 + 0x4]  
  ldxa [%g2]0xE4, %g1  !! invalid asi trap to set to stb ptr to 0

  ldx [%g2], %i2


  std %l4, [%g2]
        ldx [%g2 + 0x10], %i3
        ldx [%g2 + 0x18], %i4
        ldx [%g2 + 0x20], %i5
        ldx [%g2 + 0x28], %i6
        ldx [%g2 + 0x30], %i7
        ldx [%g2 + 0x38], %l1
        cmp %i0, 1
        bne FAIL
	mov %g0, %i0
  ldx [%g2], %i1
  cmp %i1, %i2
  bne FAIL
  nop

  brnz %o6, DONE_004
  add %o6, 1, %o6

  ta    T_CHANGE_HPRIV
  setx st_address_hp, %g1, %g2
	
  ba hpriv_003
  add %g0, HPRIV, %l4


DONE_004:
  setx user_code_begin_004, %g2, %g3
  jmp  %g3
  nop

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
.global original_data_hp
.global st_address_hp
.global st_address_1_hp
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
original_data_hp:	!! copy of the data at the st_address location. St location
!! shd not be overwritten
.xword 0x234c366110eddd38
.xword 0xa80656d4288044bc
.xword 0x12e763fbd8e2970d
.xword 0x7320217fab3eae0e
.xword 0x38683cebedefb5af
.xword 0xefc4e1f1b35853fc
.xword 0xe790a0c1689eb683
.xword 0x88c650f170c41710
.xword 0x614126cf9fc8dca3
.xword 0xe0066361bd9fcb86
.xword 0xea22901c101f6f52
.xword 0x806faa2171350467
.xword 0xff54f2cd06a0d342
.xword 0x566bff718cddb905
.xword 0x6d367bc4d165d37a
.xword 0x5efc42b18f920522
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
st_address_hp:
.xword 0x234c366110eddd38
.xword 0xa80656d4288044bc
.xword 0x12e763fbd8e2970d
.xword 0x7320217fab3eae0e
.xword 0x38683cebedefb5af
.xword 0xefc4e1f1b35853fc
.xword 0xe790a0c1689eb683
.xword 0x88c650f170c41710
.xword 0x614126cf9fc8dca3
.xword 0xe0066361bd9fcb86
.xword 0xea22901c101f6f52
.xword 0x806faa2171350467
.xword 0xff54f2cd06a0d342
.xword 0x566bff718cddb905
.xword 0x6d367bc4d165d37a
.xword 0x5efc42b18f920522
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
st_address_1_hp:
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
  ta T_CHANGE_NONHPRIV
  ta    T_CHANGE_PRIV
  add %g0, PRIV, %l4
  mov %g0, %l2
  add %g0, 0x30, %l3	!! double bit err
  setx user_data_begin_004, %g1, %g2
  mov %g0, %o6

hpriv_004:
  mov %g0, %i0
  mov %g0, %l1
 
  add %g0, 1, %i3  !! Enable err_injection
  std %d0, [%g2 + 0x4]  
  ldxa [%g2]0xE4, %g1  !! invalid asi trap to set to stb ptr to 0

  ldx [%g2], %i2


  swap [%g2], %l3
        ldx [%g2 + 0x10], %i3
        ldx [%g2 + 0x18], %i4
        ldx [%g2 + 0x20], %i5
        ldx [%g2 + 0x28], %i6
        ldx [%g2 + 0x30], %i7
        ldx [%g2 + 0x38], %l1
        cmp %i0, 1
        bne FAIL
	mov %g0, %i0
  ldx [%g2], %i1
  cmp %i1, %i2
  bne FAIL
  nop

  brnz %o6, DONE_005
  add %o6, 1, %o6

  ta    T_CHANGE_HPRIV
  setx st_address_hp, %g1, %g2
	
  ba hpriv_004
  add %g0, HPRIV, %l4


DONE_005:

  setx user_code_begin_005, %g2, %g3
  jmp  %g3
  nop

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
.global store_ecc_data
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
store_ecc_data:
.xword 0xff54f2cd06a0d342
.xword 0x566bff718cddb905
.xword 0x6d367bc4d165d37a
.xword 0x5efc42b18f920522
.xword 0x584c92dec4bc66de
.xword 0xe0066361bd9fcb86
.xword 0xea22901c101f6f52
.xword 0x806faa2171350467
.xword 0x566bff718cddb905
.xword 0x6d367bc4d165d37a
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

!! inject error into all the scratchpad entries.
.text
.global user_code_begin_005
user_code_begin_005:
  ta T_CHANGE_NONHPRIV
  ta    T_CHANGE_PRIV
  add %g0, PRIV, %l4
  mov %g0, %l2
  add %g0, 0x30, %l3	!! double bit err
  setx user_data_begin_005, %g1, %g2
  mov %g0, %o6

hpriv_005:
  mov %g0, %i0
  mov %g0, %l1
 
  add %g0, 1, %i3  !! Enable err_injection
  std %d0, [%g2 + 0x4]  
  ldxa [%g2]0xE4, %g1  !! invalid asi trap to set to stb ptr to 0

  ldx [%g2], %i2


  ldstub [%g2], %l3
        ldx [%g2 + 0x10], %i3
        ldx [%g2 + 0x18], %i4
        ldx [%g2 + 0x20], %i5
        ldx [%g2 + 0x28], %i6
        ldx [%g2 + 0x30], %i7
        ldx [%g2 + 0x38], %l1
        cmp %i0, 1
        bne FAIL
	mov %g0, %i0
  ldx [%g2], %i1
  cmp %i1, %i2
  bne FAIL
  nop

  brnz %o6, DONE_006
  add %o6, 1, %o6

  ta    T_CHANGE_HPRIV
  setx st_address_hp, %g1, %g2
	
  ba hpriv_005
  add %g0, HPRIV, %l4


DONE_006:
 EXIT_GOOD
 nop

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


.global DATA_ACCESS_ERROR_HANDLER
.global INST_ACCESS_ERROR_HANDLER
.global MEM_ADDR_HANDLER
.global RECOVERABLE_ERR_HANDLER
.global STORE_ERR_HANDLER

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
 done
 nop

HW_CORR_ERROR_HANDLER:
  ldxa [%g0]0x4c, %g1   !! read the DESR
  ldxa [%g0]0x4c, %g2   !! g2 shd be 0.
  retry
  nop

INVALID_ASI_HANDLER:
  set STAU_ERR_EN,  %g1
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
  ldxa [%g0]0x4c, %g1   !! read the DESR
  ldxa [%g0]0x4c, %g2   !! g2 shd be 0.
CHK_ERRT:
  srlx %g1, 56, %g2     !! chk the err_type
  and %g2, 0x1F, %g3
  cmp %g3, SBDPU_ERR_TYPE
  bne FAIL
CHK_S_BIT:
  srlx %g2, 5, %g2 !! chk s bit
  and %g2, 1, %g3
  cmp %g3, 1
  bne FAIL
CHK_M_BIT:
  srlx %g2, 1, %g2 !! chk M bit bit
  and %g2, 1, %g3
  cmp %o7, %g3
  bne FAIL
CHK_F_BIT:
  srlx %g2, 1, %g3 !! chk F bit set
  cmp %g3, 1
  bne FAIL
CHK_WAY:
  and %g1, 0x7, %g2  !! SB index
  cmp %g2, %l2
  bne FAIL
	
 sllx %g2, 3, %g3	!! g3 has the addr to read data
 or %g3, 0x40, %g4	!! g4 has the addr to read ecc
 or %g3, 0xC0, %g5	!! g5 has the addr to diag read stb pa

 CMP_DATA:
 ldxa [%g3]ASI_STB_ACCESS, %g6
 cmp %g6, %o5
 bne FAIL

 CMP_ECC:
 ldxa [%g4]ASI_STB_ACCESS, %g6  !! ecc data
 brz %o6, CMP_PA	!! lsu flips the ecc for upper 32 bits only.
 srlx %g6, 7, %g7
 srlx %o3, 7, %o3
 xor %o3, %l3, %g1 	!! o3 has the ecc withour err, l3 has the mask.
 cmp %g1, %g7
 bne FAIL

 CMP_PA:
 ldxa [%g5]ASI_STB_ACCESS, %g6  !! pa  
 srlx %g6, 40, %g7
 cmp %g7, %l7   	!! cmp asi, byte mask 
 bne FAIL
 sllx %g6, 24, %g6	!! shift the mask
 srlx %g6, 24, %g6
 cmp %g6, %l5
 bne FAIL
 CMP_PRIV:
 or %g3, 0x80, %g7	!! g7 has the addr for the control read
 ldxa [%g7]ASI_STB_ACCESS, %g6  !! chk priv
 and %g6, 0x7, %g6
 cmp %g6, %i6  
 bne FAIL
 add %g0, 1, %i0

  retry

STORE_ERR_HANDLER:
  add %g0, 0x8, %g1
  ldxa [%g1]0x4c, %g2   !! read the DFESR
  !!reading dfesr clears it now
  ldxa [%g1]0x4c, %g3   !! read the DFESR
  brnz %g3, FAIL
  nop
CHK_INDEX:
  srlx %g2, 55, %g2  
  and %g2, 0x7, %g3
  cmp %g3, %l2
  bne FAIL
CHK_PRIV:
  srlx %g2, 3, %g2  
  and %g2, 0x3, %g3
  cmp %g3, %l4
  bne FAIL
CHK_ERR_TYPE:
  srlx %g2, 3, %g2 
  and %g2, 3, %g3
  cmp %g3, 0x1	!!SBAPP
  bne FAIL

  add %i0, 1, %i0

TURN_OFF_ERR_INJECT:
  stxa %g0, [%g0]ASI_ERR_INJ
  retry

FAIL: ta 0xa1
	nop

.data










