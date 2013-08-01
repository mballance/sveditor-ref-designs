/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeIORd.s
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

	
#define IO_RD_ADDR mpeval((N2_PCIE_BASE_ADDR + (IOCFG_OFFSET_BASE_REG_DATA & 0x7fffffffffffffff)) | IO_ACCESS_PA)


/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	! select an IO address in PCI address range and transmit the command to NCU
	setx IO_RD_ADDR, %g1, %g2

	! load byte - all byte offsets within an octlet
	ldub [%g2 + 1*8 + 0], %l0
	ldub [%g2 + 2*8 + 1], %l1
	ldub [%g2 + 3*8 + 2], %l2
	ldub [%g2 + 4*8 + 3], %l3
	ldub [%g2 + 5*8 + 4], %l4
	ldub [%g2 + 6*8 + 5], %l5
	ldub [%g2 + 7*8 + 6], %l6
	ldub [%g2 + 8*8 + 7], %l7

	! load half-word - all half-word offsets within an octlet
	lduh [%g2 + 9*8 + 0], %o0
	lduh [%g2 + 10*8 + 2], %o1
	lduh [%g2 + 11*8 + 4], %o2
	lduh [%g2 + 12*8 + 6], %o3

	! Load word - all word offsets within an octlet
	lduw [%g2 + 13*8 + 0], %o4
	lduw [%g2 + 14*8 + 4], %o5
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

/************************************************************************
   Test case data start
************************************************************************/

SECTION       .DATA DATA_VA=IO_RD_ADDR
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
	.xword 0xdeadbeefdeadbeef

	.xword 0x1101010101010101
	.xword 0x0122010101010101
	.xword 0x0101330101010101
	.xword 0x0101014401010101
	.xword 0x0101010155010101
	.xword 0x0101010101660101
	.xword 0x0101010101017701
	.xword 0x0101010101010188
	
	.xword 0x1122010101010101
	.xword 0x0101334401010101
	.xword 0x0101010155660101
	.xword 0x0101010101017788
	
	.xword 0x1122334401010101
	.xword 0x0101010155667788
	
	.xword 0xdeadbeefdeadbeef

/************************************************************************/
