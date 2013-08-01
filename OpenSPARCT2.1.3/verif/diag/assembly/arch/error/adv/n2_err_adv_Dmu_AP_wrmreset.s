/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_Dmu_AP_wrmreset.s
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

#define RESET_STAT_CHECK

#define	 DRAM_0_ERR_STAT_REG		0x8400000280
#define	 DRAM_1_ERR_STAT_REG		0x8400001280
#define	 DRAM_2_ERR_STAT_REG		0x8400002280
#define	 DRAM_3_ERR_STAT_REG		0x8400003280

#define	 L2_0_ERR_STAT_REG		0xAB00000000
#define  L2_1_ERR_STAT_REG              0xAB00000040
#define  L2_2_ERR_STAT_REG              0xAB00000080
#define  L2_3_ERR_STAT_REG              0xAB000000c0

#define  L2_4_ERR_STAT_REG              0xAB00000100
#define  L2_5_ERR_STAT_REG              0xAB00000140
#define  L2_6_ERR_STAT_REG              0xAB00000180
#define  L2_7_ERR_STAT_REG              0xAB000001c0

#ifdef BANK0
#define  DRAM_ERR_STAT_REG              0x8400000280
#define  L2_ERR_STAT_REG                0xAB00000000
#endif

#ifdef BANK1
#define  DRAM_ERR_STAT_REG              0x8400000280
#define  L2_ERR_STAT_REG                0xAB00000040
#endif

#ifdef BANK2
#define  DRAM_ERR_STAT_REG              0x8400001280
#define  L2_ERR_STAT_REG                0xAB00000080
#endif

#ifdef BANK3
#define  DRAM_ERR_STAT_REG              0x8400001280
#define  L2_ERR_STAT_REG                0xAB000000c0
#endif

#ifdef BANK4
#define  DRAM_ERR_STAT_REG              0x8400002280
#define  L2_ERR_STAT_REG                0xAB00000100
#endif

#ifdef BANK5
#define  DRAM_ERR_STAT_REG              0x8400002280
#define  L2_ERR_STAT_REG                0xAB00000140
#endif

#ifdef BANK6
#define  DRAM_ERR_STAT_REG              0x8400003280
#define  L2_ERR_STAT_REG                0xAB00000180
#endif

#ifdef BANK7
#define  DRAM_ERR_STAT_REG              0x8400003280
#define  L2_ERR_STAT_REG                0xAB000001c0
#endif


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

#ifdef BANK0
#define DMA_DATA_BYP_ADDR1      0xfffc000123450000
#endif

#ifdef BANK1
#define DMA_DATA_BYP_ADDR1      0xfffc000123456040
#endif

#ifdef BANK2
#define DMA_DATA_BYP_ADDR1      0xfffc000123456080
#endif

#ifdef BANK3
#define DMA_DATA_BYP_ADDR1      0xfffc0001234560c0
#endif

#ifdef BANK4
#define DMA_DATA_BYP_ADDR1      0xfffc000123456100
#endif

#ifdef BANK5
#define DMA_DATA_BYP_ADDR1      0xfffc000123456140
#endif

#ifdef BANK6
#define DMA_DATA_BYP_ADDR1      0xfffc000123456180
#endif

#ifdef BANK7
#define DMA_DATA_BYP_ADDR1      0xfffc0001234561c0
#endif



#define ERR_BITS                0x80
#define ERR_BITS_EXPECT         0x8000000000000080

    
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

clear_esr:
	setx	0xc03ffffc00000000, %g7, %g1

	setx	L2_0_ERR_STAT_REG, %g7, %g2
	stx	%g1, [%g2]
	setx	L2_1_ERR_STAT_REG, %g7, %g2
	stx	%g1, [%g2]
	setx	L2_2_ERR_STAT_REG, %g7, %g2
        stx	%g1, [%g2]
	setx	L2_3_ERR_STAT_REG, %g7, %g2
	stx	%g1, [%g2]
	setx	L2_4_ERR_STAT_REG, %g7, %g2
	stx	%g1, [%g2]
	setx	L2_5_ERR_STAT_REG, %g7, %g2
	stx	%g1, [%g2]
	setx	L2_6_ERR_STAT_REG, %g7, %g2
	stx	%g1, [%g2]
	setx	L2_7_ERR_STAT_REG, %g7, %g2
	stx	%g1, [%g2]

        setx    0xffc0000000000000, %g7, %g1

	setx	DRAM_0_ERR_STAT_REG, %g7, %g2
	stx	%g1, [%g2]
	setx	DRAM_1_ERR_STAT_REG, %g7, %g2
	stx	%g1, [%g2]
	setx	DRAM_2_ERR_STAT_REG, %g7, %g2
	stx	%g1, [%g2]
	setx	DRAM_3_ERR_STAT_REG, %g7, %g2
	stx	%g1, [%g2]

	/************************************************************
 	Check if this is the first time thru here
 	************************************************************/
reset_decide:
        setx    test_entered, %g1, %g2
        ldx     [%g2], %g3
        brnz    %g3, After_Warm_Reset
        nop

	! First time thru, Store a non-zero value there
        dec     %g3
        stx     %g3, [%g2]

clearing:
	clr	%i7
	clr	%o6
	clr	%o7
	clr	%i0


fee_reg_ones_rdd:
        setx    SOC_FEE_REG, %g3, %g2
        set     ERR_BITS, %g1
        stx     %g1, [%g2]
        membar  0x4

L2_err_enable:
        set	0x3, %l1 
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


bypass_iommu:
        ! enable bypass in IOMMU
        setx    FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
        setx    FIRE_DLC_MMU_CSR_A_CTL__BYPASS_EN, %g1, %g3
        stx     %g3, [%g2]
        ldx     [%g2], %g3

	/*******************************************************
		RDD from DMU
	********************************************************/
set_ejr_rdd:
        set     ERR_BITS, %g5

        setx    SOC_EJR_REG, %l7, %i3
        stx     %g5, [%i3]
        membar  0x40

dma_rdd:
	nop
UsrEvnt_rdd:
        nop         ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_rdd)) -> EnablePCIeIgCmd ("DMARD", DMA_DATA_BYP_ADDR1, DMA_DATA_BYP_ADDR1, "64'h40", 1, *, * )

        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3

After_Warm_Reset:
	nop

esr_rdd:
        setx    ERR_BITS_EXPECT, %g7, %g5
        setx    SOC_ESR_REG, %g7, %g2
        setx    0x100, %g7, %g6
esr_loop_rdd:
        dec     %g6
        cmp     %g6, %g0
        be      %xcc, test_failed
        nop

        ldx     [%g2], %g3

        cmp     %g3, %g5
        be      %xcc, check_trap_cnt 
        nop

        ba      esr_loop_rdd
        nop


check_trap_cnt:
	cmp	%i0, %g0
	bne	test_failed
	nop

	ba	test_passed
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
	ba	test_failed
        nop



My_Corrected_ECC_error_trap:
	ba	test_failed
        nop


/************************************************************************
   Test case data start
************************************************************************/
        .align 64
test_entered:
        .xword 0


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

