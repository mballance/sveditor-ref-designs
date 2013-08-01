/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeCFG0Rw.s
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

! with the Denali endpoint, it seems that bits 8-11 must be in [1..F]	
#define CFG0_RD_ADDR  mpeval(N2_PCIE_BASE_ADDR + 0x100)

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
main:
        ta T_CHANGE_HPRIV
        nop

	! select a CFG0 address in PCI address range and transmit the command to NCU
	setx CFG0_RD_ADDR, %g1, %g2

	set  0x11, %o0
	set  0x1122, %o1
	set  0x2233, %o2
	set  0x3344, %o3
	set  0x4455, %o4
	set  0x5566, %o5
	set  0x778899aa, %o6
	set  0xbbccddee, %o7
	
	! store byte - all byte offsets within an octlet
	stb  %o0, [%g2 + 1*8 + 0]
	stb  %o1, [%g2 + 2*8 + 1]
	stb  %o2, [%g2 + 3*8 + 2]
	stb  %o3, [%g2 + 4*8 + 3]
	stb  %o4, [%g2 + 5*8 + 4]
	stb  %o5, [%g2 + 6*8 + 5]
	stb  %o6, [%g2 + 7*8 + 6]
	stb  %o7, [%g2 + 8*8 + 7]

	! store half-word - all half-word offsets within an octlet
	sth  %o0, [%g2 + 8*9  + 0]
	sth  %o1, [%g2 + 8*10 + 2]
	sth  %o2, [%g2 + 8*11 + 4]
	sth  %o3, [%g2 + 8*12 + 8]

	! store word - all word offsets within an octlet
	stw  %o4, [%g2 + 8*13 + 0]
	stw  %o5, [%g2 + 8*14 + 4]

	!!! use the loads to verify the stores
	
	! load byte - all byte offsets within an octlet
	ldub [%g2 + 13*8 + 0], %l0
	ldub [%g2 + 13*8 + 1], %l1
	ldub [%g2 + 13*8 + 2], %l2
	ldub [%g2 + 13*8 + 3], %l3
	ldub [%g2 + 14*8 + 4], %l4
	ldub [%g2 + 14*8 + 5], %l5
	ldub [%g2 + 14*8 + 6], %l6
	ldub [%g2 + 14*8 + 7], %l7

	! load half-word - all half-word offsets within an octlet
	lduh [%g2 + 1*8 + 0], %o0
	lduh [%g2 + 2*8 + 0], %o1
	lduh [%g2 + 3*8 + 2], %o2
	lduh [%g2 + 4*8 + 2], %o3
	lduh [%g2 + 5*8 + 4], %o4
	lduh [%g2 + 7*8 + 6], %o5

	! Load word - all word offsets within an octlet
	lduw [%g2 + 13*8 + 0], %o4
	lduw [%g2 + 6*8 + 4], %o4
	lduw [%g2 + 8*8 + 4], %o5
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

/************************************************************************
   Test case data start
************************************************************************/

SECTION       .DATA DATA_VA=CFG0_RD_ADDR
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
	.xword 0xdeadbeefdeadbeef

	.xword 0x0101010101010101
	.xword 0x0101010101010101
	.xword 0x0101010101010101
	.xword 0x0101010101010101
	
	.xword 0x0202020202020202
	.xword 0x0202020202020202
	.xword 0x0202020202020202
	.xword 0x0202020202020202
	
	.xword 0x0303030303030303		
	.xword 0x0303030303030303
	.xword 0x0303030303030303
	.xword 0x0303030303030303
	
	.xword 0x0404040404040404
	.xword 0x0404040404040404
	.xword 0x0404040404040404
	.xword 0x0404040404040404
		
	.xword 0xdeadbeefdeadbeef

/************************************************************************/
