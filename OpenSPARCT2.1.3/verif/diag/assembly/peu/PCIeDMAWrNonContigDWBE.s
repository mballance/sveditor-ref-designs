/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeDMAWrNonContigDWBE.s
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
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"
#include "peu_defines.h"

#define DMA_DATA_ADDR        0x0000000123456000
	
#define DMA_ADDR_1           0xfffc000123456000 
#define DMA_ADDR_2           0xfffc000123456040 
#define DMA_ADDR_3           0xfffc000123456080 
#define DMA_ADDR_4           0xfffc0001234560c0 
#define DMA_ADDR_5           0xfffc000123456100 
#define DMA_ADDR_6           0xfffc000123456140 
#define DMA_ADDR_7           0xfffc000123456180 
#define DMA_ADDR_8           0xfffc0001234561c0 
#define DMA_ADDR_9           0xfffc000123456200 
#define DMA_ADDR_10          0xfffc000123456240 
#define DMA_ADDR_11          0xfffc000123456280 
#define DMA_ADDR_12          0xfffc0001234562c0 
#define DMA_ADDR_13          0xfffc000123456300 
#define DMA_ADDR_14          0xfffc000123459340 
#define DMA_ADDR_15          0xfffc00012345a380 
#define DMA_ADDR_16          0xfffc00012345b3c0 
#define DMA_ADDR_17          0xfffc00012345c400


/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

! Trigger some DMA Writes of 1 DW with non-contiguous FirstDWBE = 0101, 1001, 1010, 1011, 1101
	
Xmt1:	nop 
! $EV trig_pc_d(1, @VA(.MAIN.Xmt1)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_1, 0x05, "64'h4", 1 )
	nop
	nop
Xmt2:	nop 
! $EV trig_pc_d(1, @VA(.MAIN.Xmt2)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_2, 0x09, "64'h4", 1 )
	nop
	nop
Xmt3:	nop 
! $EV trig_pc_d(1, @VA(.MAIN.Xmt3)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_3, 0x0a, "64'h4", 1 )
	nop
	nop
Xmt4:	nop 
! $EV trig_pc_d(1, @VA(.MAIN.Xmt4)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_4, 0x0b, "64'h4", 1 )
	nop
	nop
Xmt5:	nop 
! $EV trig_pc_d(1, @VA(.MAIN.Xmt5)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_5, 0x0d, "64'h4", 1 )
	nop
	nop

! Trigger some DMA Writes of 2 DW with non-contiguous LastDWBE
	
	nop
	nop
Xmt6:	nop 
! $EV trig_pc_d(1, @VA(.MAIN.Xmt6)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_6, 0x55, "64'h8", 1 )
	nop
	nop
Xmt7:	nop 
! $EV trig_pc_d(1, @VA(.MAIN.Xmt7)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_7, 0x99, "64'h8", 1 )
	nop
	nop
Xmt8:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt8)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_8, 0xaa, "64'h8", 1 )
	nop
	nop
Xmt9:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt9)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_9, 0xbb, "64'h8", 1 )
	nop
	nop
Xmt10:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt10)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_10, 0xdd, "64'h8", 1 )
	nop
	nop
	nop
Xmt11:	nop 
! $EV trig_pc_d(1, @VA(.MAIN.Xmt11)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_11, 0x54, "64'h8", 1 )
	nop
	nop
Xmt12:	nop 
! $EV trig_pc_d(1, @VA(.MAIN.Xmt12)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_12, 0x92, "64'h8", 1 )
	nop
	nop
Xmt13:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt13)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_13, 0xa1, "64'h8", 1 )
	nop
	nop
Xmt14:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt14)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_14, 0xb3, "64'h8", 1 )
	nop
	nop
Xmt15:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt15)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_15, 0xd6, "64'h8", 1 )
	nop
	nop
Xmt16:	nop         
! $EV trig_pc_d(1, @VA(.MAIN.Xmt16)) -> EnablePCIeIgCmd ("DMAWR_DWBE", DMA_ADDR_16, 0xd7, "64'h8", 1 )
	nop
	nop
	nop

	! select a MEM32 address in PCI address range and transmit the command to NCU
	
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g1, %g3
	setx	0x010, %g1, %g4		! loop 16 times

delay_loop:
	ldx	[%g3], %l1		! PIU CSR READ
	add	%g2, 8, %g2		! increment PIO  address
	
	dec	%g4			! decrement counter
	brnz	%g4, delay_loop		! loop if not zero
	nop

	! read the data area
	setx    DMA_DATA_ADDR, %g1, %g2
	setx	16, %g1, %g4		! loop 16 times

read_loop:
	ldx	[%g2], %l1		! Read the data area
	add	%g2, 0x40, %g2		! increment data address
	
	dec	%g4			! decrement counter
	brnz	%g4, read_loop		! loop if not zero
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
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.align 64
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.align 64
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.align 64
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.align 64
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.align 64
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.align 64
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.align 64
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.align 64
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.align 64
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.align 64
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.align 64
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.align 64
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.align 64
	.xword 0xffffffffffffffff
	.xword 0xffffffffffffffff
	.align 64
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.align 64
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.align 64
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	.align 64
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f

/************************************************************************/
