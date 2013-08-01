/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeMemRd.s
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

#define MEM_RD_ADDR mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	! select a CFG address in PCI address range and transmit the command to NCU

	! load byte
	setx MEM_RD_ADDR, %g1, %g2
	ldub [%g2], %l0

	! load half-word
	setx MEM_RD_ADDR, %g1, %g2
	lduh [%g2], %l0

	! Load word
	setx MEM_RD_ADDR, %g1, %g2
	lduw [%g2], %l0

	! Load dword
	setx MEM_RD_ADDR, %g1, %g2
	ldx  [%g2], %l0

	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


	
/************************************************************************
   Test case data start
************************************************************************/

SECTION       .DATA DATA_VA=MEM_RD_ADDR
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
data0:	.word 0x44556677
data1:	.word 0x8899aabb
data2:	.word 0xccccdddd
data3:	.word 0xeeeeffff
/************************************************************************/
