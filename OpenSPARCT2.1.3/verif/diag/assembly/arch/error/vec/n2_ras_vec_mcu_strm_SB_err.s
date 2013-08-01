/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ras_vec_mcu_strm_SB_err.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define  TEST_DATA1         0x2000200081c3e008

#ifdef MCU0
#define L2_BANK_ADDR        0x0       
#define MCU_BANK_ADDR       0x0
#define  DRAM_ERR_INJ_REG   0x8400000290
#define  DRAM_ERR_STAT_REG  0x8400000280
#define	 DRAM_ERR_ADDR_REG  0x8400000288
#define	 DRAM_SCRB_FREQ_REG 0x8400000018
#define	 DRAM_SCRB_ENB_REG  0x8400000040
#define	 L2_ERR_STAT_REG    0xAB00000000

#define DRAM_FBR_CNT_REG_PA		DRAM_FBR_CNT_REG_PA_0
#define DRAM_ERR_CNT_REG_PA		DRAM_ERR_CNT_REG_PA_0

#define DRAM_FBD_ERR_SYND_REG_PA	DRAM_FBD_ERR_SYND_REG_PA_0
#define DRAM_FBD_INJ_ERR_SRC_REG_PA	DRAM_FBD_INJ_ERR_SRC_REG_PA_0

#define ERROR_ADDR	0x22000000 
#define WB_ADDR		0x24000000
#define FILL_ADDR	0x26000000
#endif

#ifdef MCU1
#define L2_BANK_ADDR        0x80
#define MCU_BANK_ADDR       0x80
#define  DRAM_ERR_INJ_REG   0x8400001290
#define  DRAM_ERR_STAT_REG  0x8400001280
#define  DRAM_ERR_ADDR_REG  0x8400001288
#define	 DRAM_SCRB_FREQ_REG 0x8400001018
#define	 DRAM_SCRB_ENB_REG  0x8400001040
#define  L2_ERR_STAT_REG    0xAB00000080
#define DRAM_FBR_CNT_REG_PA		DRAM_FBR_CNT_REG_PA_1
#define DRAM_ERR_CNT_REG_PA		DRAM_ERR_CNT_REG_PA_1

#define DRAM_FBD_ERR_SYND_REG_PA	DRAM_FBD_ERR_SYND_REG_PA_1
#define DRAM_FBD_INJ_ERR_SRC_REG_PA	DRAM_FBD_INJ_ERR_SRC_REG_PA_1


#define ERROR_ADDR	0x22000080 
#define WB_ADDR		0x24000080
#define FILL_ADDR	0x26000080
#endif

#ifdef MCU2
#define L2_BANK_ADDR        0x100
#define MCU_BANK_ADDR       0x100
#define  DRAM_ERR_INJ_REG   0x8400002290
#define  DRAM_ERR_STAT_REG  0x8400002280
#define  DRAM_ERR_ADDR_REG  0x8400002288
#define  DRAM_SCRB_FREQ_REG 0x8400002018
#define  DRAM_SCRB_ENB_REG  0x8400002040
#define  L2_ERR_STAT_REG    0xAB00000100

#define DRAM_FBR_CNT_REG_PA		DRAM_FBR_CNT_REG_PA_2
#define DRAM_ERR_CNT_REG_PA		DRAM_ERR_CNT_REG_PA_2

#define DRAM_FBD_ERR_SYND_REG_PA	DRAM_FBD_ERR_SYND_REG_PA_2
#define DRAM_FBD_INJ_ERR_SRC_REG_PA	DRAM_FBD_INJ_ERR_SRC_REG_PA_2


#define ERROR_ADDR	0x22000100 
#define WB_ADDR		0x24000100
#define FILL_ADDR	0x26000100
#endif

#ifdef MCU3
#define L2_BANK_ADDR        0x180
#define MCU_BANK_ADDR       0x180
#define  DRAM_ERR_INJ_REG   0x8400003290
#define  DRAM_ERR_STAT_REG  0x8400003280
#define  DRAM_ERR_ADDR_REG  0x8400003288
#define  DRAM_SCRB_FREQ_REG 0x8400003018
#define  DRAM_SCRB_ENB_REG  0x8400003040
#define  L2_ERR_STAT_REG    0xAB00000180
#define DRAM_FBR_CNT_REG_PA		DRAM_FBR_CNT_REG_PA_3
#define DRAM_ERR_CNT_REG_PA		DRAM_ERR_CNT_REG_PA_3

#define DRAM_FBD_ERR_SYND_REG_PA	DRAM_FBD_ERR_SYND_REG_PA_3
#define DRAM_FBD_INJ_ERR_SRC_REG_PA	DRAM_FBD_INJ_ERR_SRC_REG_PA_3


#define ERROR_ADDR	0x22000180 
#define WB_ADDR		0x24000180
#define FILL_ADDR	0x26000180
#endif


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


.text
.global  main


main:
  ta T_CHANGE_HPRIV
  clr	%o0
  clr	%o1

get_th_id_o0:
	ta	T_RD_THID

	cmp	%o1, 0 
	be	main_th_0
	nop

	cmp	%o1, 1 
	be	main_th_1
	nop

main_th_0:
nop

disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL



! MSA 01/04/07: Set Continuous error Injection
set_DRAM_error_inject_ch0:
  mov	0x2, %l1		! ECC Mask (1-bit error)
!  mov	 0x1, %l2
!  sllx	 %l2, DRAM_EI_SSHOT, %l3
!  Or	 %l1, %l3, %l1
  mov	0x1, %l2
  sllx	%l2, DRAM_EI_ENB, %l3
  or	%l1, %l3, %l1		! Enable error injection for the next write
  setx	DRAM_ERR_INJ_REG, %l3, %g6
  stx	%l1, [%g6]
  membar 0x40


store_to_L2:
  setx  TEST_DATA1, %l0, %g5


set_L2_Directly_Mapped_Mode_errorsteer:
        setx    L2CS_PA0, %l6, %g1
  	add	%g1, L2_BANK_ADDR, %g1

        ldx     [%g1], %o6

        mov     0x2, %o5                ! L2_CSR_REG<1>=1 => DM mode

        ldxa    [%g0]ASI_INTR_ID, %o4   ! get the thread id; for core-portable
        sllx    %o4, 15, %o4            ! L2_CSR_REG<21:15> = ERROR_STEER

        or      %o5, %o4, %o5

        or      %o6, %o5, %o6

        stx     %o6, [%g1]
        membar  0x40

	/*************** Make line dirty**************/
	set	0x80, %g6
	setx	ERROR_ADDR, %l0, %g2
store_1:
  	stx 	%g5, [%g2]
	add	%g2, 0x200, %g2		! next index; same tag
	dec	%g6
	cmp	%g6, %g0
	bne	store_1
	nop

	/************ WB *********************/
        set     0x80, %g6
        setx    WB_ADDR, %l0, %g2
store_alias:
	stx	%g5, [%g2]
        add     %g2, 0x200, %g2         ! next index; same tag
        dec     %g6
        cmp     %g6, %g0
        bne     store_alias
        nop


  ba	test_pass
  nop


	/**************** TH1 *******************/
main_th_1:
	nop

set_inj_err_src_reg:
        set     INJ_ERR_SRC, %g1
        setx    DRAM_FBD_INJ_ERR_SRC_REG_PA, %l7, %g3
	stx	%g1, [%g3]
	membar 0x40

        set	0x1, %g1
	sllx	%g1, ERR_FIELD, %g2
	setx	SOC_EJR_REG, %l7, %g3
	set	0x20, %g6
set_ejr:
	stx	%g2, [%g3]
	nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        stx     %g0, [%g3]
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop

	dec	%g6
	cmp	%g6, %g0
	bne	%xcc, set_ejr
	nop
	membar 0x40

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP


test_fail:
ta  T_BAD_TRAP



