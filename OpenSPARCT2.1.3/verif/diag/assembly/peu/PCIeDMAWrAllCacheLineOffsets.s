/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeDMAWrAllCacheLineOffsets.s
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
	
DMA0: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA0)) -> EnablePCIeIgCmd("DMAWR", fffc000076543000, fffc000076543000, "64'h041",1)

DMA1: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA1)) -> EnablePCIeIgCmd("DMAWR", fffc000076543081, fffc000076543081, "64'h041",1)

DMA2: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA2)) -> EnablePCIeIgCmd("DMAWR", fffc000076543102, fffc000076543102, "64'h041",1)

DMA3: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA3)) -> EnablePCIeIgCmd("DMAWR", fffc000076543183, fffc000076543183, "64'h041",1)

DMA4: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA4)) -> EnablePCIeIgCmd("DMAWR", fffc000076543204, fffc000076543204, "64'h041",1)

DMA5: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA5)) -> EnablePCIeIgCmd("DMAWR", fffc000076543285, fffc000076543285, "64'h041",1)

DMA6: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA6)) -> EnablePCIeIgCmd("DMAWR", fffc000076543306, fffc000076543306, "64'h041",1)

DMA7: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA7)) -> EnablePCIeIgCmd("DMAWR", fffc000076543387, fffc000076543387, "64'h041",1)

DMA8: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA8)) -> EnablePCIeIgCmd("DMAWR", fffc000076543408, fffc000076543408, "64'h041",1)

DMA9: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA9)) -> EnablePCIeIgCmd("DMAWR", fffc000076543489, fffc000076543489, "64'h041",1)

DMA10: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA10)) -> EnablePCIeIgCmd("DMAWR", fffc00007654350a, fffc00007654350a, "64'h041",1)

DMA11: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA11)) -> EnablePCIeIgCmd("DMAWR", fffc00007654358b, fffc00007654358b, "64'h041",1)

DMA12: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA12)) -> EnablePCIeIgCmd("DMAWR", fffc00007654360c, fffc00007654360c, "64'h041",1)

DMA13: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA13)) -> EnablePCIeIgCmd("DMAWR", fffc00007654368d, fffc00007654368d, "64'h041",1)

DMA14: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA14)) -> EnablePCIeIgCmd("DMAWR", fffc00007654370e, fffc00007654370e, "64'h041",1)

DMA15: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA15)) -> EnablePCIeIgCmd("DMAWR", fffc00007654378f, fffc00007654378f, "64'h041",1)

DMA16: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA16)) -> EnablePCIeIgCmd("DMAWR", fffc000076543810, fffc000076543810, "64'h041",1)

DMA17: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA17)) -> EnablePCIeIgCmd("DMAWR", fffc000076543891, fffc000076543891, "64'h041",1)

DMA18: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA18)) -> EnablePCIeIgCmd("DMAWR", fffc000076543912, fffc000076543912, "64'h041",1)

DMA19: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA19)) -> EnablePCIeIgCmd("DMAWR", fffc000076543993, fffc000076543993, "64'h041",1)

DMA20: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA20)) -> EnablePCIeIgCmd("DMAWR", fffc000076543a14, fffc000076543a14, "64'h041",1)

DMA21: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA21)) -> EnablePCIeIgCmd("DMAWR", fffc000076543a95, fffc000076543a95, "64'h041",1)

DMA22: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA22)) -> EnablePCIeIgCmd("DMAWR", fffc000076543b16, fffc000076543b16, "64'h041",1)

DMA23: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA23)) -> EnablePCIeIgCmd("DMAWR", fffc000076543b97, fffc000076543b97, "64'h041",1)

DMA24: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA24)) -> EnablePCIeIgCmd("DMAWR", fffc000076543c18, fffc000076543c18, "64'h041",1)

DMA25: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA25)) -> EnablePCIeIgCmd("DMAWR", fffc000076543c99, fffc000076543c99, "64'h041",1)

DMA26: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA26)) -> EnablePCIeIgCmd("DMAWR", fffc000076543d1a, fffc000076543d1a, "64'h041",1)

DMA27: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA27)) -> EnablePCIeIgCmd("DMAWR", fffc000076543d9b, fffc000076543d9b, "64'h041",1)

DMA28: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA28)) -> EnablePCIeIgCmd("DMAWR", fffc000076543e1c, fffc000076543e1c, "64'h041",1)

DMA29: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA29)) -> EnablePCIeIgCmd("DMAWR", fffc000076543e9d, fffc000076543e9d, "64'h041",1)

DMA30: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA30)) -> EnablePCIeIgCmd("DMAWR", fffc000076543f1e, fffc000076543f1e, "64'h041",1)

DMA31: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA31)) -> EnablePCIeIgCmd("DMAWR", fffc00007654401f, fffc00007654401f, "64'h041",1)

DMA32: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA32)) -> EnablePCIeIgCmd("DMAWR", fffc0000765440a0, fffc0000765440a0, "64'h041",1)

DMA33: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA33)) -> EnablePCIeIgCmd("DMAWR", fffc000076544121, fffc000076544121, "64'h041",1)

DMA34: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA34)) -> EnablePCIeIgCmd("DMAWR", fffc0000765441a2, fffc0000765441a2, "64'h041",1)

DMA35: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA35)) -> EnablePCIeIgCmd("DMAWR", fffc000076544223, fffc000076544223, "64'h041",1)

DMA36: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA36)) -> EnablePCIeIgCmd("DMAWR", fffc0000765442a4, fffc0000765442a4, "64'h041",1)

DMA37: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA37)) -> EnablePCIeIgCmd("DMAWR", fffc000076544325, fffc000076544325, "64'h041",1)

DMA38: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA38)) -> EnablePCIeIgCmd("DMAWR", fffc0000765443a6, fffc0000765443a6, "64'h041",1)

DMA39: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA39)) -> EnablePCIeIgCmd("DMAWR", fffc000076544427, fffc000076544427, "64'h041",1)

DMA40: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA40)) -> EnablePCIeIgCmd("DMAWR", fffc0000765444a8, fffc0000765444a8, "64'h041",1)

DMA41: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA41)) -> EnablePCIeIgCmd("DMAWR", fffc000076544529, fffc000076544529, "64'h041",1)

DMA42: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA42)) -> EnablePCIeIgCmd("DMAWR", fffc0000765445aa, fffc0000765445aa, "64'h041",1)

DMA43: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA43)) -> EnablePCIeIgCmd("DMAWR", fffc00007654462b, fffc00007654462b, "64'h041",1)

DMA44: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA44)) -> EnablePCIeIgCmd("DMAWR", fffc0000765446ac, fffc0000765446ac, "64'h041",1)

DMA45: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA45)) -> EnablePCIeIgCmd("DMAWR", fffc00007654472d, fffc00007654472d, "64'h041",1)

DMA46: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA46)) -> EnablePCIeIgCmd("DMAWR", fffc0000765447ae, fffc0000765447ae, "64'h041",1)

DMA47: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA47)) -> EnablePCIeIgCmd("DMAWR", fffc00007654482f, fffc00007654482f, "64'h041",1)

DMA48: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA48)) -> EnablePCIeIgCmd("DMAWR", fffc0000765448b0, fffc0000765448b0, "64'h041",1)

DMA49: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA49)) -> EnablePCIeIgCmd("DMAWR", fffc000076544931, fffc000076544931, "64'h041",1)

DMA50: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA50)) -> EnablePCIeIgCmd("DMAWR", fffc0000765449b2, fffc0000765449b2, "64'h041",1)

DMA51: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA51)) -> EnablePCIeIgCmd("DMAWR", fffc000076544a33, fffc000076544a33, "64'h041",1)

DMA52: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA52)) -> EnablePCIeIgCmd("DMAWR", fffc000076544ab4, fffc000076544ab4, "64'h041",1)

DMA53: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA53)) -> EnablePCIeIgCmd("DMAWR", fffc000076544b35, fffc000076544b35, "64'h041",1)

DMA54: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA54)) -> EnablePCIeIgCmd("DMAWR", fffc000076544bb6, fffc000076544bb6, "64'h041",1)

DMA55: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA55)) -> EnablePCIeIgCmd("DMAWR", fffc000076544c37, fffc000076544c37, "64'h041",1)

DMA56: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA56)) -> EnablePCIeIgCmd("DMAWR", fffc000076544cb8, fffc000076544cb8, "64'h041",1)

DMA57: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA57)) -> EnablePCIeIgCmd("DMAWR", fffc000076544d39, fffc000076544d39, "64'h041",1)

DMA58: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA58)) -> EnablePCIeIgCmd("DMAWR", fffc000076544dba, fffc000076544dba, "64'h041",1)

DMA59: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA59)) -> EnablePCIeIgCmd("DMAWR", fffc000076544e3b, fffc000076544e3b, "64'h041",1)

DMA60: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA60)) -> EnablePCIeIgCmd("DMAWR", fffc000076544ebc, fffc000076544ebc, "64'h041",1)

DMA61: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA61)) -> EnablePCIeIgCmd("DMAWR", fffc000076544f3d, fffc000076544f3d, "64'h041",1)

DMA62: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA62)) -> EnablePCIeIgCmd("DMAWR", fffc00007654503e, fffc00007654503e, "64'h041",1)

DMA63: nop; nop; nop; nop; nop
! $EV trig_pc_d(1,@VA(.MAIN.DMA63)) -> EnablePCIeIgCmd("DMAWR", fffc0000765450bf, fffc0000765450bf, "64'h041",1)



	! select a CSR in the PIU and transmit the command to NCU
	
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g1, %g2
	setx	0x020, %g1, %g4

delay_loop:
	ldx	[%g2], %g5
	nop
	nop
	nop
	nop
	dec	%g4
	brnz	%g4, delay_loop
	nop
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

