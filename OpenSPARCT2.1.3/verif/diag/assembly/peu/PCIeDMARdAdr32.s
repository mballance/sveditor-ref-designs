/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeDMARdAdr32.s
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

#define MEM32_WR_ADDR 		   mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)

#define DMA_DATA_ADDR		   0x007f0000

#define DMA_ADDR_1		   mpeval(DMA_DATA_ADDR + 0*256, 16, 16)
#define DMA_ADDR_2		   mpeval(DMA_DATA_ADDR + 1*256, 16, 16)

#define IOMMU_TTE_ADDR		   0x40000000

! Bit 8 = Page Size: 0=8KB, 1=64KB;  Bits 3:0 = TSB Table size:	6=64k entries 
#define MMU_TSB_CNTRL_REG_DATA	   mpeval(IOMMU_TTE_ADDR | 0x100 | 6)


/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

! enable SUN4U translation in the IOMMU
	
	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
	setx	0x00301, %g1, %g3	! 9:8 11 = Cache enabled, 0: 1 = translation enabled
	stx	%g3, [%g2]
	ldx	[%g2], %g3
	
! load address of the TSB table, and the page size (64KB)
	
	setx	FIRE_DLC_MMU_CSR_A_TSB_ADDR, %g1, %g2
	setx	MMU_TSB_CNTRL_REG_DATA, %g1, %g3
	stx	%g3, [%g2]
	ldx	[%g2], %g3
	
! Trigger some DMA Reads of various lengths
	
Xmt1:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt1)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h1", 1 )
	nop
	nop
Xmt2:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt2)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h2", 1 )
	nop
	nop
Xmt3:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt3)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h3", 1 )
	nop
	nop
Xmt4:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt4)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h4", 1 )
	nop
	nop
Xmt5:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt5)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h3f", 1 )
	nop
	nop
Xmt6:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt6)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h40", 1 )
	nop
	nop
Xmt7:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt7)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h41", 1 )
	nop
	nop
Xmt8:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt8)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h7f", 1 )
	nop
	nop
Xmt9:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt9)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h80", 1 )
	nop
	nop
Xmt10:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt10)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h81", 1 )
	nop
	nop
Xmt11:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt11)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'hff", 1 )
	nop
	nop
Xmt12:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt12)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h100", 1 )
	nop
	nop
Xmt13:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt13)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h101", 1 )
	nop
	nop
Xmt14:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt14)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h1ff", 1 )
	nop
	nop
Xmt15:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt15)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h200", 1 )
	nop
	nop
Xmt16:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt16)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h400", 1 )
	nop
	nop
Xmt17:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt17)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h800", 1 )
	nop
	nop
Xmt18:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt18)) -> EnablePCIeIgCmd ("DMARD", DMA_ADDR_1, DMA_ADDR_2, "64'h1000", 1 )
	nop
	nop
	nop

	! select a MEM32 address in PCI address range and transmit the command to NCU
	
	setx    MEM32_WR_ADDR, %g1, %g2
	setx	0x040, %g1, %g4		! loop 64 times

delay_loop:
	stx	%g2, [%g2]		! MEM32 PIO Write
	ldx	[%g2], %l0		! MEM32 PIO READ
	add	%g2, 8, %g2		! increment PIO  address
	
	dec	%g4			! decrement counter
	brnz	%g4, delay_loop		! loop if not zero
	nop

	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start. Need to set up known data to check on DMA completions
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




/************************************************************************
   IOMMU TTE start
	TTE Format:
63:	48 DEV KEY	- set to 0
47:	39 reserved	- set to 0
38:	13 DATA PA	- set to VA for VA=RA
12:	7  DATA_SOFT	- set to 0
6:	5  reserved	- set to 0
5:	3  FNM MASK	- set to 0
2:	2  KEY VALID	- set to 0
1:	1  DATA_W	- set to 1
0:	0  DATA_V	- set to 1
************************************************************************/

SECTION       .DATA2 DATA_VA=IOMMU_TTE_ADDR
attr_data {     
      Name = .DATA2,
      hypervisor,
      compressimage
}

.data
	.xword 0x0000000000000003
	.xword 0x0000000000010003
	.xword 0x0000000000020003
	.xword 0x0000000000030003
	.xword 0x0000000000040003
	.xword 0x0000000000050003
	.xword 0x0000000000060003
	.xword 0x0000000000070003
	.xword 0x0000000000080003
	.xword 0x0000000000090003
	.xword 0x00000000000a0003
	.xword 0x00000000000b0003
	.xword 0x00000000000c0003
	.xword 0x00000000000d0003
	.xword 0x00000000000e0003
	.xword 0x00000000000f0003
	
	.xword 0x0000000000100003
	.xword 0x0000000000110003
	.xword 0x0000000000120003
	.xword 0x0000000000130003
	.xword 0x0000000000140003
	.xword 0x0000000000150003
	.xword 0x0000000000160003
	.xword 0x0000000000170003
	.xword 0x0000000000180003
	.xword 0x0000000000190003
	.xword 0x00000000001a0003
	.xword 0x00000000001b0003
	.xword 0x00000000001c0003
	.xword 0x00000000001d0003
	.xword 0x00000000001e0003
	.xword 0x00000000001f0003
	
	.xword 0x0000000000200003
	.xword 0x0000000000210003
	.xword 0x0000000000220003
	.xword 0x0000000000230003
	.xword 0x0000000000240003
	.xword 0x0000000000250003
	.xword 0x0000000000260003
	.xword 0x0000000000270003
	.xword 0x0000000000280003
	.xword 0x0000000000290003
	.xword 0x00000000002a0003
	.xword 0x00000000002b0003
	.xword 0x00000000002c0003
	.xword 0x00000000002d0003
	.xword 0x00000000002e0003
	.xword 0x00000000002f0003
	
	.xword 0x0000000000300003
	.xword 0x0000000000310003
	.xword 0x0000000000320003
	.xword 0x0000000000330003
	.xword 0x0000000000340003
	.xword 0x0000000000350003
	.xword 0x0000000000360003
	.xword 0x0000000000370003
	.xword 0x0000000000380003
	.xword 0x0000000000390003
	.xword 0x00000000003a0003
	.xword 0x00000000003b0003
	.xword 0x00000000003c0003
	.xword 0x00000000003d0003
	.xword 0x00000000003e0003
	.xword 0x00000000003f0003
	
	.xword 0x0000000000400003
	.xword 0x0000000000410003
	.xword 0x0000000000420003
	.xword 0x0000000000430003
	.xword 0x0000000000440003
	.xword 0x0000000000450003
	.xword 0x0000000000460003
	.xword 0x0000000000470003
	.xword 0x0000000000480003
	.xword 0x0000000000490003
	.xword 0x00000000004a0003
	.xword 0x00000000004b0003
	.xword 0x00000000004c0003
	.xword 0x00000000004d0003
	.xword 0x00000000004e0003
	.xword 0x00000000004f0003
	
	.xword 0x0000000000500003
	.xword 0x0000000000510003
	.xword 0x0000000000520003
	.xword 0x0000000000530003
	.xword 0x0000000000540003
	.xword 0x0000000000550003
	.xword 0x0000000000560003
	.xword 0x0000000000570003
	.xword 0x0000000000580003
	.xword 0x0000000000590003
	.xword 0x00000000005a0003
	.xword 0x00000000005b0003
	.xword 0x00000000005c0003
	.xword 0x00000000005d0003
	.xword 0x00000000005e0003
	.xword 0x00000000005f0003
	
	.xword 0x0000000000600003
	.xword 0x0000000000610003
	.xword 0x0000000000620003
	.xword 0x0000000000630003
	.xword 0x0000000000640003
	.xword 0x0000000000650003
	.xword 0x0000000000660003
	.xword 0x0000000000670003
	.xword 0x0000000000680003
	.xword 0x0000000000690003
	.xword 0x00000000006a0003
	.xword 0x00000000006b0003
	.xword 0x00000000006c0003
	.xword 0x00000000006d0003
	.xword 0x00000000006e0003
	.xword 0x00000000006f0003
	
	.xword 0x0000000000700003
	.xword 0x0000000000710003
	.xword 0x0000000000720003
	.xword 0x0000000000730003
	.xword 0x0000000000740003
	.xword 0x0000000000750003
	.xword 0x0000000000760003
	.xword 0x0000000000770003
	.xword 0x0000000000780003
	.xword 0x0000000000790003
	.xword 0x00000000007a0003
	.xword 0x00000000007b0003
	.xword 0x00000000007c0003
	.xword 0x00000000007d0003
	.xword 0x00000000007e0003
	.xword 0x00000000007f0003
	
	.xword 0x0000000000800003
	.xword 0x0000000000810003
	.xword 0x0000000000820003
	.xword 0x0000000000830003
	.xword 0x0000000000840003
	.xword 0x0000000000850003
	.xword 0x0000000000860003
	.xword 0x0000000000870003
	.xword 0x0000000000880003
	.xword 0x0000000000890003
	.xword 0x00000000008a0003
	.xword 0x00000000008b0003
	.xword 0x00000000008c0003
	.xword 0x00000000008d0003
	.xword 0x00000000008e0003
	.xword 0x00000000008f0003
	
	
/************************************************************************/
