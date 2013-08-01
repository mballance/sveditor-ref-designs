/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: err_fc_icdp_icl2u_diag.s
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

#define MY_USER_DATA_VA000      0x6a002000
#define MY_USER_DATA_RA000      0x6b002000
#define MY_USER_DATA_PA000      0x106b002000
#define MY_USER_DATA_VA001      0x6a004000
#define MY_USER_DATA_RA001      0x6b004000
#define MY_USER_DATA_PA001      0x106b004000
#define MY_USER_DATA_VA002      0x6a086000
#define MY_USER_DATA_RA002      0x6b086000
#define MY_USER_DATA_PA002      0x106b086000
#define MY_USER_DATA_VA003      0x6a0c8000
#define MY_USER_DATA_RA003      0x6b0c8000
#define MY_USER_DATA_PA003      0x106b0c8000
#define MY_USER_DATA_VA004      0x6a10a000
#define MY_USER_DATA_RA004      0x6b10a000
#define MY_USER_DATA_PA004      0x106b10a000
#define MY_USER_DATA_VA005      0x6a14c000
#define MY_USER_DATA_RA005      0x6b14c000
#define MY_USER_DATA_PA005      0x106b14c000
#define MY_USER_DATA_VA006      0x6a18e000
#define MY_USER_DATA_RA006      0x6b18e000
#define MY_USER_DATA_PA006      0x106b18e000
#define MY_USER_DATA_VA007      0x6a1e0000
#define MY_USER_DATA_RA007      0x6b1e0000
#define MY_USER_DATA_PA007      0x106b1e0000
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

#define  CETER_ALL    0x7000_0000_0000_0000
#define DCDP_ERR_TYPE 0x8

#define MAIN_PAGE_HV_ALSO

#define H_HT0_Data_access_error_0x32 DATA_ACCESS_ERROR_HANDLER
#define H_HT0_Instruction_access_error_0x0a INST_ACCESS_ERROR_HANDLER

#define H_HT0_Hw_Corrected_Error_0x63
#define SUN_H_HT0_Hw_Corrected_Error_0x63 \
        ba HW_CORR_ERROR_HANDLER; \
        nop;nop;nop;nop;nop;nop;nop

#include "hboot.s"

/************************************************************************
   Test case:	
 ************************************************************************/
#define  TEST_DATA0         0x5555555555555555
#define  TEST_DATA1         0x1122334455667788
#define  TEST_DATA2         0xaabbccddeeff0011
#define  TEST_DATA3         0x123456789abcdeff
#define  TEST_DATA4         0xff123456789abcde
#define  TEST_DATA5         0x1f2f3f4e5d6a7b8c
#define  TEST_DATA6         0xe1d2f3b5a8e3a8a9
#define  TEST_DATA7         0x1a2b3c4d5e6f2346
#define  ALL_F         	   0Xffffffffffffffff

.text
.global main

main:		/* test begin */
 ta    T_CHANGE_HPRIV
 mov 1, %o2
 sllx %o2, 54, %o2	!! enable icl2u
 mov 1, %g1
 sllx %g1, 15, %g1   !! enable ICDP
 or %g1, %o2, %o2

  add %g0, CERER_VA, %g3     
  stxa %o2, [%g3]ASI_CERER

  !! set CETER.all
  !mov 7, %o2
  !sllx %o2, 60, %o2
  !add %g0, CETER_VA, %g3
  !stxa %o2, [%g3]ASI_CETER

  !! Put Icache in direct mapped mode
  !add %g0, 0x10, %g1
  !or %g0, 0x2, %g2
  !stxa %g2, [%g1]ASI_DIAG

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

!! put l2$ banks in direct mapped mode
l2cache_dm:
  mov 0xa9, %g1
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
  
setx 0x3ffff8, %g1, %l3		!! mask to capture the lower 22 bits of the PA
  mov 8, %l4			!! no. of iterations for each thread

  !!ta    T_CHANGE_NONHPRIV

disable_ic:
  ldxa [%g0]0x45, %g1   !! read lsu_control reg
  xor %g1, 1, %g1   !! turn off I$
  stxa %g1, [%g0]0x45

  setx user_code_begin_000, %g1, %l1
  jmpl  %l1, %l2     !! jmp to get the I$ line in L2c
  nop

diag_read_l2:
  mov 0xa0, %g2
  sllx %g2, 32, %g2
  and %l3, %l1, %g1
  add %g2, %g1, %g2
  !!read all the words
word0:
  ldx [%g2], %g5
  srlx %g5, 7, %g5
  mov 1, %g6
  sllx %g6, 22, %g6
  or %g6, %g2, %g2
word1:
  ldx [%g2], %g5
  srlx %g5, 7, %g5
  or %g2, 8, %g2 
word3:
  ldx [%g2], %g5
  srlx %g5, 7, %g5
  xor %g2, %g6, %g2
word2:
  ldx [%g2], %g5
inj_ue_th0:
  xor %g5, 0x5, %g5
  stx %g5, [%g2]  
  membar #Sync

! Enable I$
enable_ic:
  ldxa [%g0]0x45, %g1   !! read lsu_control reg
  xor %g1, 1, %g1   !! turn on I$
  stxa %g1, [%g0]0x45

!! no err reporting as ceter bits are 0.
ld_err_in_ic:
  jmpl  %l1, %l2     !! jmp to get the I$ line in IFU with err
  nop
!! turn on ceter.
turn_on_ceter:

  mov 7, %o2
  sllx %o2, 60, %o2
  add %g0, CETER_VA, %g3
  stxa %o2, [%g3]ASI_CETER
  !!add %l1, 0x20, %l4
  
  jmpl  %l1+28, %l2     !! jmp to get the err
  nop

  nop
  EXIT_BAD

FAIL:
        EXIT_BAD
        nop


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
.text
.global user_code_begin_000
user_code_begin_000:
  jmpl %l2+8, %g0
  nop
  nop
  nop
  nop
  nop
  nop
  nop
! chk both data_acc_err and hw_corr_err traps are taken
brz %i0, FAIL
brz %i1, FAIL
nop
EXIT_GOOD

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
.xword 0x0f59d0e1ac35dbd4

.xword 0x90775b99929f43cc
.xword 0x9fac4ae85a4ecd4e
.xword 0x12e763fbd8e2970d
.xword 0x7320217fab3eae0e
.xword 0x38683cebedefb5af


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
	stxa %g0, [%g5]ASI_DSFSR
        add %g0, 1, %i0		!
        done
	nop

INST_ACCESS_ERROR_HANDLER:
        add     %g0, SFSR_VA, %g5               !
        ldxa  [%g5]ASI_ISFSR, %o1     !
        !!cmp   %o1, 0x1  
        !!bne   FAIL
        stxa    %g0, [%g5]ASI_ISFSR
        add %g0, 1, %i0         !
	!!wrpr %l4, %tpc
	!!add %l4, 4, %g1
	!!wrpr %g1, %tnpc
        done
MEM_ADDR_HANDLER:
  nop
  done

HW_CORR_ERROR_HANDLER:
RD_DESR:
  ldxa [%g0]0x4c, %o1   !! read the DESR
  mov 1, %i1
  done
  nop

INVALID_ASI_HANDLER:
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


