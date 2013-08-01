/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeDMARw_bug116647.s
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

!!!----- addrs for PCI-e DMA and JTAG L2 access -----

#define BANK0_ADDR_FOR_DMA    0xfffc000123456000
#define BANK0_ADDR_FOR_JTAG   0xfffc000123456800
#define BANK1_ADDR_FOR_DMA    0xfffc000123456040
#define BANK1_ADDR_FOR_JTAG   0xfffc000123456840
#define BANK2_ADDR_FOR_DMA    0xfffc000123456080
#define BANK2_ADDR_FOR_JTAG   0xfffc000123456880
#define BANK3_ADDR_FOR_DMA    0xfffc0001234560c0
#define BANK3_ADDR_FOR_JTAG   0xfffc0001234568c0
#define BANK4_ADDR_FOR_DMA    0xfffc000123456100
#define BANK4_ADDR_FOR_JTAG   0xfffc000123456900
#define BANK5_ADDR_FOR_DMA    0xfffc000123456140
#define BANK5_ADDR_FOR_JTAG   0xfffc000123456940
#define BANK6_ADDR_FOR_DMA    0xfffc000123456180
#define BANK6_ADDR_FOR_JTAG   0xfffc000123456980
#define BANK7_ADDR_FOR_DMA    0xfffc0001234561c0
#define BANK7_ADDR_FOR_JTAG   0xfffc0001234569c0

!!!----- original code from PCIeDMARw.s -----

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

!!!----- inform Vera diag the addr to use for L2 access
UsrEvnt0:
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt0)) ->  generic_ev ("addr", BANK0_ADDR_FOR_JTAG, BANK0_ADDR_FOR_JTAG)
	nop

!!!----- runtime arg: NEXT_DMA_LOOP_DELAY is loop delay before next DMA

#ifdef NEXT_DMA_LOOP_DELAY
        setx  NEXT_DMA_LOOP_DELAY, %g1, %g6
#else
        setx 10, %g1, %g6
#endif

!!!----- runtime arg: NUMBER_DMA_WRITES is number of DMA write from PCI-e

#ifdef NUMBER_DMA_WRITES
        setx  NUMBER_DMA_WRITES, %g1, %g5
#else
        setx 150, %g1, %g5
#endif

!!!----- DMA writes from PCI-e -----

dma_write_loop:
        nop
        or %g0, %g6, %g4   !!! %g4 is delay loop counter
UsrEvnt1:
	nop ! $EV trig_pc_d(1, @VA(.MAIN.UsrEvnt1)) -> EnablePCIeIgCmd ("DMAWR", BANK0_ADDR_FOR_DMA, BANK0_ADDR_FOR_DMA, "64'h1", 1 )
1:                        !!! delay loop
        or %g0, 0x1, %g1  !!! dummy operation
        or %g0, 0x1, %g1  !!! dummy operation
        or %g0, 0x1, %g1  !!! dummy operation
        dec %g4
        brnz %g4, 1b
        nop
        nop

       dec %g5
       brnz %g5, dma_write_loop
       nop
       nop



!!!----- original code from PCIeDMARw.s -----

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
