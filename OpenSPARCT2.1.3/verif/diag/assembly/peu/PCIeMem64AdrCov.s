/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeMem64AdrCov.s
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
	
#define MEM64_BASE			mpeval(N2_PCIE_BASE_ADDR + (MEM64_OFFSET_BASE_REG_DATA & 0x7fffffffffffffff))
	
#define MEM64_RD_ADDR0			MEM64_BASE

!! For MEM64, the pcie spec says you need a bit set in 63-32
	
#define MEM64_OFFSET_WALK1			0x0100000001000000
	
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

	! Load the PCIE MEM64 OFFSET Register address
	
        setx    FIRE_DLC_IMU_ICS_CSR_A_MEM_64_PCIE_OFFSET_REG_ADDR, %g1, %g2

	! Get the initial walking 1 and 0 values
	
        setx    MEM64_OFFSET_WALK1, %g1, %g3

	mov	32, %g5				! loop count

	setx	MEM64_RD_ADDR0, %g1, %g6	! PIO MEM64  address
	setx	0x0102030405060708, %g1, %g7	! data value
	setx	0x1020304050607080, %g1, %l0	! data value
	setx	0x0101010101010101, %g1, %o0	! data increment value
	
SetMem64Offset:	
        stx     %g3, [%g2]			! set the walking 1 mem 64 offset value
        ldx     [%g2], %g4			! make sure write has completed

	stx     %g7,[%g6 + 0]			! pio mem 64 write
	stx     %l0,[%g6 + 8]			! pio mem 64 write
	
	
	ldx	[%g6], %l1			! pio mem 64 read
	cmp	%l1, %g7
	BNE_TEST_FAIL
	nop
	
	ldx	[%g6 + 8], %l2			! pio mem 64 read
	cmp	%l2, %l0
	BNE_TEST_FAIL
	nop

	! loop code
	sllx	%g3, 1, %g3			! shift walking 1 value left by 1

	add	%g7, %o0, %g7			! increment data patterns
	add	%l0, %o0, %l0
	
	dec	%g5				! decrement counter
	brnz	%g5, SetMem64Offset		! loop if not zero
	nop
	
	
test_passed:
	EXIT_GOOD

test_failed:	
	EXIT_BAD
