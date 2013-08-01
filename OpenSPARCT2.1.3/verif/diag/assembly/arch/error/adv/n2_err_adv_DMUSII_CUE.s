/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_DMUSII_CUE.s
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
#define DMA_DATA_BYP_ADDR1      0xfffc000123456000
#define DMA_DATA_BYP_ADDR2      0xfffc000123456780
#define DMA_DATA_BYP_ADDR3      0xfffc000123456800

#define DMA_DATA_ADDR           0x0000000123456700
#define DMA_DATA_BYP_SADDR      0xfffc000123456700
#define DMA_DATA_BYP_EADDR      0xfffc000123456800



#define ERR_BITS                0x2
#define ERR_BITS_EXPECT         0x8000000000000002


#define SOC_NCU_SYN_REG	 0x8000003038
#define SOC_SII_SYN_REG	 0x8000003030
    
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

	clr	%i7
	clr	%o6
	clr	%o7
	clr	%i0

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
uev1:
        nop

inj_err_rdd:
        nop			!$EV trig_pc_d(0,@VA(.MAIN.inj_err_rdd)) ->IosErrInj(ERR_TYPE, 0, 123456000)


dma_rdd:
	nop
UsrEvnt_rdd:
        nop         ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_rdd)) -> EnablePCIeIgCmd ("DMARD_DROP", DMA_DATA_BYP_ADDR1, DMA_DATA_BYP_ADDR1, "64'h40", 1, *, * )

        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3

esr_rdd:
        set	0x1, %i1
	sllx	%i1, ERR_FIELD, %g1
	setx	0x8000000000000000, %g7, %g2
	or	%g1, %g2, %g5

!        setx    ERR_BITS_EXPECT, %g7, %g5
        setx    SOC_ESR_REG, %g7, %g2
        setx    0x5, %g7, %g6			! temporarily
esr_loop_rdd:
        dec     %g6
        cmp     %g6, %g0
        be      %xcc, test_failed
        nop

        ldx     [%g2], %g3

        cmp     %g3, %g5
        be      %xcc, eie_reg_ones_rdd
        nop

        ba      esr_loop_rdd
        nop


eie_reg_ones_rdd:
        setx    SOC_EIE_REG, %g3, %g2
	setx	0xffffffffffffffff, %g3, %g1
        stx     %g1, [%g2]
        membar  0x40

	set	0x1, %g1			! 1 Trap for NCU DmuDParity
						! Sets E bit
						! For RDD, SII does not set PA39, So no trap from L2 
        setx    0x100, %g7, %g6
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



       /*******************************************************
                WRI from DMU
        ********************************************************/
dma_wri:
	nop

inj_err_wri:
	nop					 !$EV trig_pc_d(0,@VA(.MAIN.inj_err_wri)) ->IosErrInj(ERR_TYPE, 0, 123456780)


        membar  0x40

UsrEvnt_wri:
        nop         ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR2, DMA_DATA_BYP_ADDR2, "64'h40", 1, *, * )

        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3

esr_wri:
        set	0x1, %i1
	sllx    %i1, ERR_FIELD, %g1
        setx    0x8000000000000000, %g7, %g2
        or      %g1, %g2, %g5

!        setx    ERR_BITS_EXPECT, %g7, %g5
        setx    SOC_ESR_REG, %g7, %g2
        setx    0x100, %g7, %g6
esr_loop_wri:
        dec     %g6
        cmp     %g6, %g0
        be      %xcc, test_failed
        nop

        ldx     [%g2], %g3

        cmp     %g3, %g5
        be      %xcc, eie_reg_ones_wri
        nop

        ba      esr_loop_wri
        nop

eie_reg_ones_wri:
        setx    SOC_EIE_REG, %g3, %g2
	setx	0xffffffffffffffff, %g3, %g1
        stx     %g1, [%g2]
        membar  0x40

        set     0x2, %g1                       	! 1 trap from rdd; 1 trap from WRI 
        setx    0x100, %g7, %g6
err_trap_loop_wri:
        cmp     %g6, %g0
        be      %xcc, test_failed
        nop

        cmp     %g1, %i7
        be      %xcc, check_tt_wri
        nop

        ba      err_trap_loop_wri
        nop

check_tt_wri:
        mov     0x40, %l0
        cmp     %o7, %l0
        bne     %xcc, test_failed
        nop


       /*******************************************************
                WRM from DMU
        ********************************************************/
dma_wrm:
	nop

inj_err_wrm:
	nop					 !$EV trig_pc_d(0,@VA(.MAIN.inj_err_wrm)) ->IosErrInj(ERR_TYPE, 0, 123456800)



UsrEvnt_wrm:
        nop         ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wrm)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR3, DMA_DATA_BYP_ADDR3, "64'h10", 1, *, * )

        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3

esr_wrm:
        set     0x1, %i1
        sllx    %i1, ERR_FIELD, %g1
        setx    0x8000000000000000, %g7, %g2
        or      %g1, %g2, %g5
!        setx    ERR_BITS_EXPECT, %g7, %g5
        setx    SOC_ESR_REG, %g7, %g2
        setx    0x100, %g7, %g6
esr_loop_wrm:
        dec     %g6
        cmp     %g6, %g0
        be      %xcc, test_failed
        nop

        ldx     [%g2], %g3

        cmp     %g3, %g5
        be      %xcc, eie_reg_ones_wrm
        nop

        ba      esr_loop_wrm
        nop


eie_reg_ones_wrm:
        setx    SOC_EIE_REG, %g3, %g2
	setx	0xffffffffffffffff, %g3, %g1
        stx     %g1, [%g2]
        membar  0x40

        set     0x4, %g1                       	! 1 trap from rdd
						! 1 trap from wri 
						! 2 Traps from WRM ; one for NCU CtagUe another from L2 DAU 
        setx    0x100, %g7, %g6
err_trap_loop_wrm:
        cmp     %g6, %g0
        be      %xcc, test_failed
        nop

        cmp     %g1, %i7
        be      %xcc, check_tt_wrm
        nop

        ba      err_trap_loop_wrm
        nop

check_tt_wrm:
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

/*
check_Syndromes:
	setx	SOC_SII_SYN_REG, %g7, %g1
	ldx	[%g1], %g2

	setx	SII_SYND, %g7, %g3

	cmp	%g2, %g3
	bne	%xcc, test_failed
	nop
*/


check_desr_NcuTrap_tt40:
        ldxa  [%g0]0x4c, %g2
        nop

        setx    0xb300000000000000, %l0, %g3
        subcc   %g2, %g3, %g4
        brnz    %g4, l2_trap 
	nop

check_per_tt40:
        set     0x1, %i1
        sllx    %i1, ERR_FIELD, %g1
        setx    0x8000000000000000, %g7, %g2
        or      %g1, %g2, %g5

!       setx    ERR_BITS_EXPECT, %g7, %g5    !valid bit

        setx    SOC_PER_REG, %l7, %g1
        ldx     [%g1], %g2

        sub     %g2, %g5, %g3
        brnz    %g3, test_failed
        nop

clear_per_tt40:
        setx    SOC_PER_REG, %l7, %g1
        stx     %g0, [%g1]
        nop

clear_ejr_tt40:
        setx    SOC_EJR_REG, %l7, %g1
        stx     %g0, [%g1]
        nop

clear_eie_tt40:
        setx    SOC_EIE_REG, %l7, %g1
        stx     %g0, [%g1]
        nop

clear_siisynd_tt40:
	setx	SOC_SII_ERR_SYND_REG, %l7, %g1
	stx	%g0, [%g1]
	nop

	ba	trap_done_tt40
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
        sllx    %l1, DRAM_ES_DBU, %l0

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

        setx  	0xfffffffff0000000, %l3, %l0
        andcc 	%l0, %l6, %l5                   ! Donot check L2ESR SYND bits

        mov   	0x1, %l1
        sllx  	%l1, L2ES_DAU, %l0

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

