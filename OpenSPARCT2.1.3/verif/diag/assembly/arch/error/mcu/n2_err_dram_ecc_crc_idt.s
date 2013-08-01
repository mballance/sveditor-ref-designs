/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_dram_ecc_crc_idt.s
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

#define CMP_FBD_SYND 0x0

#include "hboot.s"
#include "asi_s.h"

#ifdef MCU0
#define L2_BANK_ADDR			0x00
#define	DRAM_FBR_CNT_REG_PA		DRAM_FBR_CNT_REG_PA_0
#define DRAM_ERR_CNT_REG_PA     	DRAM_ERR_CNT_REG_PA_0

#define DRAM_FBD_ERR_SYND_REG_PA        DRAM_FBD_ERR_SYND_REG_PA_0
#define DRAM_FBD_INJ_ERR_SRC_REG_PA     DRAM_FBD_INJ_ERR_SRC_REG_PA_0

#define  DRAM_ERR_INJ_REG   		0x8400000290
#define  DRAM_ERR_STAT_REG  		0x8400000280
#define  L2_ERR_STAT_REG    		0xAB00000000
#define  L2_ERR_ADDR_REG    		0xAC00000000
#define FBR_ERR 31

#endif

#ifdef MCU1
#define FBR_ERR 34
#define L2_BANK_ADDR			0x80
#define DRAM_FBR_CNT_REG_PA     	DRAM_FBR_CNT_REG_PA_1
#define DRAM_ERR_CNT_REG_PA     	DRAM_ERR_CNT_REG_PA_1

#define DRAM_FBD_ERR_SYND_REG_PA        DRAM_FBD_ERR_SYND_REG_PA_1
#define DRAM_FBD_INJ_ERR_SRC_REG_PA     DRAM_FBD_INJ_ERR_SRC_REG_PA_1

#define  DRAM_ERR_INJ_REG   		0x8400001290
#define  DRAM_ERR_STAT_REG  		0x8400001280
#define  L2_ERR_STAT_REG    		0xAB00000080
#define  L2_ERR_ADDR_REG    		0xAC00000080
#endif

#ifdef MCU2
#define FBR_ERR 37
#define L2_BANK_ADDR			0x100
#define DRAM_FBR_CNT_REG_PA     	DRAM_FBR_CNT_REG_PA_2
#define DRAM_ERR_CNT_REG_PA     	DRAM_ERR_CNT_REG_PA_2

#define DRAM_FBD_ERR_SYND_REG_PA        DRAM_FBD_ERR_SYND_REG_PA_2
#define DRAM_FBD_INJ_ERR_SRC_REG_PA     DRAM_FBD_INJ_ERR_SRC_REG_PA_2

#define  DRAM_ERR_INJ_REG   		0x8400002290
#define  DRAM_ERR_STAT_REG  		0x8400002280
#define  L2_ERR_STAT_REG    		0xAB00000100
#define  L2_ERR_ADDR_REG    		0xAC00000100
#endif

#ifdef MCU3
#define FBR_ERR 40

#define L2_BANK_ADDR			0x180
#define DRAM_FBR_CNT_REG_PA     	DRAM_FBR_CNT_REG_PA_3
#define	DRAM_ERR_CNT_REG_PA		DRAM_ERR_CNT_REG_PA_3

#define DRAM_FBD_ERR_SYND_REG_PA	DRAM_FBD_ERR_SYND_REG_PA_3
#define DRAM_FBD_INJ_ERR_SRC_REG_PA 	DRAM_FBD_INJ_ERR_SRC_REG_PA_3


#define  DRAM_ERR_INJ_REG   		0x8400003290
#define  DRAM_ERR_STAT_REG  		0x8400003280
#define  L2_ERR_STAT_REG    		0xAB00000180
#define  L2_ERR_ADDR_REG    		0xAC00000180
#endif

/********************************************************************
			Test Code Start
********************************************************************/
 
.text
.global	 main

main:
  ta	  T_CHANGE_HPRIV

disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


set_L2_Direct_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1
  add %g1,L2_BANK_ADDR,%g1
  mov   0x2, %l0
  stx   %l0, [%g1]

no_err_reporting:
  setx L2EE_PA0, %l0, %l1
  mov  0x0, %l2
  stx  %l2, [%l1+0x0]
  stx  %l2, [%l1+0x40]
  stx  %l2, [%l1+0x80]
  stx  %l2, [%l1+0xc0]
  stx  %l2, [%l1+0x100]
  stx  %l2, [%l1+0x140]
  stx  %l2, [%l1+0x180]
  stx  %l2, [%l1+0x1c0]

set_error_count_reg_fbu:
        set     0x1, %g6            !<16>=countone=1
        setx    DRAM_ERR_CNT_REG_PA, %l7, %o2
        stx     %g6, [%o2]

set_inj_err_src_reg_fbu:
        set     INJ_ERR_SRC, %g1
        setx    DRAM_FBD_INJ_ERR_SRC_REG_PA, %l7, %g3
        stx     %g1, [%g3]
        membar 0x40

set_ejr_fbu:
        set     0x1, %g1
        sllx    %g1, ERR_FIELD, %g2
        setx    SOC_EJR_REG, %l7, %g3
        stx     %g2, [%g3]
        membar 0x40

L2_Init:
        set     0x11111111, %o0
        set     0x41000000, %l0
        add     %l0,L2_BANK_ADDR,%l0

        set     0x41000000, %l1
        add     %l1,L2_BANK_ADDR,%l1
L2_0:
        stx     %o0, [%l0]
	membar #Sync
L2_1:
        stx     %o0, [%l1]
	membar #Sync

clear_fbu:
        setx    SOC_EJR_REG, %l7, %g3
        stx     %g0, [%g3]
        membar #Sync


        mov     0x1,%l5
        sllx    %l5, 18, %l6
        mov     0x10,%l7
        clr     %l4
line_flush:
        stx     %o3, [%l0]
        add     %l0,%l6,%l0
        inc     %l4
        cmp     %l4,%l7
        bne     line_flush
        nop

set_DRAM_error_inject_ch0:
  mov   0x2, %l1                ! ECC Mask (1-bit error)
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_SSHOT, %l3
  or    %l1, %l3, %l1           ! Set single shot ;
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG, %l3, %g6
  stx   %l1, [%g6]
  membar 0x40


store_to_L2_way0:
  setx  0x555555555, %l0, %g5
  setx  0x22000000, %l0, %g7  ! bits [21:18] select way
  add   %g7,L2_BANK_ADDR,%g7
  stx %g5, [%g7]
  membar #Sync

! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_0:
  setx  0x31000000, %l0, %g3 ! bits [21:18] select way
  add   %g3,L2_BANK_ADDR,%g3
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
  stx   %l1, [%g6]
  membar 0x40
store_to_L2_way0_dau:
  setx  0x555555555, %l0, %g5
  setx  0x11000000, %l0, %g7  ! bits [21:18] select way
  add   %g7,L2_BANK_ADDR,%g7
  stx %g5, [%g7]
  membar #Sync

! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_dau:
  setx  0x32000000, %l0, %g3 ! bits [21:18] select way
  add   %g3,L2_BANK_ADDR,%g3
  stx %g5, [%g3]
  membar #Sync

read_error_address_ch0_dau:
 ldx   [%g7], %l3
  membar #Sync

write_mcu_fbr_count_reg_fbr:
        set     0x10000, %g6            !<16>=countone=1
        setx    DRAM_FBR_CNT_REG_PA, %l7, %o2
        stx     %g6, [%o2]
        ldx     [%o2], %i1

set_error_count_reg_fbr:
        set     0x1, %g6            !<16>=countone=1
        setx    DRAM_ERR_CNT_REG_PA, %l7, %o2
        stx     %g6, [%o2]

set_inj_err_src_reg_fbr:
        set     0x3, %g1
        setx    DRAM_FBD_INJ_ERR_SRC_REG_PA, %l7, %g3
        stx     %g1, [%g3]
        membar 0x40

set_ejr_fbr:
        set     0x1, %g1
        sllx    %g1, FBR_ERR, %g2
        setx    SOC_EJR_REG, %l7, %g3
        stx     %g2, [%g3]
        membar 0x40

read_error_address_ch0_FBR:
  setx  0x31100000, %l0, %g7  ! bits [21:18] select way
  add   %g7,L2_BANK_ADDR,%g7
 ldx   [%g7], %l3
  membar #Sync
cyc_nop_0:
 setx    0x1111111111111110, %g7, %o0
        setx    0x2222222222222220, %g7, %o1
        setx    0x3333333333333330, %g7, %o2
        setx    0x4444444444444440, %g7, %o3
        setx    0x5555555555555550, %g7, %o4
        setx    0x6666666666666660, %g7, %o5
        setx    0x8888888888888880, %g7, %o6
        setx    0x9999999999999990, %g7, %o7

	clr %o1
	clr %o2
	clr %o3
	clr %o4
	clr %o5
	clr %o5
	clr %o6
	clr %o7


clear_dac_mec:
        setx    DRAM_ERR_STAT_REG, %l0, %g5
        setx    0x6000000000000000, %l0, %l1
        stx     %l1, [%g5]
        setx    L2_ERR_STAT_REG, %l0, %g5
        setx    0x4000041000000000, %l0, %l1
        stx     %l1, [%g5]


check_mcu_esr:
        mov     0x1, %l1
        sllx    %l1, DRAM_ES_FBU, %l4
        sllx    %l1, DRAM_ES_DAU, %l2
        or      %l2,%l4,%l3
        sllx    %l1, DRAM_ES_MEU, %l5
        or      %l5,%l3,%l6
	

        setx    DRAM_ERR_STAT_REG, %l3, %g5
        ldx     [%g5], %l1

        subcc   %l1, %l6, %i4
        brnz    %i4, test_fail
        nop

read_fbd_err_synd_reg:
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

check_L2_ESR_0:
        setx    L2_ERR_STAT_REG, %l3, %g5
        ldx     [%g5], %l6

        setx    0xfffffffff0000000, %l3, %l0
        andcc   %l0, %l6, %l5                   ! Donot check L2ESR SYND bits

        mov     0x1, %l1
        sllx    %l1, L2ES_DAU, %l0
        sllx    %l1, L2ES_VEU, %l3
        or      %l0, %l3, %l4
        sllx    %l1, L2ES_MEU, %l7
        or      %l4, %l7, %l2

        subcc   %l5, %l2, %o5
        brnz    %o5, test_fail
        nop




ba test_pass
nop

/******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP


test_fail:
ta  T_BAD_TRAP








