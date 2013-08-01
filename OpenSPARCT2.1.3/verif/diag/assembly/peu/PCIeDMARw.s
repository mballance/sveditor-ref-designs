/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeDMARw.s
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
#define DMA_DATA_BYP_SADDR      0xfffc000123456000
#define DMA_DATA_BYP_EADDR      0xfffc000123456800

#define DMA_DATA_BYP_ADDR1      0xfffc000123457000
#define DMA_DATA_BYP_ADDR2      0xfffc000123457100
#define DMA_DATA_BYP_ADDR3      0xfffc000123457200
#define DMA_DATA_BYP_ADDR4      0xfffc000123457300
#define DMA_DATA_BYP_ADDR5      0xfffc000123457400
#define DMA_DATA_BYP_ADDR6      0xfffc000123457500
#define DMA_DATA_BYP_ADDR7      0xfffc000123457600
#define DMA_DATA_BYP_ADDR8      0xfffc000123457700
#define DMA_DATA_BYP_ADDR9      0xfffc000123457800

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

! see if this user event works in a loop (multi-shot)
	
	mov	0x02, %g4
UsrEvnt1:
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt1)) -> EnablePCIeIgCmd ("DMARD", DMA_DATA_BYP_SADDR, DMA_DATA_BYP_EADDR, "64'h40", 1, *, * )
UsrEvnt2:
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt2)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR1, DMA_DATA_BYP_ADDR2, "64'h40", 1 )
	nop
	nop
	dec	%g4
	brnz	%g4, UsrEvnt1
	nop
	nop

UsrEvnt3:	!! this DMA Read will have 2 completions, since it is longer than 128 bytes (default MPS)
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt3)) -> EnablePCIeIgCmd ("DMARD", DMA_DATA_BYP_SADDR, DMA_DATA_BYP_EADDR, "64'h100", 1, *, * )
	
UsrEvnt4:  
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt4)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR2, DMA_DATA_BYP_ADDR3, "64'h80", 1 )
	
UsrEvnt5:  
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt5)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR3, DMA_DATA_BYP_ADDR4, "64'h20", 1 )
	
UsrEvnt6:  
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt6)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR4, DMA_DATA_BYP_ADDR5, "64'h10", 1 )
	
UsrEvnt7:  
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt7)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR5, DMA_DATA_BYP_ADDR6, "64'h8", 1 )
	
UsrEvnt8:  
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt8)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR6, DMA_DATA_BYP_ADDR7, "64'h4", 1 )
	
UsrEvnt9:  
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt9)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR7, DMA_DATA_BYP_ADDR8, "64'h2", 1 )
	
UsrEvnt10:  
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt10)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR8, DMA_DATA_BYP_ADDR9, "64'h1", 1 )
	
UsrEvnt11:  
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt11)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR8, DMA_DATA_BYP_ADDR9, "64'h0", 1 )
	
UsrEvnt12:  
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt12)) -> EnablePCIeIgCmd ("DMARD", DMA_DATA_BYP_ADDR9, DMA_DATA_BYP_ADDR9, "64'h0", 1 )
	
	! select a MEM32 address in PCI address range and transmit the command to NCU
	
	setx    MEM32_RD_ADDR, %g1, %g2

	stx	%g1, [%g2]		! MEM32 PIO Write
	stx	%g2, [%g2+8]		! MEM32 PIO Write
	stx	%g3, [%g2+16]		! MEM32 PIO Write

	ldx	[%g2], %l0		! MEM32 PIO READ
	ldx	[%g2+8], %l1		! MEM32 PIO READ
	ldx	[%g2+16], %l2		! MEM32 PIO READ

	
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
	init_mem(0x0101010201030104, 256, 8, +, 0, +, 0x0004000400040004)
/************************************************************************/
