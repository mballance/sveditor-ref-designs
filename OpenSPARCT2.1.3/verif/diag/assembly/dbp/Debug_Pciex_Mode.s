/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: Debug_Pciex_Mode.s
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
#define DBG_CONFIG_PA 0x8600000000
#define DBG_PCIEX_VAL 0x800000000000000B

#define DBG_PEUA_PA  0x8800683000
#define DBG_PEUA_VAL 0x40
#define DBG_PEUB_PA  0x8800683008
#define DBG_PEUB_VAL 0x40

#define DBG_DMUA_PA  0x8800653000
#define DBG_DMUA_VAL 0x140
#define DBG_DMUB_PA  0x8800653008
#define DBG_DMUB_VAL 0x140

	
#include "hboot.s"
#include "peu_defines.h"

#define MEM64_WR_ADDR mpeval(N2_PCIE_BASE_ADDR + MEM64_OFFSET_BASE_REG_DATA)
#define MEM64_WR_ADDR0 mpeval(MEM64_WR_ADDR + 0x0000000000)
#define MEM64_WR_ADDR1 mpeval(MEM64_WR_ADDR + 0x0100000000)
#define MEM64_WR_ADDR2 mpeval(MEM64_WR_ADDR + 0x0200000000)
#define MEM64_WR_ADDR4 mpeval(MEM64_WR_ADDR + 0x0400000000)
		
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
//////
	setx DBG_CONFIG_PA,%g1,%g2
	setx DBG_PCIEX_VAL,%g3,%g4
	stx %g4,[%g2]
	membar #Sync
	setx DBG_PEUA_PA,%g1,%g2
	setx DBG_PEUA_VAL,%g3,%g4
	stx %g4,[%g2]
	membar #Sync
	setx DBG_PEUB_PA,%g1,%g2
	setx DBG_PEUB_VAL,%g3,%g4
	stx %g4,[%g2]
	membar #Sync
	setx DBG_DMUA_PA,%g1,%g2
	setx DBG_DMUA_VAL,%g3,%g4
	stx %g4,[%g2]
	membar #Sync
	setx DBG_DMUB_PA,%g1,%g2
	setx DBG_DMUB_VAL,%g3,%g4
	stx %g4,[%g2]
	membar #Sync




	
///////	
	! select a Mem address in PCI address range and transmit the command to NCU
	setx	MEM64_WR_ADDR1, %g1, %g2

	! store byte to a few offsets
	setx	0x10, %g1, %l0
	stb	%l0, [%g2 + 0]
	mov     %l0, %l1
	ldub	[%g2 + 0], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop
	
	setx	0x20, %g1, %l0
	stb	%l0, [%g2 + 1]
	mov     %l0, %l1
	ldub	[%g2 + 1], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop
	
	setx	0x30, %g1, %l0
	stb	%l0, [%g2 + 2]
	mov     %l0, %l1
	ldub	[%g2 + 2], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop
	
	setx	0x40, %g1, %l0
	stb	%l0, [%g2 + 3]
	mov     %l0, %l1
	ldub	[%g2 + 3], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop

	setx	0x50, %g1, %l0
	stb	%l0, [%g2 + 4]
	mov     %l0, %l1
	ldub	[%g2 + 4], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop
	
	setx	0x60, %g1, %l0
	stb	%l0, [%g2 + 5]
	mov     %l0, %l1
	ldub	[%g2 + 5], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop
	
	setx	0x70, %g1, %l0
	stb	%l0, [%g2 + 6]
	mov     %l0, %l1
	ldub	[%g2 + 6], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop
	
	setx	0x80, %g1, %l0
	stb	%l0, [%g2 + 7]
	mov     %l0, %l1
	ldub	[%g2 + 7], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop
	
	! store half-word to a few offsets
	setx	0x9190, %g1, %l0
	sth	%l0, [%g2 + 8]
	mov     %l0, %l1
	lduh	[%g2 + 8], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop

	setx	0xa1a0, %g1, %l0
	sth	%l0, [%g2 + 10]
	mov     %l0, %l1
	lduh	[%g2 + 10], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop

	setx	0xb1b0, %g1, %l0
	sth	%l0, [%g2 + 12]
	mov     %l0, %l1
	lduh	[%g2 + 12], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop

	setx	0xc1c0, %g1, %l0
	sth	%l0, [%g2 + 14]
	mov     %l0, %l1
	lduh	[%g2 + 14], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop
	
	! store word
	setx	0xd3d2d1d0, %g1, %l0
	stw	%l0, [%g2 + 16]
	mov     %l0, %l1
	lduw	[%g2 + 16], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop

	setx	0xe3e2e1e0, %g1, %l0
	stw	%l0, [%g2 + 20]
	mov     %l0, %l1
	lduw	[%g2 + 20], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop

	setx	0xf3f2f1f0, %g1, %l0
	stw	%l0, [%g2 + 24]
	mov     %l0, %l1
	lduw	[%g2 + 24], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop

	setx	0x03020100, %g1, %l0
	stw	%l0, [%g2 + 28]
	mov     %l0, %l1
	lduw	[%g2 + 28], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop

	! store dword
	setx	0x1716151413121110, %g1, %l0
	stx	%l0, [%g2 + 32]
	mov     %l0, %l1
	ldx	[%g2 + 32], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop

	setx	0x2726252423222120, %g1, %l0
	stx	%l0, [%g2 + 40]
	mov     %l0, %l1
	ldx	[%g2 + 40], %l0
	cmp	%l0, %l1
	BNE_TEST_FAIL
	nop

	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
************************************************************************/

SECTION       .DATA DATA_VA=MEM64_WR_ADDR1
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
.global PCIAddr9
	
data0:	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888

/************************************************************************/
	
