/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeReqId.s
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
#define PCIE_MEM64_OFFSET	0xc800000000

#define ENABLE_PCIE_LINK_TRAINING    
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"
#include "peu_defines.h"

#define MEM32_ADDR mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)
#define MEM64_ADDR mpeval(N2_PCIE_BASE_ADDR + MEM64_OFFSET_BASE_REG_DATA)

#define IO_RD_ADDR mpeval((N2_PCIE_BASE_ADDR + (IOCFG_OFFSET_BASE_REG_DATA & 0x7fffffffffffffff)) | IO_ACCESS_PA)

! with the Denali endpoint, it seems that bits 8-11 must be in [1..F]	
#define CFG0_RD_ADDR  mpeval(N2_PCIE_BASE_ADDR + 0x100)
#define CFG1_RD_ADDR  mpeval(CFG0_RD_ADDR + CFG1_ACCESS_PA)

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	setx	FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_ADDR, %g1, %g2
	setx	IO_RD_ADDR, %g1, %g4
	setx	MEM64_ADDR, %g1, %g5
	setx	MEM32_ADDR, %g1, %g6
	setx	CFG0_RD_ADDR, %g1, %g3
	setx	CFG1_RD_ADDR, %g1, %g7

	
	! write "0AAA" into REQ_ID field of "DMC PCI Express Configuration Register".
scenerio1:
	set	0x0AAA, %g1
	stx     %g1, [%g2]
	ldx	[%g2], %g1

	
	! MEM32 load byte
	ldub	[%g6], %l0
	stb	%l0, [%g6 + 16]

	! MEM64 load byte
	ldub	[%g5], %l1
	stb	%l0, [%g5 + 16]

	! IO load byte
	ldub	[%g4], %l2
	stb	%l0, [%g4 + 14]

	! CFG0 load byte
	ldub	[%g3], %l3
	stb	%l0, [%g3 + 13]

	! CFG1 load byte
	ldub	[%g7], %l4
	stb	%l0, [%g7 + 16]


	
	! write "0555" into REQ_ID field of "DMC PCI Express Configuration Register".
scenerio2:
	set	0x0555, %g1
	stx     %g1, [%g2]
	ldx	[%g2], %g1


	! MEM32 load half-word
	lduh	[%g6 + 2], %l0
	sth	%l0, [%g6 + 18]

	! MEM64 load half-word
	lduh	[%g5 + 2], %l1
	sth	%l0, [%g5 + 18]

	! IO load half-word
	lduh	[%g4 + 2], %l2
	sth	%l0, [%g4 + 18]

	! CFG0 load half-word
	lduh	[%g3 + 2], %l3
	sth	%l0, [%g3 + 18]

	! CFG1 load half-word
	lduh	[%g7 + 2], %l4
	sth	%l0, [%g7 + 18]

	
	! write "ffff" into REQ_ID field of "DMC PCI Express Configuration Register".
scenerio3:
	set	0xffff, %g1
	stx     %g1, [%g2]
	ldx	[%g2], %g1

	! MEM32 Load word
	lduw	[%g6 + 4], %l0
	stw	%l0, [%g6 + 20]

	! MEM64 Load word
	lduw	[%g5 + 4], %l1
	stw	%l0, [%g5 + 20]

	! IO load word
	lduw	[%g4 + 4], %l2
	stw	%l0, [%g4 + 20]

	! CFG0 load word
	lduw	[%g3 + 4], %l3
	stw	%l0, [%g3 + 20]

	! CFG1 load word
	lduw	[%g7 + 4], %l4
	stw	%l0, [%g7 + 20]

	
	! write "012d" into REQ_ID field of "DMC PCI Express Configuration Register".
	! (for strange functional coverage object)
scenerio4:
	set	0x012d, %g1
	stx     %g1, [%g2]
	ldx	[%g2], %g1


	! MEM32 Load dword
	ldx	[%g6 + 8], %l0
	stx	%l0, [%g6 + 24]
	
	! MEM64 Load dword
	ldx	[%g5 + 8], %l1
	stx	%l0, [%g5 + 24]
	
	! IO load word
	lduw	[%g4 + 8], %l2
	stw	%l0, [%g4 + 24]

	! CFG0 load word
	lduw	[%g3 + 8], %l3
	stw	%l0, [%g3 + 24]

	! CFG1 load word
	lduw	[%g7 + 8], %l4
	stw	%l0, [%g7 + 24]

	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

	
/************************************************************************
   Test case data start
************************************************************************/

SECTION       .DATA DATA_VA=MEM32_ADDR
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
	.word 0x44556677
	.word 0x8899aabb
	.word 0xccccdddd
	.word 0xeeeeffff

SECTION       .DATA2 DATA_VA=MEM64_ADDR
attr_data {     
      Name = .DATA2,
      hypervisor,
      compressimage
}

.data
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888


SECTION       .DATA3 DATA_VA=IO_RD_ADDR
attr_data {     
      Name = .DATA3,
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


SECTION       .DATA4 DATA_VA=CFG0_RD_ADDR
attr_data {     
      Name = .DATA4,
      hypervisor,
      compressimage
}

.data
	.xword 0xdeadbeefdeadbeef

	.xword 0x0101010101010101
	.xword 0x0101010101010101
	.xword 0x0101010101010101
	.xword 0x0101010101010101

	
SECTION       .DATA5 DATA_VA=CFG1_RD_ADDR
attr_data {     
      Name = .DATA5,
      hypervisor,
      compressimage
}
	
.data
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000

	
/************************************************************************/
