/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeIommu4V64kTr.s
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

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
        call    my_trap_code; \
        nop; \
        retry; \
        nop; 

#include "hboot.s"
#include "peu_defines.h"
#include "ncu_defines.h"

#define MEM32_WR_ADDR 		   mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)

#define DMA_DATA_ADDR		   0x007f0000

#define IOMMU_TTE_ADDR		   0x40000000

! Bits 6:4 = Page Size: 0=8KB, 1=64KB, 3=4MB, 6=256MB;  Bits 3:0 = TSB Table size: 6=64k entries 
#define IOTSBDESC_1_DATA	   mpeval((1<<63)|(IOMMU_TTE_ADDR << 21) | (1 << 4) | 0x6)


/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

! enable interrupts & provide basic handler
#include "piu_rupt_enable.s"

! enable SUN4U translation in the IOMMU
	
write_mmu_ctl_reg:
	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
	setx	0x00307, %g1, %g3	! 9:8 11 = Cache enabled, 
					! 3: 1 = Busid Select, 1 = use busid[5:0] for DEV2IOTSB index
					! 2: 1 = SUN4V enabled,
					! 1: 1 = bypass enabled, 
					! 0: 1 = translation enabled
	stx	%g3, [%g2]
	ldx	[%g2], %g3
	
! setup the DEV2IOTSB - the all busids map to IOTSBDESC ram entry 1
! (currently it looks like the denali transactor (or vera wrapper) is generating
! a random busid, so map them all to IOTSB 1.
	
write_dev2iotsb:
	setx	FIRE_DLC_MMU_CSR_A_DEV2IOTSB_ADDR, %g1, %g2
	setx    0x0101010101010101,  %g1, %g3
	stx	%g3, [%g2 + 0x00]
	stx	%g3, [%g2 + 0x08]
	stx	%g3, [%g2 + 0x10]
	stx	%g3, [%g2 + 0x18]
	stx	%g3, [%g2 + 0x20]
	stx	%g3, [%g2 + 0x28]
	stx	%g3, [%g2 + 0x30]
	stx	%g3, [%g2 + 0x38]
	stx	%g3, [%g2 + 0x40]
	stx	%g3, [%g2 + 0x48]
	stx	%g3, [%g2 + 0x50]
	stx	%g3, [%g2 + 0x58]
	stx	%g3, [%g2 + 0x60]
	stx	%g3, [%g2 + 0x68]
	stx	%g3, [%g2 + 0x70]
	stx	%g3, [%g2 + 0x78]
	
! setup entry 1 of the IOTSBDESC ram 
	
write_iotsbdesc:
	setx	FIRE_DLC_MMU_CSR_A_IOTSBDESC_ADDR, %g1, %g2
	setx	IOTSBDESC_1_DATA, %g1, %g3
	stx	%g3, [%g2 + 8]
	ldx	[%g2], %g3
	

! Trigger some DMA Reads of various lengths
	
! Created 09/11/2005 17:27:05 by /home/somePerson/bin/genDMAs.pl 
	setx  0x007f0000, %g1, %g2	! DMA start address
	setx  0x00010000, %g1, %g3	! page size
#define DMA_ADDR_01 mpeval(0x007f0000 + 0,16,16)
#define DMA_ADDR_02 mpeval(0x007f0000 + 64,16,16)
#define DMA_ADDR_03 mpeval(0x007f0000 + 128,16,16)
DMA0: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA0)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_01, DMA_ADDR_02, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 0x00], %g4
	ldx  [%g2 + 0x08], %g5
	ldx  [%g2 + 0x10], %g6
	ldx  [%g2 + 0x18], %g4
	ldx  [%g2 + 0x20], %g5
	ldx  [%g2 + 0x28], %g6
	ldx  [%g2 + 0x30], %g4
	ldx  [%g2 + 0x38], %g5
	ldx  [%g2 + 0x40], %g6
	ldx  [%g2 + 0x48], %g4
	ldx  [%g2 + 0x50], %g5
	ldx  [%g2 + 0x58], %g6
	ldx  [%g2 + 0x60], %g4
	ldx  [%g2 + 0x68], %g5
	ldx  [%g2 + 0x70], %g6
	ldx  [%g2 + 0x78], %g4
	ldx  [%g2 + 0x80], %g5
	ldx  [%g2 + 0x88], %g6
	ldx  [%g2 + 0x90], %g4
	ldx  [%g2 + 0x98], %g5
	ldx  [%g2 + 0xa0], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_11 mpeval(0x00800000 + 0,16,16)
#define DMA_ADDR_12 mpeval(0x00800000 + 64,16,16)
#define DMA_ADDR_13 mpeval(0x00800000 + 128,16,16)
DMA1: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA1)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_11, DMA_ADDR_12, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_21 mpeval(0x00810000 + 0,16,16)
#define DMA_ADDR_22 mpeval(0x00810000 + 64,16,16)
#define DMA_ADDR_23 mpeval(0x00810000 + 128,16,16)
DMA2: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA2)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_21, DMA_ADDR_22, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_31 mpeval(0x00820000 + 0,16,16)
#define DMA_ADDR_32 mpeval(0x00820000 + 64,16,16)
#define DMA_ADDR_33 mpeval(0x00820000 + 128,16,16)
DMA3: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA3)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_31, DMA_ADDR_32, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_41 mpeval(0x00830000 + 0,16,16)
#define DMA_ADDR_42 mpeval(0x00830000 + 64,16,16)
#define DMA_ADDR_43 mpeval(0x00830000 + 128,16,16)
DMA4: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA4)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_41, DMA_ADDR_42, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_51 mpeval(0x00840000 + 0,16,16)
#define DMA_ADDR_52 mpeval(0x00840000 + 64,16,16)
#define DMA_ADDR_53 mpeval(0x00840000 + 128,16,16)
DMA5: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA5)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_51, DMA_ADDR_52, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_61 mpeval(0x00850000 + 0,16,16)
#define DMA_ADDR_62 mpeval(0x00850000 + 64,16,16)
#define DMA_ADDR_63 mpeval(0x00850000 + 128,16,16)
DMA6: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA6)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_61, DMA_ADDR_62, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_71 mpeval(0x00860000 + 0,16,16)
#define DMA_ADDR_72 mpeval(0x00860000 + 64,16,16)
#define DMA_ADDR_73 mpeval(0x00860000 + 128,16,16)
DMA7: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA7)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_71, DMA_ADDR_72, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_81 mpeval(0x00870000 + 0,16,16)
#define DMA_ADDR_82 mpeval(0x00870000 + 64,16,16)
#define DMA_ADDR_83 mpeval(0x00870000 + 128,16,16)
DMA8: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA8)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_81, DMA_ADDR_82, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_91 mpeval(0x00880000 + 0,16,16)
#define DMA_ADDR_92 mpeval(0x00880000 + 64,16,16)
#define DMA_ADDR_93 mpeval(0x00880000 + 128,16,16)
DMA9: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA9)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_91, DMA_ADDR_92, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_101 mpeval(0x00890000 + 0,16,16)
#define DMA_ADDR_102 mpeval(0x00890000 + 64,16,16)
#define DMA_ADDR_103 mpeval(0x00890000 + 128,16,16)
DMA10: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA10)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_101, DMA_ADDR_102, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_111 mpeval(0x008a0000 + 0,16,16)
#define DMA_ADDR_112 mpeval(0x008a0000 + 64,16,16)
#define DMA_ADDR_113 mpeval(0x008a0000 + 128,16,16)
DMA11: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA11)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_111, DMA_ADDR_112, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_121 mpeval(0x008b0000 + 0,16,16)
#define DMA_ADDR_122 mpeval(0x008b0000 + 64,16,16)
#define DMA_ADDR_123 mpeval(0x008b0000 + 128,16,16)
DMA12: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA12)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_121, DMA_ADDR_122, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_131 mpeval(0x008c0000 + 0,16,16)
#define DMA_ADDR_132 mpeval(0x008c0000 + 64,16,16)
#define DMA_ADDR_133 mpeval(0x008c0000 + 128,16,16)
DMA13: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA13)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_131, DMA_ADDR_132, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_141 mpeval(0x008d0000 + 0,16,16)
#define DMA_ADDR_142 mpeval(0x008d0000 + 64,16,16)
#define DMA_ADDR_143 mpeval(0x008d0000 + 128,16,16)
DMA14: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA14)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_141, DMA_ADDR_142, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_151 mpeval(0x008e0000 + 0,16,16)
#define DMA_ADDR_152 mpeval(0x008e0000 + 64,16,16)
#define DMA_ADDR_153 mpeval(0x008e0000 + 128,16,16)
DMA15: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA15)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_151, DMA_ADDR_152, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_161 mpeval(0x008f0000 + 0,16,16)
#define DMA_ADDR_162 mpeval(0x008f0000 + 64,16,16)
#define DMA_ADDR_163 mpeval(0x008f0000 + 128,16,16)
DMA16: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA16)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_161, DMA_ADDR_162, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_171 mpeval(0x00900000 + 0,16,16)
#define DMA_ADDR_172 mpeval(0x00900000 + 64,16,16)
#define DMA_ADDR_173 mpeval(0x00900000 + 128,16,16)
DMA17: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA17)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_171, DMA_ADDR_172, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_181 mpeval(0x00910000 + 0,16,16)
#define DMA_ADDR_182 mpeval(0x00910000 + 64,16,16)
#define DMA_ADDR_183 mpeval(0x00910000 + 128,16,16)
DMA18: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA18)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_181, DMA_ADDR_182, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_191 mpeval(0x00920000 + 0,16,16)
#define DMA_ADDR_192 mpeval(0x00920000 + 64,16,16)
#define DMA_ADDR_193 mpeval(0x00920000 + 128,16,16)
DMA19: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA19)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_191, DMA_ADDR_192, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_201 mpeval(0x00930000 + 0,16,16)
#define DMA_ADDR_202 mpeval(0x00930000 + 64,16,16)
#define DMA_ADDR_203 mpeval(0x00930000 + 128,16,16)
DMA20: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA20)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_201, DMA_ADDR_202, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_211 mpeval(0x00940000 + 0,16,16)
#define DMA_ADDR_212 mpeval(0x00940000 + 64,16,16)
#define DMA_ADDR_213 mpeval(0x00940000 + 128,16,16)
DMA21: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA21)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_211, DMA_ADDR_212, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_221 mpeval(0x00950000 + 0,16,16)
#define DMA_ADDR_222 mpeval(0x00950000 + 64,16,16)
#define DMA_ADDR_223 mpeval(0x00950000 + 128,16,16)
DMA22: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA22)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_221, DMA_ADDR_222, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_231 mpeval(0x00960000 + 0,16,16)
#define DMA_ADDR_232 mpeval(0x00960000 + 64,16,16)
#define DMA_ADDR_233 mpeval(0x00960000 + 128,16,16)
DMA23: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA23)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_231, DMA_ADDR_232, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_241 mpeval(0x00970000 + 0,16,16)
#define DMA_ADDR_242 mpeval(0x00970000 + 64,16,16)
#define DMA_ADDR_243 mpeval(0x00970000 + 128,16,16)
DMA24: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA24)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_241, DMA_ADDR_242, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_251 mpeval(0x00980000 + 0,16,16)
#define DMA_ADDR_252 mpeval(0x00980000 + 64,16,16)
#define DMA_ADDR_253 mpeval(0x00980000 + 128,16,16)
DMA25: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA25)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_251, DMA_ADDR_252, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_261 mpeval(0x00990000 + 0,16,16)
#define DMA_ADDR_262 mpeval(0x00990000 + 64,16,16)
#define DMA_ADDR_263 mpeval(0x00990000 + 128,16,16)
DMA26: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA26)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_261, DMA_ADDR_262, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_271 mpeval(0x009a0000 + 0,16,16)
#define DMA_ADDR_272 mpeval(0x009a0000 + 64,16,16)
#define DMA_ADDR_273 mpeval(0x009a0000 + 128,16,16)
DMA27: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA27)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_271, DMA_ADDR_272, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_281 mpeval(0x009b0000 + 0,16,16)
#define DMA_ADDR_282 mpeval(0x009b0000 + 64,16,16)
#define DMA_ADDR_283 mpeval(0x009b0000 + 128,16,16)
DMA28: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA28)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_281, DMA_ADDR_282, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_291 mpeval(0x009c0000 + 0,16,16)
#define DMA_ADDR_292 mpeval(0x009c0000 + 64,16,16)
#define DMA_ADDR_293 mpeval(0x009c0000 + 128,16,16)
DMA29: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA29)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_291, DMA_ADDR_292, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_301 mpeval(0x009d0000 + 0,16,16)
#define DMA_ADDR_302 mpeval(0x009d0000 + 64,16,16)
#define DMA_ADDR_303 mpeval(0x009d0000 + 128,16,16)
DMA30: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA30)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_301, DMA_ADDR_302, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_311 mpeval(0x009e0000 + 0,16,16)
#define DMA_ADDR_312 mpeval(0x009e0000 + 64,16,16)
#define DMA_ADDR_313 mpeval(0x009e0000 + 128,16,16)
DMA31: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA31)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_311, DMA_ADDR_312, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_321 mpeval(0x009f0000 + 0,16,16)
#define DMA_ADDR_322 mpeval(0x009f0000 + 64,16,16)
#define DMA_ADDR_323 mpeval(0x009f0000 + 128,16,16)
DMA32: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA32)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_321, DMA_ADDR_322, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_331 mpeval(0x00a00000 + 0,16,16)
#define DMA_ADDR_332 mpeval(0x00a00000 + 64,16,16)
#define DMA_ADDR_333 mpeval(0x00a00000 + 128,16,16)
DMA33: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA33)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_331, DMA_ADDR_332, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_341 mpeval(0x00a10000 + 0,16,16)
#define DMA_ADDR_342 mpeval(0x00a10000 + 64,16,16)
#define DMA_ADDR_343 mpeval(0x00a10000 + 128,16,16)
DMA34: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA34)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_341, DMA_ADDR_342, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_351 mpeval(0x00a20000 + 0,16,16)
#define DMA_ADDR_352 mpeval(0x00a20000 + 64,16,16)
#define DMA_ADDR_353 mpeval(0x00a20000 + 128,16,16)
DMA35: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA35)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_351, DMA_ADDR_352, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_361 mpeval(0x00a30000 + 0,16,16)
#define DMA_ADDR_362 mpeval(0x00a30000 + 64,16,16)
#define DMA_ADDR_363 mpeval(0x00a30000 + 128,16,16)
DMA36: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA36)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_361, DMA_ADDR_362, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_371 mpeval(0x00a40000 + 0,16,16)
#define DMA_ADDR_372 mpeval(0x00a40000 + 64,16,16)
#define DMA_ADDR_373 mpeval(0x00a40000 + 128,16,16)
DMA37: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA37)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_371, DMA_ADDR_372, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_381 mpeval(0x00a50000 + 0,16,16)
#define DMA_ADDR_382 mpeval(0x00a50000 + 64,16,16)
#define DMA_ADDR_383 mpeval(0x00a50000 + 128,16,16)
DMA38: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA38)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_381, DMA_ADDR_382, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_391 mpeval(0x00a60000 + 0,16,16)
#define DMA_ADDR_392 mpeval(0x00a60000 + 64,16,16)
#define DMA_ADDR_393 mpeval(0x00a60000 + 128,16,16)
DMA39: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA39)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_391, DMA_ADDR_392, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_401 mpeval(0x00a70000 + 0,16,16)
#define DMA_ADDR_402 mpeval(0x00a70000 + 64,16,16)
#define DMA_ADDR_403 mpeval(0x00a70000 + 128,16,16)
DMA40: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA40)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_401, DMA_ADDR_402, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_411 mpeval(0x00a80000 + 0,16,16)
#define DMA_ADDR_412 mpeval(0x00a80000 + 64,16,16)
#define DMA_ADDR_413 mpeval(0x00a80000 + 128,16,16)
DMA41: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA41)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_411, DMA_ADDR_412, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_421 mpeval(0x00a90000 + 0,16,16)
#define DMA_ADDR_422 mpeval(0x00a90000 + 64,16,16)
#define DMA_ADDR_423 mpeval(0x00a90000 + 128,16,16)
DMA42: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA42)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_421, DMA_ADDR_422, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_431 mpeval(0x00aa0000 + 0,16,16)
#define DMA_ADDR_432 mpeval(0x00aa0000 + 64,16,16)
#define DMA_ADDR_433 mpeval(0x00aa0000 + 128,16,16)
DMA43: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA43)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_431, DMA_ADDR_432, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_441 mpeval(0x00ab0000 + 0,16,16)
#define DMA_ADDR_442 mpeval(0x00ab0000 + 64,16,16)
#define DMA_ADDR_443 mpeval(0x00ab0000 + 128,16,16)
DMA44: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA44)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_441, DMA_ADDR_442, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_451 mpeval(0x00ac0000 + 0,16,16)
#define DMA_ADDR_452 mpeval(0x00ac0000 + 64,16,16)
#define DMA_ADDR_453 mpeval(0x00ac0000 + 128,16,16)
DMA45: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA45)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_451, DMA_ADDR_452, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_461 mpeval(0x00ad0000 + 0,16,16)
#define DMA_ADDR_462 mpeval(0x00ad0000 + 64,16,16)
#define DMA_ADDR_463 mpeval(0x00ad0000 + 128,16,16)
DMA46: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA46)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_461, DMA_ADDR_462, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_471 mpeval(0x00ae0000 + 0,16,16)
#define DMA_ADDR_472 mpeval(0x00ae0000 + 64,16,16)
#define DMA_ADDR_473 mpeval(0x00ae0000 + 128,16,16)
DMA47: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA47)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_471, DMA_ADDR_472, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_481 mpeval(0x00af0000 + 0,16,16)
#define DMA_ADDR_482 mpeval(0x00af0000 + 64,16,16)
#define DMA_ADDR_483 mpeval(0x00af0000 + 128,16,16)
DMA48: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA48)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_481, DMA_ADDR_482, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_491 mpeval(0x00b00000 + 0,16,16)
#define DMA_ADDR_492 mpeval(0x00b00000 + 64,16,16)
#define DMA_ADDR_493 mpeval(0x00b00000 + 128,16,16)
DMA49: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA49)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_491, DMA_ADDR_492, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_501 mpeval(0x00b10000 + 0,16,16)
#define DMA_ADDR_502 mpeval(0x00b10000 + 64,16,16)
#define DMA_ADDR_503 mpeval(0x00b10000 + 128,16,16)
DMA50: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA50)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_501, DMA_ADDR_502, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_511 mpeval(0x00b20000 + 0,16,16)
#define DMA_ADDR_512 mpeval(0x00b20000 + 64,16,16)
#define DMA_ADDR_513 mpeval(0x00b20000 + 128,16,16)
DMA51: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA51)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_511, DMA_ADDR_512, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_521 mpeval(0x00b30000 + 0,16,16)
#define DMA_ADDR_522 mpeval(0x00b30000 + 64,16,16)
#define DMA_ADDR_523 mpeval(0x00b30000 + 128,16,16)
DMA52: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA52)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_521, DMA_ADDR_522, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_531 mpeval(0x00b40000 + 0,16,16)
#define DMA_ADDR_532 mpeval(0x00b40000 + 64,16,16)
#define DMA_ADDR_533 mpeval(0x00b40000 + 128,16,16)
DMA53: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA53)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_531, DMA_ADDR_532, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_541 mpeval(0x00b50000 + 0,16,16)
#define DMA_ADDR_542 mpeval(0x00b50000 + 64,16,16)
#define DMA_ADDR_543 mpeval(0x00b50000 + 128,16,16)
DMA54: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA54)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_541, DMA_ADDR_542, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_551 mpeval(0x00b60000 + 0,16,16)
#define DMA_ADDR_552 mpeval(0x00b60000 + 64,16,16)
#define DMA_ADDR_553 mpeval(0x00b60000 + 128,16,16)
DMA55: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA55)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_551, DMA_ADDR_552, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_561 mpeval(0x00b70000 + 0,16,16)
#define DMA_ADDR_562 mpeval(0x00b70000 + 64,16,16)
#define DMA_ADDR_563 mpeval(0x00b70000 + 128,16,16)
DMA56: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA56)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_561, DMA_ADDR_562, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_571 mpeval(0x00b80000 + 0,16,16)
#define DMA_ADDR_572 mpeval(0x00b80000 + 64,16,16)
#define DMA_ADDR_573 mpeval(0x00b80000 + 128,16,16)
DMA57: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA57)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_571, DMA_ADDR_572, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_581 mpeval(0x00b90000 + 0,16,16)
#define DMA_ADDR_582 mpeval(0x00b90000 + 64,16,16)
#define DMA_ADDR_583 mpeval(0x00b90000 + 128,16,16)
DMA58: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA58)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_581, DMA_ADDR_582, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_591 mpeval(0x00ba0000 + 0,16,16)
#define DMA_ADDR_592 mpeval(0x00ba0000 + 64,16,16)
#define DMA_ADDR_593 mpeval(0x00ba0000 + 128,16,16)
DMA59: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA59)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_591, DMA_ADDR_592, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_601 mpeval(0x00bb0000 + 0,16,16)
#define DMA_ADDR_602 mpeval(0x00bb0000 + 64,16,16)
#define DMA_ADDR_603 mpeval(0x00bb0000 + 128,16,16)
DMA60: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA60)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_601, DMA_ADDR_602, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_611 mpeval(0x00bc0000 + 0,16,16)
#define DMA_ADDR_612 mpeval(0x00bc0000 + 64,16,16)
#define DMA_ADDR_613 mpeval(0x00bc0000 + 128,16,16)
DMA61: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA61)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_611, DMA_ADDR_612, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_621 mpeval(0x00bd0000 + 0,16,16)
#define DMA_ADDR_622 mpeval(0x00bd0000 + 64,16,16)
#define DMA_ADDR_623 mpeval(0x00bd0000 + 128,16,16)
DMA62: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA62)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_621, DMA_ADDR_622, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
#define DMA_ADDR_631 mpeval(0x00be0000 + 0,16,16)
#define DMA_ADDR_632 mpeval(0x00be0000 + 64,16,16)
#define DMA_ADDR_633 mpeval(0x00be0000 + 128,16,16)
DMA63: nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA63)) -> EnablePCIeIgCmd("DMAWR", DMA_ADDR_631, DMA_ADDR_632, "64'h100",1)
	stx  %g2, [%g2]
	ldx  [%g2 + 64], %g4
	ldx  [%g2 + 128], %g5
	ldx  [%g2 + 192], %g6
	add  %g2, %g3, %g2
DMA64: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA64) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_02, DMA_ADDR_03, "64'h80",1)
DMA65: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA65) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_12, DMA_ADDR_13, "64'h80",1)
DMA66: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA66) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_22, DMA_ADDR_23, "64'h80",1)
DMA67: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA67) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_32, DMA_ADDR_33, "64'h80",1)
DMA68: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA68) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_42, DMA_ADDR_43, "64'h80",1)
DMA69: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA69) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_52, DMA_ADDR_53, "64'h80",1)
DMA70: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA70) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_62, DMA_ADDR_63, "64'h80",1)
DMA71: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA71) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_72, DMA_ADDR_73, "64'h80",1)
DMA72: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA72) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_82, DMA_ADDR_83, "64'h80",1)
DMA73: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA73) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_92, DMA_ADDR_93, "64'h80",1)
DMA74: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA74) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_102, DMA_ADDR_103, "64'h80",1)
DMA75: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA75) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_112, DMA_ADDR_113, "64'h80",1)
DMA76: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA76) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_122, DMA_ADDR_123, "64'h80",1)
DMA77: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA77) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_132, DMA_ADDR_133, "64'h80",1)
DMA78: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA78) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_142, DMA_ADDR_143, "64'h80",1)
DMA79: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA79) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_152, DMA_ADDR_153, "64'h80",1)
DMA80: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA80) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_162, DMA_ADDR_163, "64'h80",1)
DMA81: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA81) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_172, DMA_ADDR_173, "64'h80",1)
DMA82: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA82) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_182, DMA_ADDR_183, "64'h80",1)
DMA83: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA83) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_192, DMA_ADDR_193, "64'h80",1)
DMA84: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA84) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_202, DMA_ADDR_203, "64'h80",1)
DMA85: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA85) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_212, DMA_ADDR_213, "64'h80",1)
DMA86: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA86) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_222, DMA_ADDR_223, "64'h80",1)
DMA87: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA87) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_232, DMA_ADDR_233, "64'h80",1)
DMA88: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA88) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_242, DMA_ADDR_243, "64'h80",1)
DMA89: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA89) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_252, DMA_ADDR_253, "64'h80",1)
DMA90: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA90) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_262, DMA_ADDR_263, "64'h80",1)
DMA91: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA91) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_272, DMA_ADDR_273, "64'h80",1)
DMA92: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA92) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_282, DMA_ADDR_283, "64'h80",1)
DMA93: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA93) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_292, DMA_ADDR_293, "64'h80",1)
DMA94: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA94) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_302, DMA_ADDR_303, "64'h80",1)
DMA95: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA95) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_312, DMA_ADDR_313, "64'h80",1)
DMA96: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA96) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_322, DMA_ADDR_323, "64'h80",1)
DMA97: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA97) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_332, DMA_ADDR_333, "64'h80",1)
DMA98: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA98) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_342, DMA_ADDR_343, "64'h80",1)
DMA99: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA99) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_352, DMA_ADDR_353, "64'h80",1)
DMA100: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA100) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_362, DMA_ADDR_363, "64'h80",1)
DMA101: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA101) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_372, DMA_ADDR_373, "64'h80",1)
DMA102: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA102) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_382, DMA_ADDR_383, "64'h80",1)
DMA103: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA103) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_392, DMA_ADDR_393, "64'h80",1)
DMA104: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA104) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_402, DMA_ADDR_403, "64'h80",1)
DMA105: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA105) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_412, DMA_ADDR_413, "64'h80",1)
DMA106: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA106) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_422, DMA_ADDR_423, "64'h80",1)
DMA107: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA107) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_432, DMA_ADDR_433, "64'h80",1)
DMA108: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA108) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_442, DMA_ADDR_443, "64'h80",1)
DMA109: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA109) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_452, DMA_ADDR_453, "64'h80",1)
DMA110: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA110) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_462, DMA_ADDR_463, "64'h80",1)
DMA111: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA111) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_472, DMA_ADDR_473, "64'h80",1)
DMA112: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA112) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_482, DMA_ADDR_483, "64'h80",1)
DMA113: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA113) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_492, DMA_ADDR_493, "64'h80",1)
DMA114: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA114) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_502, DMA_ADDR_503, "64'h80",1)
DMA115: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA115) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_512, DMA_ADDR_513, "64'h80",1)
DMA116: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA116) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_522, DMA_ADDR_523, "64'h80",1)
DMA117: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA117) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_532, DMA_ADDR_533, "64'h80",1)
DMA118: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA118) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_542, DMA_ADDR_543, "64'h80",1)
DMA119: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA119) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_552, DMA_ADDR_553, "64'h80",1)
DMA120: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA120) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_562, DMA_ADDR_563, "64'h80",1)
DMA121: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA121) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_572, DMA_ADDR_573, "64'h80",1)
DMA122: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA122) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_582, DMA_ADDR_583, "64'h80",1)
DMA123: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA123) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_592, DMA_ADDR_593, "64'h80",1)
DMA124: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA124) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_602, DMA_ADDR_603, "64'h80",1)
DMA125: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA125) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_612, DMA_ADDR_613, "64'h80",1)
DMA126: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA126) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_622, DMA_ADDR_623, "64'h80",1)
DMA127: nop ! $EV trig_pc_d(1,@VA(.MAIN.DMA127) -> EnablePCIeIgCmd("DMARD", DMA_ADDR_632, DMA_ADDR_633, "64'h80",1)




	! select a MEM32 address in PCI address range and transmit the command to NCU
	
	setx    MEM32_WR_ADDR, %g1, %g2
	set	5, %g4			! loop 5 times

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
	init_mem(0x0101010201030104, 64, 8, +, 0, +, 0x0004000400040004)


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
	.skip 8*0x7f
	! we only need 64 TTEs for this test
	init_mem(0x00000000007f0003, 64, 8, +, 0, +, 0x0000000000010000)
	
/************************************************************************/
