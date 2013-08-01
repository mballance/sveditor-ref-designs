/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeDMAWrAdr64.s
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

!! #define DMA_DATA_ADDR		   0x0000000010000000
!! #define	DMA_DATA_BYP_ADDR	   mpeval(IOMMU_BYP_SADDR + DMA_DATA_ADDR)

#define DMA_DATA_ADDR          0000000123456000
	
#define DMA_ADDR_1           0xfffc000123456000 
#define DMA_ADDR_2           0xfffc000123456100 
#define DMA_ADDR_3           0xfffc000123456200 
#define DMA_ADDR_4           0xfffc000123456300 
#define DMA_ADDR_5           0xfffc000123456400 
#define DMA_ADDR_6           0xfffc000123456500 
#define DMA_ADDR_7           0xfffc000123456600 
#define DMA_ADDR_8           0xfffc000123456700 
#define DMA_ADDR_9           0xfffc000123456800 
#define DMA_ADDR_10          0xfffc000123456900 
#define DMA_ADDR_11          0xfffc000123456a00 
#define DMA_ADDR_12          0xfffc000123456b00 
#define DMA_ADDR_13          0xfffc000123456c00 
#define DMA_ADDR_14          0xfffc000123459000 
#define DMA_ADDR_15          0xfffc00012345a000 
#define DMA_ADDR_16          0xfffc00012345b000 
#define DMA_ADDR_17          0xfffc00012345c000


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

! Trigger some DMA Writes of various lengths
	
Xmt1:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt1)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_1, DMA_ADDR_2, "64'h1", 1 )
	nop
	nop
Xmt2:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt2)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_2, DMA_ADDR_3, "64'h2", 1 )
	nop
	nop
Xmt3:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt3)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_3, DMA_ADDR_4, "64'h3", 1 )
	nop
	nop
Xmt4:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt4)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_4, DMA_ADDR_5, "64'h4", 1 )
	nop
	nop
Xmt5:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt5)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_5, DMA_ADDR_6, "64'h3f", 1 )
	nop
	nop
Xmt6:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt6)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_6, DMA_ADDR_7, "64'h40", 1 )
	nop
	nop
Xmt7:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt7)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_7, DMA_ADDR_8, "64'h41", 1 )
	nop
	nop
Xmt8:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt8)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_8, DMA_ADDR_9, "64'h7f", 1 )
	nop
	nop
Xmt9:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt9)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_9, DMA_ADDR_10, "64'h80", 1 )
	nop
	nop
Xmt10:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt10)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_10, DMA_ADDR_11, "64'h81", 1 )
	nop
	nop
Xmt11:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt11)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_11, DMA_ADDR_12, "64'hff", 1 )
	nop
	nop
Xmt12:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt12)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_12, DMA_ADDR_13, "64'h100", 1 )
	nop
	nop
Xmt13:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt13)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_13, DMA_ADDR_14, "64'h101", 1 )
	nop
	nop
Xmt14:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt14)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_14, DMA_ADDR_15, "64'h1ff", 1 )
	nop
	nop
Xmt15:	nop         ! $EV trig_pc_d(1, @VA(.MAIN.Xmt15)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_15, DMA_ADDR_16, "64'h200", 1 )
	nop
	nop

	! select a MEM32 address in PCI address range and transmit the command to NCU
	
	setx    MEM32_RD_ADDR, %g1, %g2
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g1, %g3
	setx	0x020, %g1, %g4		! loop 32 times

delay_loop:
	ldx	[%g3], %l1		! PIU CSR READ
	!!stx	%g2, [%g2]		! MEM32 PIO Write
	!!ldx	[%g2], %l0		! MEM32 PIO READ
	add	%g2, 8, %g2		! increment PIO  address
	
	dec	%g4			! decrement counter
	brnz	%g4, delay_loop		! loop if not zero
	nop

	
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
.global PCIAddr9
	
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff

/************************************************************************/
