/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_mcu_ios_ecc_trap.s
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
#define H_HT0_Hw_Corrected_Error_0x63 My_Corrected_ECC_error_trap
#define H_HT0_Sw_Recoverable_Error_0x40  My_Recoverable_Sw_error_trap

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO


#include "hboot.s"
#include "asi_s.h"

#define L20 0x0002204000
#define L21 0x0002204040

#define L22 0x0002204080
#define L23 0x00022040c0

#define L24 0x0002204100
#define L25 0x0002204140

#define L26 0x0002204180
#define L27 0x00022041c0

#ifdef MCU0
#define DRAM_FBR_CNT_REG_PA             DRAM_FBR_CNT_REG_PA_0
#define DRAM_ERR_CNT_REG_PA             DRAM_ERR_CNT_REG_PA_0

#define DRAM_FBD_ERR_SYND_REG_PA        DRAM_FBD_ERR_SYND_REG_PA_0
#define DRAM_FBD_INJ_ERR_SRC_REG_PA     DRAM_FBD_INJ_ERR_SRC_REG_PA_0

#define  DRAM_ERR_INJ_REG               0x8400000290
#define  DRAM_ERR_STAT_REG              0x8400000280
#define  L2_ERR_STAT_REG                0xAB00000000
#define  L2_ERR_ADDR_REG                0xAC00000000
#endif

#ifdef MCU1
#define DRAM_FBR_CNT_REG_PA             DRAM_FBR_CNT_REG_PA_1
#define DRAM_ERR_CNT_REG_PA             DRAM_ERR_CNT_REG_PA_1

#define DRAM_FBD_ERR_SYND_REG_PA        DRAM_FBD_ERR_SYND_REG_PA_1
#define DRAM_FBD_INJ_ERR_SRC_REG_PA     DRAM_FBD_INJ_ERR_SRC_REG_PA_1

#define  DRAM_ERR_INJ_REG               0x8400001290
#define  DRAM_ERR_STAT_REG              0x8400001280
#define  L2_ERR_STAT_REG                0xAB00000080
#define  L2_ERR_ADDR_REG                0xAC00000080
#endif

#ifdef MCU2
#define DRAM_FBR_CNT_REG_PA             DRAM_FBR_CNT_REG_PA_2
#define DRAM_ERR_CNT_REG_PA             DRAM_ERR_CNT_REG_PA_2

#define DRAM_FBD_ERR_SYND_REG_PA        DRAM_FBD_ERR_SYND_REG_PA_2
#define DRAM_FBD_INJ_ERR_SRC_REG_PA     DRAM_FBD_INJ_ERR_SRC_REG_PA_2

#define  DRAM_ERR_INJ_REG               0x8400002290
#define  DRAM_ERR_STAT_REG              0x8400002280
#define  L2_ERR_STAT_REG                0xAB00000100
#define  L2_ERR_ADDR_REG                0xAC00000100
#endif

#ifdef MCU3
#define DRAM_FBR_CNT_REG_PA             DRAM_FBR_CNT_REG_PA_3
#define DRAM_ERR_CNT_REG_PA             DRAM_ERR_CNT_REG_PA_3

#define DRAM_FBD_ERR_SYND_REG_PA        DRAM_FBD_ERR_SYND_REG_PA_3
#define DRAM_FBD_INJ_ERR_SRC_REG_PA     DRAM_FBD_INJ_ERR_SRC_REG_PA_3


#define  DRAM_ERR_INJ_REG               0x8400003290
#define  DRAM_ERR_STAT_REG              0x8400003280
#define  L2_ERR_STAT_REG                0xAB00000180
#define  L2_ERR_ADDR_REG                0xAC00000180
#endif

#define CMP_ECC_CNT     0x0

#ifdef L2_OFF
#define L2_ON_OFF_DM	0x1
#else
#define L2_ON_OFF_DM    0x0
#endif
 
#define TT      0x63

.text
.global	 main
.global  My_Corrected_ECC_error_trap
.global  My_Recoverable_Sw_error_trap


main:
	ta	  T_CHANGE_HPRIV
	clr	%i6
	clr	%i7
	clr	%i2
	clr	%i0

write_mcu_fbr_count_reg:
	set	0x10000, %g6		!<16>=countone=1
	setx	DRAM_FBR_CNT_REG_PA, %l7, %o2
	stx     %g6, [%o2]
	ldx     [%o2], %i1

set_error_count_reg:
        set     0x1, %g6            !<16>=countone=1
        setx    DRAM_ERR_CNT_REG_PA, %l7, %o2
        stx     %g6, [%o2]

clear_soc_esr:
        setx   	SOC_ESR_REG, %l7, %g5
        stx     %g0, [%g5]

clear_soc_per:
        setx    SOC_PER_REG, %l7, %g5
        stx     %g0, [%g5]

clear_mcu_esr:
        setx    DRAM_ERR_STAT_REG, %l7, %g5
        stx     %g0, [%g5]

clear_l2_esr:
        setx    L2_ERR_STAT_REG, %l7, %g5
        stx     %g0, [%g5]

clear_l2_ear:
        setx    L2_ERR_ADDR_REG, %l7, %g5
        stx     %g0, [%g5]

set_ejr:
        set     0x1, %g1
        sllx    %g1, ERR_FIELD, %g2 
        setx    SOC_EJR_REG, %l7, %g3
        stx     %g2, [%g3]
        membar 0x40

set_eie:
        setx    SOC_EIE_REG, %l7, %g3
        stx     %g2, [%g3]
        membar 0x40

L2_Init:
	setx	L20, %g7, %l0
	setx	L22, %g7, %l2
	setx	L24, %g7, %l4
	setx	L26, %g7, %l6

	! Each of the line should be a miss in L2 and Read from Memory

#ifdef MCU0
L2_0:
        ldx     [%l0], %g1
#endif

#ifdef MCU1
L2_2:
        ldx     [%l2], %g1
#endif

#ifdef MCU2
L2_4:
        ldx     [%l4], %g1
#endif

#ifdef MCU3
L2_6:
        ldx     [%l6], %g1
#endif

	membar 0x40

        setx    0x400, %g1, %g4
trap_delay_loop:
        dec     %g4
        brz    %g4, test_fail 
        nop

        cmp   %i7, %g0
        bne   %xcc, check_error_trap 
        nop

	ba	trap_delay_loop
	nop


check_error_trap:
        setx  EXECUTED, %l1, %l0
        cmp   %i2, %l0
        bne   test_fail
        nop

        mov   TT, %l0
        cmp   %i0, %l0
        bne   test_fail
        nop

/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD




/************************************************************************
   Trap Handlers
 ************************************************************************/
My_Recoverable_Sw_error_trap:
        nop
	ba	test_fail
	nop

	!PER not cleared at the end of the TRAP Handler to avoid further Trap
My_Corrected_ECC_error_trap:
        ! Signal trap taken
        setx  EXECUTED, %l0, %i2
        ! save trap type value
        rdpr  %tt, %i0

	inc	%i7

clear_ejr_tt63:
        setx    SOC_EJR_REG, %l7, %l0
        stx     %g0, [%l0]
        nop

check_desr_tt63:
        ldxa  [%g0]0x4c, %g2
        nop
        setx    0x8b00000000000000, %l0, %g3
        subcc   %g2, %g3, %g4
        brnz    %g4, test_fail
	nop

check_per_tt63:
        setx    SOC_PER_REG, %l7, %g5
        ldx     [%g5], %i1
        nop
        setx    0x8000000000000000, %l7, %g7    !valid bit
        set     0x1, %g1
        sllx    %g1, ERR_FIELD, %g2
        or      %g7, %g2, %i3
        subcc   %i1, %i3, %i4
        brnz    %i4, test_fail
        nop

check_mcu_esr_tt63:
        mov     0x1, %l1
        sllx    %l1, DRAM_ES_DAC, %g2

/*
        mov     0x1, %l1
        sllx    %l1, DRAM_ES_MEC, %l2

        or      %l0, %l2, %l6
 */

       setx  DRAM_ERR_STAT_REG, %l3, %g5  
        ldx   [%g5], %l1

        setx  0xbfffffffffff0000, %l3, %l0
        andcc %l0, %l1, %l5                   ! Donot check SYND and MEC bits

        sub     %l5, %g2, %i4
        brnz    %i4, test_fail
        nop


check_L2_ESR_tt63:
        setx  L2_ERR_STAT_REG, %l3, %g5  
        ldx   [%g5], %l6

        setx  0xbffffffff0000000, %l3, %l0
        andcc %l0, %l6, %l5                   ! Donot check L2ESR SYND and MEC bits

        mov   0x1, %l1
        sllx  %l1, L2ES_DAC, %l0

        mov   0x1, %l1
        sllx  %l1, L2ES_VEC, %l2

        or    %l0, %l2, %i4

/*
        mov   0x1, %l1
        sllx  %l1, L2ES_MEC, %i3

        or    %i3, %i4, %i5
*/

        cmp   %l5, %i4
        bne   %xcc, test_fail
        nop

Read_L2_addr_tt63:
        setx  L2_ERR_ADDR_REG, %l3, %g5  
        ldx   [%g5], %l1
        membar 0x40

check_fbr_cnt_reg_tt63:
        setx    DRAM_FBR_CNT_REG_PA, %l7, %o2
        ldx     [%o2], %g1
        set     0x10000, %g6            !<16>=countone=1
        sub     %g1, %g6, %i4
        brnz    %i4, test_fail
        nop

read_err_cnt_reg_tt63:
        setx    DRAM_ERR_CNT_REG_PA, %l7, %o2
        ldx     [%o2], %g1
        set     CMP_ECC_CNT, %i1
        sub     %g1, %i1, %i4
        brnz    %i4, test_fail
        nop

clear_per_tt63:
        setx    SOC_PER_REG, %l7, %l0
        stx     %g0, [%l0]
        nop


       	done 
        nop

