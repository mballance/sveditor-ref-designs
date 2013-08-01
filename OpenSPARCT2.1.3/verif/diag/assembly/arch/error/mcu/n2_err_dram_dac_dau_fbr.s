/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_dram_dac_dau_fbr.s
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

#define L20 0x0020134000
#define L21 0x0000134040

#define L22 0x0000134080
#define L23 0x00001340c0

#define L24 0x0000134100
#define L25 0x0000134140

#define L26 0x0000134180
#define L27 0x00001341c0
#define  DRAM_ERR_INJ_REG   0x8400000290


#define ERR_TYPE 0x3


#ifdef MCU0
#define  L2_BANK_ADDR                   0x0

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
#define  L2_BANK_ADDR                   0x80

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
#define  L2_BANK_ADDR                   0x100

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
#define  L2_BANK_ADDR                   0x180

#define DRAM_FBR_CNT_REG_PA             DRAM_FBR_CNT_REG_PA_3
#define DRAM_ERR_CNT_REG_PA             DRAM_ERR_CNT_REG_PA_3

#define DRAM_FBD_ERR_SYND_REG_PA        DRAM_FBD_ERR_SYND_REG_PA_3
#define DRAM_FBD_INJ_ERR_SRC_REG_PA     DRAM_FBD_INJ_ERR_SRC_REG_PA_3


#define  DRAM_ERR_INJ_REG               0x8400003290
#define  DRAM_ERR_STAT_REG              0x8400003280
#define  L2_ERR_STAT_REG                0xAB00000180
#define  L2_ERR_ADDR_REG                0xAC00000180
#endif

#define CMP_ECC_CNT     0x1

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
  ! Now access L2 control and status registers
disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


set_L2_Direct_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1
  add   %g1,L2_BANK_ADDR,%g1
  mov   0x2, %l0
  stx   %l0, [%g1]


/****
enable_err_reporting:
  setx L2EE_PA0, %l0, %l1

  ldx  [%l1], %l2
  mov  0x3, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1] 
****/

set_DRAM_error_inject_ch0:
  mov   0x2, %l1                ! ECC Mask (1-bit error)
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_SSHOT, %l3
  or    %l1, %l3, %l1           ! Set single shot ;
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG, %l3, %g6
!  add   %g6, MCU_BANK_ADDR, %g6
  stx   %l1, [%g6]
  membar 0x40


store_to_L2_way0:
  setx  0x555555555, %l0, %g5
  setx  0x22000000, %l0, %g7  ! bits [21:18] select way
  add   %g7, L2_BANK_ADDR, %g7
  stx %g5, [%g7]
  membar #Sync

! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_0:
  setx  0x31000000, %l0, %g3 ! bits [21:18] select way
  add   %g3, L2_BANK_ADDR, %g3
  stx %g5, [%g3]
  membar #Sync

read_error_address_ch0:
 ldx   [%g7], %l3
  membar #Sync

set_DRAM_error_inject_ch0_dau:
  mov   0x606, %l1                ! ECC Mask (1-bit error)
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_SSHOT, %l3
  or    %l1, %l3, %l1           ! Set single shot ;
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG, %l3, %g6
!  add   %g6, MCU_BANK_ADDR, %g6
  stx   %l1, [%g6]
  membar 0x40


store_to_L2_way0_dau:
  setx  0x555555555, %l0, %g5
  setx  0x11000000, %l0, %g7  ! bits [21:18] select way
  add   %g7, L2_BANK_ADDR, %g7
  stx %g5, [%g7]
  membar #Sync

! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_dau:
  setx  0x32000000, %l0, %g3 ! bits [21:18] select way
  add   %g3, L2_BANK_ADDR, %g3
  stx %g5, [%g3]
  membar #Sync

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

set_inj_err_src_reg:
        set     FBSYND, %g1
        setx    DRAM_FBD_INJ_ERR_SRC_REG_PA, %l7, %g3
        stx     %g1, [%g3]
        membar 0x40

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

read_error_address_ch0_FBR:
 ldx   [%g7], %l3
  membar #Sync

idle_cycles:
setx 0xfffffffffff,%l0,%l1
setx 0x12345678910,%l0,%l1
setx 0x55555555555,%l0,%l1
setx 0x66666666666,%l0,%l1
setx 0x77777777777,%l0,%l1
setx 0x88888888888,%l0,%l1
setx 0xfffffffffff,%l0,%l1

check_error_trap:
        setx  EXECUTED, %l1, %g7
        cmp   %i2, %g7
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
	!ba	test_fail
	ba	test_pass
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

check_mcu_ESR_tt63:
        mov     0x1, %l1
        sllx    %l1, DRAM_ES_FBR, %l6
        sllx    %l1, DRAM_ES_DAU, %l3
	or	%l6,%l3,%l6
        sllx    %l1, DRAM_ES_DAC, %l3
        or      %l6,%l3,%l6



        setx  DRAM_ERR_STAT_REG, %l3, %g5  
        ldx   [%g5], %l1

        setx  0xbfffffffffff0000, %l3, %l0	! MEC bit not checked
        andcc %l0, %l1, %l5

        sub     %l5, %l6, %i4
        brnz    %i4, test_fail
        nop


check_mcu_EAR_tt63:
        setx  DRAM_ERR_ADDR_REG_PA_0, %l3, %g5  
        ldx   [%g5], %l1


	/*
	! Setting DSC and/ or DSU does not cause any logging of the error 
        ! address or syndrome in the L2 Error Address register. 
        ! It also does not update the VEC/VEU/MEC/MEU bits */
check_L2_ESR_tt63:
        setx  L2_ERR_STAT_REG, %l3, %g5  
        ldx   [%g5], %l6

        setx  0xbffffffff0000000, %l3, %l0
        andcc %l0, %l6, %l5                   ! Donot check L2ESR SYND bits and MEC

        mov   0x1, %l1
        sllx  %l1, L2ES_DSC, %l0
        sllx  %l1, L2ES_DAU, %l3
	or	%l0,%l3,%l0
        sllx  %l1, L2ES_VEU, %l3
	or	%l0,%l3,%l0
        sllx  %l1, L2ES_DAC, %l3
        or      %l0,%l3,%l0
        sllx  %l1, L2ES_VEC, %l3
        or      %l0,%l3,%l0



        cmp   %l5, %l0
        bne   %xcc, test_fail
        nop

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

read_fbd_err_synd_reg_tt63:
        setx    DRAM_FBD_ERR_SYND_REG_PA, %l7, %o2
        ldx     [%o2], %g1

        setx    0x8000000000000000, %l7, %o3
        set     0x1, %o4
        sll     %o4, FBSYND, %o5
        or      %o3, %o5, %g2

        and     %g1, %g2, %g3
        subcc   %g2, %g3, %g4
        brnz    %g4, test_fail
        nop

clear_per_tt63:
        setx    SOC_PER_REG, %l7, %l0
        stx     %g0, [%l0]
        nop

clear_esr_tt63:
        setx    SOC_ESR_REG, %l7, %l0
        stx     %g0, [%l0]
        nop

       	done 
        nop



