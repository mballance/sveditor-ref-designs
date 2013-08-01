/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeCFGWr.s
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
/* #define MAIN_PAGE_NUCLEUS_ALSO */ /* Access main in priviledge mode */
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"
#include "peu_defines.h"
!#include "dmu_peu_regs.h"
	
#define CFG0_WR_ADDR mpeval(N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA)
#define CFG1_WR_ADDR mpeval((N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA) | CFG1_ACCESS_PA)

!#define CFG_WR_ADDR mpeval(N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA)

! ignore lower 2-bits of address. these are used for byte enables.
! only bits [27:	0] are used for CFG accesses. zero out other bits
! IOCFG_OFFSET_MASK_REG_DATA = 	0x0000000d0ef00210
! IOCFG_OFFSET_MASK_REG_DATA >>2 = 0x003bc0084
! align it to 8-byte boundary, else midas will complain
!#define CFG_WR_ADDR mpeval(N2_PCIE_BASE_ADDR + 0x003bc0080)

!#define CFGA_UE 0ef000000
#define CFGA_UE substr(CFG1_WR_ADDR, 2)
#define CFGA_DAT eval(CFGA_UE, 16)
	
/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

XmtCmd:
	! select a CFG address in PCI address range and transmit the command to NCU

	! store byte
	setx	CFG1_WR_ADDR, %g1, %g2
	setx	0x23222120, %g1, %l0
	stb	%l0, [%g2]

	! store half-word
	setx	CFG1_WR_ADDR, %g1, %g2
	setx	0x33323130, %g1, %l0
	sth	%l0, [%g2]

	! store word
	setx	CFG1_WR_ADDR, %g1, %g2
	setx	0x7f7e7d7c, %g1, %l0
	stw	%l0, [%g2]

	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


	
/************************************************************************
   Test case data start
************************************************************************/

SECTION       .DATA DATA_VA=CFG1_WR_ADDR
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
.global PCIAddr9
	
data0:	.word 0xccccdddd
data1:	.word 0xeeeeffff
/************************************************************************/
