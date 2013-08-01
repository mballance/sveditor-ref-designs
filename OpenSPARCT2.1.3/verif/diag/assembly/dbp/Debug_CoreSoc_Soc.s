/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: Debug_CoreSoc_Soc.s
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

#define ENABLE_PCIE_LINK_TRAINING
/* #define MAIN_PAGE_NUCLEUS_ALSO */ /* Access main in priviledge mode */
#define MAIN_PAGE_HV_ALSO

#define  DRAM_ERR_STAT_REG              0x8400000280
#define  L2_ERR_STAT_REG                0xAB00000000

#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"

#define DMA_DATA_ADDR           0x0000000123456700
#define DMA_DATA_BYP_ADDR1      0xfffc000123456700
#define DMA_DATA_BYP_ADDR2      0xfffc000123456780
#define DMA_DATA_BYP_ADDR3      0xfffc000123456800

#define DMA_DATA_ADDR           0x0000000123456700
#define DMA_DATA_BYP_SADDR      0xfffc000123456700
#define DMA_DATA_BYP_EADDR      0xfffc000123456800

#define ADDR1      		0xfffc00002000aa00
#define TEST_DATA1		0xaaaaaaaaaaaaaaaa
#define  DRAM_ERR_INJ_REG   	0x8400000290

#define ERR_BITS                0x2
#define ERR_BITS_EXPECT         0x8000000000000002

/**************/
#define DBG_ERR_PA  0xAA00000000
#define DBG_ERR_VAL 0x7

/***Following will enable the MCU Debug Events in case of an Error*****/

#define  Soc_Decr_Pa         0x8600000010
#define  Soc_Decr_Val        0x00000000030000

//enable the coresoc mode diag

#define  Dbg_Config_Pa         0x8600000000
#define  Dbg_Config_Val        0x8000000000000007



/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global  My_Corrected_ECC_error_trap
.global  My_Recoverable_Sw_error_trap

main:
        ta T_CHANGE_HPRIV
        nop
        setx Dbg_Config_Pa,%l1,%g3
        setx Dbg_Config_Val,%l4,%g7
        stx %g7,[%g3]
        membar #Sync
        nop
        nop


        clr     %i7
        clr     %o6
        clr     %o7
        clr     %i0
setup_soc_decr_reg:
        setx Soc_Decr_Pa,%l1,%g3
        setx Soc_Decr_Val,%l4,%g7
        stx %g7,[%g3]
        nop
        nop

setup_dram_dbg:
          setx DBG_ERR_PA,%l0,%g1
          setx DBG_ERR_VAL,%l3,%g5
          stx %g5,[%g1]
          nop
          nop
	clr	%i7
	clr	%o6
	clr	%o7
	clr	%i0

disable_l1:
  	ldxa  [%g0] ASI_LSU_CONTROL, %l0
  	! Remove the lower 2 bits (I-Cache and D-Cache enables)
  	andn  %l0, 0x3, %l0
  	stxa  %l0, [%g0] ASI_LSU_CONTROL

set_DRAM_error_inject_ch0:
	mov   0x606, %l1                ! ECC Mask (2-bit error)
	mov   0x1, %l2
	sllx  %l2, DRAM_EI_SSHOT, %l3
	Or    %l1, %l3, %l1           ! Set single shot ;
	mov   0x1, %l2
	sllx  %l2, DRAM_EI_ENB, %l3
	or    %l1, %l3, %l1           ! Enable error injection for the next write
	setx  DRAM_ERR_INJ_REG, %l3, %g6
	stx   %l1, [%g6]
	membar 0x40

L2_err_enable:
        set     0x3, %l1
        mov     0xaa, %g2
        sllx    %g2, 32, %g2
        stx     %l1, [%g2]
        stx     %l1, [%g2 + 0x40]
        stx     %l1, [%g2 + 0x80]
        stx     %l1, [%g2 + 0xc0]
        stx     %l1, [%g2 + 0x100]
        stx     %l1, [%g2 + 0x140]
        stx     %l1, [%g2 + 0x180]
        stx     %l1, [%g2 + 0x1c0]

set_L2_Directly_Mapped_Mode:
	setx  L2CS_PA0, %l6, %g1
	mov   0x2, %l0
	stx   %l0, [%g1]

store_to_L2_way0:
	setx  TEST_DATA1, %l0, %g5
	setx  0x2000aa00, %l0, %g2  ! bits [21:18] select way
	stx %g5, [%g2]
	membar #Sync

	! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_0:
	setx  0x1000aa00, %l0, %g3 ! bits [21:18] select way
	stx %g5, [%g3]
	membar #Sync

piu_iommu:
        ! enable bypass in IOMMU
        setx    FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
        setx    FIRE_DLC_MMU_CSR_A_CTL__BYPASS_EN, %g1, %g3
        stx     %g3, [%g2]
        ldx     [%g2], %g3

	/*******************************************************
		RDD from DMU
	********************************************************/

dma_rdd:
	nop
UsrEvnt_rdd:
        nop         ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_rdd)) -> EnablePCIeIgCmd ("DMARD_UE", ADDR1, ADDR1, "64'h40", 1, *, * )

        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3

l2_esr:
        mov     0x1, %g1
        sllx    %g1, L2ES_DRU, %g2

        mov     0x1, %g1
        sllx    %g1, L2ES_VEU, %g3

        or      %g2, %g3, %g4

        setx	0x7ffffffff0000000, %g7, %g5
	setx	0x30, %g7, %g6
check_l2_esr:
        cmp     %g6, %g0
        be      %xcc, test_failed
        nop
	dec	%g6

	setx	L2_ERR_STAT_REG, %g7, %g1  
	ldx	[%g1], %g2
	andcc	%g2, %g5, %g3			! Donot check L2ESR SYND bits and MEC

	cmp	%g3, %g4
	bne	%xcc, check_l2_esr 
	nop

cause_trap:
	setx	0x2000a000, %g3, %g1
	stx	%g0, [%g1]
	setx	0x800bb00, %g3, %g1
	ldx	[%g1], %g2

	setx	0x8300b000, %g3, %g1
	setx	0x2222222222222222, %g3, %g2	
	stx	%g2, [%g1]	
	setx	 0x6300b000, %g3, %g1	
	ldx	[%g1], %g2

eie_reg_ones_rdd:
        setx    SOC_EIE_REG, %g3, %g2
        setx 	0xffffffffffffffff, %g3, %g1
        stx     %g1, [%g2]
        membar  0x40

	set	0x1, %g1
        setx    0x30, %g7, %g6
err_trap_loop_rdd:
        cmp     %g6, %g0
        be      %xcc, test_failed
        nop

	cmp	%g1, %i7
	be	%xcc, check_tt_rdd
	nop

	ba	err_trap_loop_rdd
	nop

check_tt_rdd:
        mov     0x40, %l0
        cmp     %o7, %l0
        bne     %xcc, test_failed
        nop


check_l2_trap_cnt:
	set	0x1, %l0
	cmp	%i0, %l0
	bne	test_failed
	nop

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
	RAS
   	Trap Handlers
 ************************************************************************/
My_Recoverable_Sw_error_trap:
        ! Signal trap taken
        setx  EXECUTED, %l0, %o6
        ! save trap type value
        rdpr  %tt, %o7

        inc	%i7

check_desr_NcuTrap_tt40:
        ldxa  [%g0]0x4c, %g2
        nop

        setx    0xb300000000000000, %l0, %g3
        subcc   %g2, %g3, %g4
        brnz    %g4, l2_trap 
	nop

check_per_tt40:
	ba	test_failed
	nop


l2_trap:
	nop
	inc	%i0

check_desr_L2Trap_tt40:
        setx    0xb000000000000000, %l0, %g3
        subcc   %g2, %g3, %g4
        brnz    %g4, test_failed 
        nop

check_mcu2_esr_L2Trap_tt40:
        mov     0x1, %l1
        sllx    %l1, DRAM_ES_DAU, %l0

        setx  DRAM_ERR_STAT_REG, %l3, %g5  
        ldx   [%g5], %l3

        setx  0xffffffffffff0000, %l2, %l1
        andcc %l1, %l3, %l4                   ! Donot check SYND bits

        sub     %l0, %l4, %i4
        brnz    %i4, test_failed
        nop

clear_mcu_esr_L2Trap_tt40:
        stx     %g0, [%g5]


check_L2_4_ESR_L2Trap_tt40:
        setx  	L2_ERR_STAT_REG, %l3, %g5  
        ldx   	[%g5], %l6

        setx  	0x7ffffffff0000000, %l3, %l0
        andcc 	%l0, %l6, %l5                   ! Donot check L2ESR SYND bits and MEU

        mov   	0x1, %l1
        sllx  	%l1, L2ES_DRU, %l0

        mov   	0x1, %l1
        sllx  	%l1, L2ES_VEU, %l2

        or    	%l0, %l2, %i4

        cmp   	%l5, %i4
        bne   	%xcc, test_failed
        nop

clear_l2_esr_L2Trap_tt40:
	stx	%g0, [%g5]

trap_done_tt40:
       	retry 
        nop



My_Corrected_ECC_error_trap:
	ba	test_failed
        nop


/************************************************************************
   Test case data start
************************************************************************/

SECTION       .DATA DATA_VA=DMA_DATA_ADDR
attr_data {
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
.global PCIAddr9
        .xword 0x0001020304050607
        .xword 0x08090a0b0c0d0e0f
        .xword 0x1011121314151617
        .xword 0x18191a1b1c1d1e1f
        .xword 0x2021222324252627
        .xword 0x28292a2b2c2d2e2f
        .xword 0x3031323334353637
        .xword 0x38393a3b3c3d3e3f

        .xword 0x4041424344454647
        .xword 0x48494a4b4c4d4e4f
        .xword 0x5051525354555657
        .xword 0x58595a5b5c5d5e5f
        .xword 0x6061626364656667
        .xword 0x68696a6b6c6d6e6f
        .xword 0x7071727374757677
        .xword 0x78797a7b7c7d7e7f

        .xword 0x8081828384858687
        .xword 0x88898a8b8c8d8e8f
        .xword 0x9091929394959697
        .xword 0x98999a9b9c9d9e9f
        .xword 0xa0a1a2a3a4a5a6a7
        .xword 0xa8a9aaabacadaeaf
        .xword 0xb0b1b2b3b4b5b6b7
        .xword 0xb8b9babbbcbdbebf

        .xword 0xc0c1c2c3c4c5c6c7
        .xword 0xc8c9cacbcccdcecf
        .xword 0xd0d1d2d3d4d5d6d7
        .xword 0xd8d9dadbdcdddedf
        .xword 0xe0e1e2e3e4e5e6e7
        .xword 0xe8e9eaebecedeeef
        .xword 0xf0f1f2f3f4f5f6f7
        .xword 0xf8f9fafbfcfdfeff

        .xword 0x0001020304050607
        .xword 0x08090a0b0c0d0e0f
        .xword 0x1011121314151617
        .xword 0x18191a1b1c1d1e1f
        .xword 0x2021222324252627
        .xword 0x28292a2b2c2d2e2f
        .xword 0x3031323334353637
        .xword 0x38393a3b3c3d3e3f

        .xword 0x4041424344454647
        .xword 0x48494a4b4c4d4e4f
        .xword 0x5051525354555657
        .xword 0x58595a5b5c5d5e5f
        .xword 0x6061626364656667
        .xword 0x68696a6b6c6d6e6f
        .xword 0x7071727374757677
        .xword 0x78797a7b7c7d7e7f

        .xword 0x8081828384858687
        .xword 0x88898a8b8c8d8e8f
        .xword 0x9091929394959697
        .xword 0x98999a9b9c9d9e9f
        .xword 0xa0a1a2a3a4a5a6a7
        .xword 0xa8a9aaabacadaeaf
        .xword 0xb0b1b2b3b4b5b6b7
        .xword 0xb8b9babbbcbdbebf

        .xword 0xc0c1c2c3c4c5c6c7
        .xword 0xc8c9cacbcccdcecf
        .xword 0xd0d1d2d3d4d5d6d7
        .xword 0xd8d9dadbdcdddedf
        .xword 0xe0e1e2e3e4e5e6e7
        .xword 0xe8e9eaebecedeeef
        .xword 0xf0f1f2f3f4f5f6f7
        .xword 0xf8f9fafbfcfdfeff

/************************************************************************/

