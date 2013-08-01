/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeMem64AllBMsk.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"
#include "peu_defines.h"
#include "asi_s.h"
	
#define MEM_RD_ADDR			mpeval(N2_PCIE_BASE_ADDR + (MEM64_OFFSET_BASE_REG_DATA & 0x7fffffffffffffff))
		
#define MEM64_OFFSET			0x000000c700000000
#define MEM64_OFFSET_PLUS_GARBAGE	0x000000c700123456
		
!!#define MEM64_RD_ADDR0_PLUS_OFFSET	mpeval(0x000000c700000000 | MEM_RD_ADDR)
#define MEM64_RD_ADDR0_PLUS_OFFSET	mpeval(0x000000c700000000)
	
#ifndef NO_SELF_CHECK
#define BNE_TEST_FAILED  bne	test_failed
#else
#define BNE_TEST_FAILED  nop
#endif
	
/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV
        nop

	! Load the PCIE MEM64 OFFSET Register
	
        setx    FIRE_DLC_IMU_ICS_CSR_A_MEM_64_PCIE_OFFSET_REG_ADDR, %g1, %g2
        setx    MEM64_OFFSET_PLUS_GARBAGE, %g1, %g3
        stx     %g3, [%g2]
        ldx     [%g2], %g4

	setx	MEM_RD_ADDR, %g1, %g3

	! Do 256 VIS stores to create all possible byte masks.
l1:	
	mov	%g0, %g7		! First byte mask to use == 0
	ldd	[%g3], %f0              ! data to be stored 

	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000000000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l2:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00000000000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l3:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000000000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l4:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000000000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l5:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000000ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l6:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000000ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l7:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000000abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l8:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000000abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l9:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000089000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l10:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00000000890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l11:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000008900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l12:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000008900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l13:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000089ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l14:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000089ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l15:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000089abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l16:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000089abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l17:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006700000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l18:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00000067000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l19:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000670000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l20:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000670000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l21:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006700ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l22:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006700ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l23:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006700abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l24:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006700abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l25:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006789000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l26:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00000067890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l27:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000678900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l28:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000678900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l29:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006789ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l30:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006789ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l31:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006789abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l32:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006789abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l33:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450000000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l34:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00004500000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l35:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045000000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l36:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045000000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l37:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450000ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l38:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450000ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l39:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450000abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l40:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450000abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l41:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450089000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l42:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00004500890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l43:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045008900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l44:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045008900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l45:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450089ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l46:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450089ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l47:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450089abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l48:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450089abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l49:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456700000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l50:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00004567000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l51:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045670000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l52:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045670000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l53:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456700ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l54:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456700ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l55:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456700abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l56:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456700abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l57:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456789000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l58:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00004567890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l59:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045678900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l60:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045678900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l61:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456789ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l62:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456789ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l63:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456789abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l64:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456789abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l65:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000000000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l66:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00230000000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l67:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300000000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l68:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300000000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l69:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000000ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l70:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000000ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l71:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000000abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l72:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000000abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l73:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000089000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l74:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00230000890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l75:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300008900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l76:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300008900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l77:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000089ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l78:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000089ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l79:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000089abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l80:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000089abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l81:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006700000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l82:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00230067000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l83:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300670000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l84:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300670000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l85:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006700ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l86:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006700ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l87:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006700abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l88:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006700abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l89:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006789000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l90:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00230067890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l91:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300678900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l92:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300678900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l93:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006789ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l94:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006789ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l95:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006789abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l96:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006789abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l97:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450000000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l98:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00234500000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l99:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345000000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l100:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345000000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l101:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450000ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l102:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450000ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l103:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450000abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l104:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450000abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l105:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450089000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l106:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00234500890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l107:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345008900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l108:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345008900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l109:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450089ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l110:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450089ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l111:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450089abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l112:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450089abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l113:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456700000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l114:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00234567000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l115:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345670000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l116:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345670000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l117:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456700ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l118:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456700ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l119:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456700abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l120:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456700abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l121:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456789000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l122:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00234567890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l123:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345678900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l124:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345678900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l125:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456789ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l126:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456789ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l127:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456789abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l128:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456789abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l129:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000000000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l130:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01000000000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l131:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000000000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l132:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000000000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l133:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000000ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l134:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000000ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l135:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000000abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l136:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000000abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l137:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000089000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l138:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01000000890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l139:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000008900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l140:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000008900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l141:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000089ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l142:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000089ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l143:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000089abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l144:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000089abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l145:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006700000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l146:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01000067000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l147:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000670000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l148:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000670000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l149:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006700ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l150:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006700ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l151:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006700abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l152:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006700abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l153:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006789000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l154:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01000067890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l155:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000678900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l156:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000678900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l157:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006789ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l158:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006789ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l159:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006789abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l160:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006789abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l161:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450000000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l162:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01004500000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l163:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045000000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l164:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045000000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l165:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450000ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l166:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450000ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l167:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450000abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l168:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450000abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l169:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450089000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l170:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01004500890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l171:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045008900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l172:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045008900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l173:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450089ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l174:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450089ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l175:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450089abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l176:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450089abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l177:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456700000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l178:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01004567000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l179:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045670000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l180:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045670000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l181:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456700ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l182:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456700ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l183:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456700abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l184:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456700abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l185:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456789000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l186:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01004567890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l187:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045678900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l188:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045678900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l189:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456789ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l190:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456789ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l191:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456789abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l192:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456789abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l193:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000000000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l194:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01230000000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l195:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300000000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l196:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300000000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l197:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000000ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l198:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000000ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l199:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000000abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l200:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000000abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l201:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000089000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l202:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01230000890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l203:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300008900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l204:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300008900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l205:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000089ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l206:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000089ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l207:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000089abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l208:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000089abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l209:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006700000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l210:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01230067000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l211:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300670000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l212:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300670000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l213:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006700ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l214:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006700ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l215:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006700abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l216:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006700abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l217:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006789000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l218:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01230067890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l219:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300678900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l220:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300678900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l221:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006789ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l222:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006789ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l223:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006789abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l224:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006789abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l225:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450000000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l226:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01234500000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l227:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345000000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l228:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345000000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l229:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450000ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l230:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450000ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l231:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450000abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l232:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450000abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l233:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450089000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l234:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01234500890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l235:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345008900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l236:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345008900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l237:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450089ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l238:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450089ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l239:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450089abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l240:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450089abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l241:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456700000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l242:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01234567000000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l243:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345670000cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l244:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345670000cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l245:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456700ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l246:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456700ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l247:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456700abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l248:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456700abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l249:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456789000000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l250:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01234567890000ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l251:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345678900cd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l252:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345678900cdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l253:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456789ab0000, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l254:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456789ab00ef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l255:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456789abcd00, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop
l256:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456789abcdef, %g1, %i1
	cmp	%i0, %i1
	BNE_TEST_FAILED
	nop

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/

SECTION       .DATA DATA_VA=MEM64_RD_ADDR0_PLUS_OFFSET	
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}
	
.data
	.xword	0x0123456789abcdef      !!! original data at 000000c700000000
	.xword	0x0000000000000000      !!! store area
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000

SECTION       .DATA2 DATA_VA=0x000000c800000000
attr_data {     
      Name = .DATA2,
      hypervisor,
      compressimage
}
	
.data
	.xword	0xc8c8c8c8c8c8c8c8     
	.xword	0xc8c8c8c8c8c8c8c8     
	.xword	0xc8c8c8c8c8c8c8c8     
	.xword	0xc8c8c8c8c8c8c8c8     

	
SECTION       .DATA3 DATA_VA=0x000000cf00000000
attr_data {     
      Name = .DATA3,
      hypervisor,
      compressimage
}
	
.data
	.xword	0xcfcfcfcfcfcfcfcf
	.xword	0xcfcfcfcfcfcfcfcf
	.xword	0xcfcfcfcfcfcfcfcf
	.xword	0xcfcfcfcfcfcfcfcf
