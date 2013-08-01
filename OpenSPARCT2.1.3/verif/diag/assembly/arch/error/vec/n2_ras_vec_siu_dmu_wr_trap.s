/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ras_vec_siu_dmu_wr_trap.s
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

#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"

#define DMA_DATA_ADDR           0x0000000123456700
#define DMA_DATA_BYP_ADDR1      0xfffc000123456700
#define DMA_DATA_BYP_ADDR2      0xfffc000123456780
#define DMA_DATA_BYP_ADDR3      0xfffc000123456800

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



errorsteer:
	ldxa	[%g0]ASI_INTR_ID, %o4			! get the thread id; for core-portable
	setx	SOC_ERR_STEERING_REG, %g7, %g1
	stx	%o4, [%g1]
	membar	0x40

	/*********************************
		RAS
	*********************************/
set_ejr:
        set     0x1, %i1
        sllx    %i1, ERR_FIELD, %i2
        setx    SOC_EJR_REG, %l7, %i3
        stx     %i2, [%i3]
        membar  0x40

eie_reg_ones:
        setx    SOC_EIE_REG, %l7, %g5
        stx     %i2, [%g5]
        membar  0x40

	/********************************/

        ! enable bypass in IOMMU
        setx    FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
        setx    FIRE_DLC_MMU_CSR_A_CTL__BYPASS_EN, %g1, %g3
        stx     %g3, [%g2]
        ldx     [%g2], %g3

XmtUsrEvnt1: nop;
        ! $EV trig_pc_d(1, @VA(.MAIN.XmtUsrEvnt1)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR1, DMA_DATA_BYP_ADDR1, "64'h20", 1 )
        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3

	
        ! select a CSR in the PIU and transmit the command to NCU

        setx    FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g1, %g2
        setx    0x020, %g1, %g4

delay_loop:
        ldx     [%g2], %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop
        nop

        setx    SOC_ESR_REG, %l7, %i0
        ldx     [%i0], %i1
        nop

        /*********************************
                RAS
        *********************************/
        ! ESR is cleared in INT
        ! but the next error causes it to log again;
        ! Get from Uday a diag which has just 1 DMA

/*
check_esr:
        setx    SOC_ESR_REG, %l7, %i0
        ldx     [%i0], %i1
!        sub     %i1, %g0, %i5
!        brnz    %i5, test_failed
!        nop

        setx    0x8000000000000000, %l7, %o3    !valid bit
        set     0x1, %i2
        sllx    %i2, ERR_FIELD, %i3
        or      %i3, %o3, %i4
        sub     %i1, %i4, %i5
        brnz    %i5, test_failed
        nop
*/


  ! Check if a Corrected ECC Trap happened
check_error_trap:
        setx  EXECUTED, %l1, %l0
        cmp   %o6, %l0
        bne   test_failed
        nop
        mov   TT, %l0
        cmp   %o7, %l0
        bne   test_failed
        nop

        /********************************/

	
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

check_desr_tt40:
        ldxa  [%g0]0x4c, %g2
        nop
        setx    0xb300000000000000, %l0, %g3
        subcc   %g2, %g3, %g4
        brnz    %g4, test_failed 
	nop

check_per_tt40:
        setx    SOC_PER_REG, %l7, %i0
        ldx     [%i0], %i1
        setx    0x8000000000000000, %l7, %o3    !valid bit
        set     0x1, %i2
        sllx    %i2, ERR_FIELD, %i3
        or      %i3, %o3, %i4
        sub     %i1, %i4, %i5
        brnz    %i5, test_failed
        nop

clear_per_tt40:
        setx    SOC_PER_REG, %l7, %i0
        stx     %g0, [%i0]
        nop
       	done 
        nop



My_Corrected_ECC_error_trap:
        ! Signal trap taken
        setx  EXECUTED, %l0, %o6
        ! save trap type value
        rdpr  %tt, %o7

check_desr_tt63:
        ldxa  [%g0]0x4c, %g2
        nop
        setx    0x8b00000000000000, %l0, %g3
        subcc   %g2, %g3, %g4
        brnz    %g4, test_failed 

check_per_tt63:
        setx    SOC_PER_REG, %l7, %i0
        ldx     [%i0], %i1
        setx    0x8000000000000000, %l7, %o3    !valid bit
        set     0x1, %i2
        sllx    %i2, ERR_FIELD, %i3
        or      %i3, %o3, %i4
        sub     %i1, %i4, %i5
        brnz    %i5, test_failed
        nop

clear_per_tt63:
        setx    SOC_PER_REG, %l7, %i0
        stx     %g0, [%i0]
        nop
        done
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

