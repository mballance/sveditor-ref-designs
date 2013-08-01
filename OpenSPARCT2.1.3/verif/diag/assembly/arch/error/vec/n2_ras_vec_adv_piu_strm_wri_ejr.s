/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ras_vec_adv_piu_strm_wri_ejr.s
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

#define  DRAM_0_ERR_STAT_REG              0x8400000280
#define  DRAM_1_ERR_STAT_REG              0x8400001280
#define  DRAM_2_ERR_STAT_REG              0x8400002280
#define  DRAM_3_ERR_STAT_REG              0x8400003280

#define  L2_0_ERR_STAT_REG                0xAB00000000
#define  L2_1_ERR_STAT_REG                0xAB00000040
#define  L2_2_ERR_STAT_REG                0xAB00000080
#define  L2_3_ERR_STAT_REG                0xAB000000c0
#define  L2_4_ERR_STAT_REG                0xAB00000100
#define  L2_5_ERR_STAT_REG                0xAB00000140
#define  L2_6_ERR_STAT_REG                0xAB00000180
#define  L2_7_ERR_STAT_REG                0xAB000001c0


#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"

#define DMA_DATA_ADDR           0x0000000123456700

#define DMA_DATA_BYP_ADDR1      0xfffc000123410000
#define DMA_DATA_BYP_ADDR2      0xfffc000123410200
#define DMA_DATA_BYP_ADDR3      0xfffc000123410400
#define DMA_DATA_BYP_ADDR4      0xfffc000123410600
#define DMA_DATA_BYP_ADDR5      0xfffc000123410800
#define DMA_DATA_BYP_ADDR6      0xfffc000123410a00
#define DMA_DATA_BYP_ADDR7      0xfffc000123410c00
#define DMA_DATA_BYP_ADDR8      0xfffc000123410e00
#define DMA_DATA_BYP_ADDR9      0xfffc000123411000
#define DMA_DATA_BYP_ADDR10     0xfffc000123411200
#define DMA_DATA_BYP_ADDR11     0xfffc000123411400
#define DMA_DATA_BYP_ADDR12     0xfffc000123411600
#define DMA_DATA_BYP_ADDR13     0xfffc000123411800
#define DMA_DATA_BYP_ADDR14     0xfffc000123411a00
#define DMA_DATA_BYP_ADDR15     0xfffc000123411c00
#define DMA_DATA_BYP_ADDR16     0xfffc000123411e00
#define DMA_DATA_BYP_ADDR17	0xfffc000123412000
#define DMA_DATA_BYP_ADDR18	0xfffc000123412200
#define DMA_DATA_BYP_ADDR19     0xfffc000123412400
#define DMA_DATA_BYP_ADDR20	0xfffc000123412600
#define DMA_DATA_BYP_ADDR21     0xfffc000123412800
#define DMA_DATA_BYP_ADDR22     0xfffc000123412a00
#define DMA_DATA_BYP_ADDR23     0xfffc000123412c00


#define ERR_BITS                0x80
#define ERR_BITS_EXPECT         0x8000000000000080

#define SOC_ERR_STEERING_REG	0x9001041000
    
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


errorsteer:
	ldxa	[%g0]ASI_INTR_ID, %o4			! get the thread id; for core-portable
	setx	SOC_ERR_STEERING_REG, %g7, %g1
	stx	%o4, [%g1]
	membar	0x40

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
set_eie:
        mov     0x1, %g1
        sllx    %g1, ERR_FIELD, %g2
        setx    SOC_EIE_REG, %g7, %g3
        stx     %g2, [%g3]
        membar  0x40


set_ejr_1:
        setx    SOC_EJR_REG, %g7, %g6
        stx     %g2, [%g6]
        membar  0x40


UsrEvnt_wri_1:
	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_1)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR1, DMA_DATA_BYP_ADDR1, "64'h40", 1, *, * )

	setx	0x100, %g7, %g5
chk_ejr_1:
	cmp	%g5, %g0
	be	%xcc, test_failed
	nop

	ldx	[%g6], %g1
	cmp	%g1, %g0
	be	%xcc, UsrEvnt_wri_2 
	nop

	dec	%g5

	ba	chk_ejr_1
	nop

UsrEvnt_wri_2:
	nop
	nop
	nop
	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_2)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR2, DMA_DATA_BYP_ADDR2, "64'h40", 1, *, * )

UsrEvnt_wri_3:
	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_3)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR3, DMA_DATA_BYP_ADDR3, "64'h40", 1, *, * )

UsrEvnt_wri_4:
	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_4)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR4, DMA_DATA_BYP_ADDR4, "64'h40", 1, *, * )

UsrEvnt_wri_5:
	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_5)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR5, DMA_DATA_BYP_ADDR5, "64'h40", 1, *, * )

UsrEvnt_wri_6:
	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_6)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR6, DMA_DATA_BYP_ADDR6, "64'h40", 1, *, * )

UsrEvnt_wri_7:
	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_7)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR7, DMA_DATA_BYP_ADDR7, "64'h40", 1, *, * )


set_ejr_2:
	stx	%g2, [%g6]
	membar	0x40


UsrEvnt_wri_8:
	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_8)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR8, DMA_DATA_BYP_ADDR8, "64'h40", 1, *, * )

	setx	0x100, %g7, %g5
chk_ejr_2:
	cmp	%g5, %g0
	be	%xcc, test_failed
	nop

	ldx	[%g6], %g1
	cmp	 %g1, %g0
	be	 %xcc, UsrEvnt_wri_9
	nop

	dec	%g5

	ba	chk_ejr_2
	nop

UsrEvnt_wri_9:
	nop
	nop
	nop

	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_9)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR9, DMA_DATA_BYP_ADDR9, "64'h40", 1, *, * )

UsrEvnt_wri_10:
	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_10)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR10, DMA_DATA_BYP_ADDR10, "64'h40", 1, *, * )

UsrEvnt_wri_11:
	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_11)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR11, DMA_DATA_BYP_ADDR11, "64'h40", 1, *, * )

UsrEvnt_wri_12:
	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_12)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR12, DMA_DATA_BYP_ADDR12, "64'h40", 1, *, * )

UsrEvnt_wri_13:
	nop	    ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_13)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR13, DMA_DATA_BYP_ADDR13, "64'h40", 1, *, * )


set_ejr_3:
        stx     %g2, [%g6]
        membar  0x40

UsrEvnt_wri_14:
        nop         ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_14)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR14, DMA_DATA_BYP_ADDR14, "64'h40", 1, *, * )

	setx	0x100, %g7, %g5
chk_ejr_3:
	cmp	%g5, %g0
	be	%xcc, test_failed
	nop

	ldx	[%g6], %g1
	cmp	 %g1, %g0
	be	 %xcc, UsrEvnt_wri_15
	nop

	dec	%g5

	ba	chk_ejr_3
	nop

UsrEvnt_wri_15:
	nop
	nop
	nop
	nop
	nop	       ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_15)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR15, DMA_DATA_BYP_ADDR15, "64'h40", 1, *, * )

UsrEvnt_wri_16:
	nop	       ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_16)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR16, DMA_DATA_BYP_ADDR16, "64'h40", 1, *, * )

UsrEvnt_wri_17:
	nop	       ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_17)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR17, DMA_DATA_BYP_ADDR17, "64'h40", 1, *, * )

UsrEvnt_wri_18:
	nop	       ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_18)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR18, DMA_DATA_BYP_ADDR18, "64'h40", 1, *, * )

UsrEvnt_wri_19:
	nop	       ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_19)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR19, DMA_DATA_BYP_ADDR19, "64'h40", 1, *, * )

UsrEvnt_wri_20:
	nop	       ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_20)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR20, DMA_DATA_BYP_ADDR20, "64'h40", 1, *, * )

UsrEvnt_wri_21:
	nop	       ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt_wri_21)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR21, DMA_DATA_BYP_ADDR21, "64'h40", 1, *, * )

pios:
	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3

/*
	set	0x3, %g1		
        setx    0x100, %g7, %g5
err_trap_loop_rdd:
        cmp     %g5, %g0
        be      %xcc, test_failed
        nop

	cmp	%g1, %i7
	be	%xcc, check_mcu_esr
	nop

	dec	%g5

	ba	err_trap_loop_rdd
	nop
*/


check_mcu_esr:
        setx  DRAM_0_ERR_STAT_REG, %g7, %g6 
        ldx   [%g6], %g3
        sub     %g3, %g0, %g1
        brnz    %g1, test_failed
        nop

        setx  DRAM_1_ERR_STAT_REG, %g7, %g6  
        ldx   [%g6], %g3
        sub     %g3, %g0, %g1
        brnz    %g1, test_failed
        nop

        setx  DRAM_2_ERR_STAT_REG, %g7, %g6  
        ldx   [%g6], %g3
        sub     %g3, %g0, %g1
        brnz    %g1, test_failed
        nop

        setx  DRAM_3_ERR_STAT_REG, %g7, %g6  
        ldx   [%g6], %g3
        sub     %g3, %g0, %g1
        brnz    %g1, test_failed
        nop

check_L2_ESR:
        setx    L2_0_ERR_STAT_REG, %l3, %g5
        ldx     [%g5], %g3
        sub     %g3, %g0, %g1
        brnz    %g1, test_failed
        nop

        setx    L2_1_ERR_STAT_REG, %l3, %g5
        ldx     [%g5], %g3
        sub     %g3, %g0, %g1
        brnz    %g1, test_failed
        nop

        setx    L2_2_ERR_STAT_REG, %l3, %g5
        ldx     [%g5], %g3
        sub     %g3, %g0, %g1
        brnz    %g1, test_failed
        nop

        setx    L2_3_ERR_STAT_REG, %l3, %g5
        ldx     [%g5], %g3
        sub     %g3, %g0, %g1
        brnz    %g1, test_failed
        nop

        setx    L2_4_ERR_STAT_REG, %l3, %g5
        ldx     [%g5], %g3
        sub     %g3, %g0, %g1
        brnz    %g1, test_failed
        nop

        setx    L2_5_ERR_STAT_REG, %l3, %g5
        ldx     [%g5], %g3
        sub     %g3, %g0, %g1
        brnz    %g1, test_failed
        nop

        setx    L2_6_ERR_STAT_REG, %l3, %g5
        ldx     [%g5], %g3
        sub     %g3, %g0, %g1
        brnz    %g1, test_failed
        nop

        setx    L2_7_ERR_STAT_REG, %l3, %g5
        ldx     [%g5], %g3
        sub     %g3, %g0, %g1
        brnz    %g1, test_failed
        nop


check_tt_rdd:
        mov     0x40, %l0
        cmp     %o7, %l0
        bne     %xcc, test_failed
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
        brnz    %g4, test_failed 
	nop

check_per_tt40:
        mov     0x1, %g1
        sllx    %g1, ERR_FIELD, %g2
        setx    0x8000000000000000, %g7, %g3
        or      %g2, %g3, %g1

        setx    SOC_PER_REG, %g7, %g2
        ldx     [%g2], %g3

        cmp     %g1, %g3
        bne     %xcc, test_failed
        nop

clear_per_tt40:
        setx    SOC_PER_REG, %l7, %g1
        stx     %g0, [%g1]
        nop

clear_ejr_tt40:
	setx	SOC_EJR_REG, %l7, %g1
	stx	%g0, [%g1]
	nop

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

