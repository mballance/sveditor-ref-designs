/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeMem32QuadLoad.s
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
		
#ifndef NO_SELF_CHECK
#define BNE_TEST_FAIL  bne	test_failed
#else
#define BNE_TEST_FAIL  nop
#endif
	
/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	! select a MEM address in PCIe address range
	setx	MEM_RD_ADDR, %g1, %g2
	
	! Load quad word (16 bytes), using asi 0x27
	wr	%g0, ASI_NUCLEUS_BLK_INIT_ST_QUAD_LDD, %asi
	ldda	[%g2+32] %asi, %l0

	! check the data that came back
	setx	0x3031323334353637, %g1, %g4
	setx	0x38393a3b3c3d3e3f, %g1, %g3
	cmp	%l0, %g4
	BNE_TEST_FAIL
	nop
	cmp	%l1, %g3
	BNE_TEST_FAIL
	nop

	! Load quad word (16 bytes), using asi 0xE2
	wr	%g0, ASI_BLK_INIT_ST_QUAD_LDD_P, %asi
	ldda	[%g2+48] %asi, %l0

	! check the data that came back
	setx	0x4041424344454647, %g1, %g4
	setx	0x48494a4b4c4d4e4f, %g1, %g3
	cmp	%l0, %g4
	BNE_TEST_FAIL
	nop
	cmp	%l1, %g3
	BNE_TEST_FAIL
	nop

	! Load quad word (16 bytes), using asi 0xE3
	wr	%g0, ASI_BLK_INIT_ST_QUAD_LDD_S, %asi
	ldda	[%g2+64] %asi, %l0

	! check the data that came back
	setx	0x5051525354555657, %g1, %g4
	setx	0x58595a5b5c5d5e5f, %g1, %g3
	cmp	%l0, %g4
	BNE_TEST_FAIL
	nop
	cmp	%l1, %g3
	BNE_TEST_FAIL
	nop

	! Load quad word (16 bytes), using asi 0x22
	ldda	[%g2] ASI_AS_IF_USER_BLK_INIT_PRIMARY, %l0

	! check the data that came back
	setx	0x1011121314151617, %g1, %g4
	setx	0x18191a1b1c1d1e1f, %g1, %g3
	cmp	%l0, %g4
	BNE_TEST_FAIL
	nop
	cmp	%l1, %g3
	BNE_TEST_FAIL
	nop
!!
	! Load quad word (16 bytes),  using asi 0x23
	wr	%g0, ASI_AS_IF_USER_BLK_INIT_SECONDARY, %asi
	ldda	[%g2+16] %asi, %l0

	! check the data that came back
	setx	0x2021222324252627, %g1, %g4
	setx	0x28292a2b2c2d2e2f, %g1, %g3
	cmp	%l0, %g4
	BNE_TEST_FAIL
	nop
	cmp	%l1, %g3
	BNE_TEST_FAIL
	nop


test_passed:
	EXIT_GOOD
!!
test_failed:	! get some PEU status registers before bailing out
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
.global PCIAddr9
	
data0:	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
data1:	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
data2:	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
data3:	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
data4:	.xword 0x5051525354555657
	.xword 0x58595a5b5c5d5e5f
data5:	.xword 0x6061626364656667
	.xword 0x68696a6b6c6d6e6f

/************************************************************************/
