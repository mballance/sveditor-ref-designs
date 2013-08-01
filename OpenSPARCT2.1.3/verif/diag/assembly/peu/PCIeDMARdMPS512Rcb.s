/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeDMARdMPS512Rcb.s
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
#define ENABLE_PCIE_LINK_TRAINING
#define ENABLE_PCIE_MPS_512
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"
#include "peu_defines.h"

#define MEM32_RD_ADDR 		   mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)

#define DMA_DATA_ADDR		   0x0000000123456700
#define	DMA_DATA_BYP_ADDR	   mpeval(IOMMU_BYP_SADDR + DMA_DATA_ADDR)
	
#define DMA_ADDR_1           	   mpeval(DMA_DATA_BYP_ADDR +  5*256, 16, 16)
#define DMA_ADDR_2           	   mpeval(DMA_DATA_BYP_ADDR + 10*256, 16, 16)
#define DMA_ADDR_3           	   mpeval(DMA_DATA_BYP_ADDR + 11*256, 16, 16)
#define DMA_ADDR_4           	   mpeval(DMA_DATA_BYP_ADDR + 12*256, 16, 16)


/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	! enable bypass in IOMMU
	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
	setx	FIRE_DLC_MMU_CSR_A_CTL__BYPASS_EN, %g1, %g3
	stx	%g3, [%g2]
	ldx	[%g2], %g3

! Trigger some DMA Reads of various lengths
	
Xmt1:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt1)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h288", 1 )
	nop
	nop
Xmt2:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt2)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h296", 1 )
	nop
	nop
Xmt3:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt3)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h2aa", 1 )
	nop
	nop
Xmt4:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt4)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h2bb", 1 )
	nop
	nop
Xmt5:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt5)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h2cc", 1 )
	nop
	nop
Xmt6:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt6)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h2dd", 1 )
	nop
	nop
Xmt7:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt7)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h2ee", 1 )
	nop
	nop
Xmt8:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt8)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h2ff", 1 )
	nop
	nop
Xmt9:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt9)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h300", 1 )
	nop
	nop
Xmt10:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt10)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h311", 1 )
	nop
	nop
Xmt11:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt11)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h3ff", 1 )
	nop
	nop
Xmt12:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt12)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h233", 1 )
	nop
	nop
Xmt13:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt13)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h245", 1 )
	nop
	nop
Xmt14:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt14)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h2ff", 1 )
	nop
	nop
Xmt15:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt15)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h333", 1 )
	nop
	nop
Xmt16:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt16)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h400", 1 )
	nop
	nop
	nop
Xmt18:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt18)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h300", 1 )
	nop
	nop

	!!! pick coverage points for a few specific # DWs: 106, 527, and 630
	
Xmt19:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt19)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_2, DMA_ADDR_2, "64'h1a8", 1 )
	nop
	nop
	nop
Xmt20:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt20)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_3, DMA_ADDR_3, "64'h83c", 1 )
	nop
	nop
	nop
Xmt21:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt21)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_4, DMA_ADDR_4, "64'h9d8", 1 )
	nop
	nop

INTA: 
! $EV trig_pc_d(1,@VA(.MAIN.INTA)) -> EnablePCIeIgCmd("DMARD_INTA", DMA_ADDR_2, DMA_ADDR_2, "64'h0",1)			
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_ADDR, %g1, %g2
	mov	100, %g3		! loop count
	mov	8, %g4			! INTA asserted bit
	
inta_wait:
	ldx	[%g2], %g5
	cmp     %g4,%g5
	be	got_inta
	
	dec	%g3
	cmp	%g3, 0
	bne	inta_wait
	nop

test_failed0:
! $EV trig_pc_d(1, @VA(.MAIN.test_failed0)) -> printf("\n ERROR: timeout while waiting for INTA\n")
	EXIT_BAD
	nop

got_inta:	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


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
