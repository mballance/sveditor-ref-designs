/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeDMA0LenRd.s
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

#define MEM32_RD_ADDR 		mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)

#define DMA_DATA_ADDR   	0x0000000123456000
#define SADDR			0xfffc000123456000
#define EADDR			0xfffc000123456800

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	! select a MEM32 address in PCI address range 
	
	setx    MEM32_RD_ADDR, %g1, %g2

UE1:    setx	0x123456789abcdef0, %g1, %g3
! $EV trig_pc_d(1, @VA(.MAIN.UE1)) -> EnablePCIeIgCmd ("DMARD", SADDR, EADDR, "64'h0",1,*,*)
	stx	%g3, [%g2+0]		! MEM32 PIO Write
UE2:	setx	0x23456789abcdef01, %g1, %g4
! $EV trig_pc_d(1, @VA(.MAIN.UE2)) -> EnablePCIeIgCmd ("DMARD", SADDR, EADDR, "64'h0",1,*,*)
	stx	%g4, [%g2+8]		! MEM32 PIO Write
UE3:	setx	0x3456789abcdef012, %g1, %g5
! $EV trig_pc_d(1, @VA(.MAIN.UE3)) -> EnablePCIeIgCmd ("DMARD", SADDR, EADDR, "64'h0",1,*,*)
	stx	%g5, [%g2+16]		! MEM32 PIO Write
	ldx	[%g2+0], %l2		! MEM32 PIO READ
UE4:	setx	0x456789abcdef0123, %g1, %g6
! $EV trig_pc_d(1, @VA(.MAIN.UE4)) -> EnablePCIeIgCmd ("DMARD", SADDR, EADDR, "64'h0",1,*,*)
	stx	%g6, [%g2+24]		! MEM32 PIO Write
	nop; nop; nop; nop; nop; nop; nop; nop;
	ldx	[%g2+8], %l2		! MEM32 PIO READ
	nop; nop; nop; nop; nop; nop; nop; nop;
	ldx	[%g2+16], %l2		! MEM32 PIO READ
	ldx	[%g2+24], %l2		! MEM32 PIO READ
	ldx	[%g2+32], %l2		! MEM32 PIO READ
	
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
	init_mem(0x0101010201030104, 128, 8, +, 0, +, 0x0004000400040004)
/************************************************************************/
