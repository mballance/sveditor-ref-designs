/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_all_byte_mask.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"
#include "asi_s.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV

	setx	user_data_start, %g1, %g2
	setx	temp_data, %g1, %g3
	mov	%g3, %g4

	! Do 256 VIS stores to create all possible byte masks.
l1:	
	mov	%g0, %g7		! Byte mask to use
	ldd	[%g2], %f0
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l2:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00000000000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l3:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000000000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l4:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000000000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l5:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000000ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l6:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000000ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l7:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000000abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l8:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000000abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l9:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000089000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l10:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00000000890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l11:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000008900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l12:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000008900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l13:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000089ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l14:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000089ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l15:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000089abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l16:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000000089abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l17:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006700000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l18:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00000067000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l19:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000670000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l20:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000670000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l21:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006700ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l22:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006700ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l23:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006700abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l24:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006700abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l25:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006789000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l26:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00000067890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l27:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000678900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l28:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000000678900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l29:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006789ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l30:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006789ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l31:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006789abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l32:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000006789abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l33:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	ldd	[%g2], %f0
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450000000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l34:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00004500000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l35:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045000000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l36:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045000000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l37:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450000ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l38:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450000ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l39:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450000abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l40:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450000abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l41:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450089000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l42:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00004500890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l43:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045008900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l44:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045008900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l45:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450089ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l46:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450089ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l47:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450089abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l48:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000450089abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l49:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456700000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l50:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00004567000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l51:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045670000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l52:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045670000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l53:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456700ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l54:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456700ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l55:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456700abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l56:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456700abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l57:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456789000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l58:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00004567890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l59:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045678900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l60:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x000045678900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l61:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456789ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l62:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456789ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l63:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456789abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l64:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0000456789abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l65:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	ldd	[%g2], %f0
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000000000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l66:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00230000000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l67:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300000000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l68:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300000000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l69:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000000ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l70:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000000ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l71:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000000abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l72:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000000abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l73:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000089000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l74:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00230000890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l75:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300008900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l76:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300008900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l77:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000089ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l78:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000089ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l79:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000089abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l80:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023000089abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l81:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006700000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l82:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00230067000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l83:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300670000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l84:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300670000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l85:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006700ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l86:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006700ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l87:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006700abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l88:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006700abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l89:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006789000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l90:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00230067890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l91:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300678900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l92:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002300678900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l93:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006789ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l94:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006789ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l95:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006789abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l96:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023006789abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l97:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	ldd	[%g2], %f0
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450000000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l98:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00234500000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l99:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345000000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l100:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345000000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l101:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450000ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l102:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450000ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l103:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450000abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l104:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450000abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l105:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450089000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l106:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00234500890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l107:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345008900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l108:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345008900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l109:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450089ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l110:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450089ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l111:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450089abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l112:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023450089abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l113:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456700000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l114:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00234567000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l115:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345670000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l116:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345670000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l117:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456700ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l118:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456700ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l119:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456700abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l120:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456700abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l121:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456789000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l122:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x00234567890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l123:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345678900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l124:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x002345678900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l125:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456789ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l126:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456789ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l127:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456789abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l128:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0023456789abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l129:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	ldd	[%g2], %f0
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000000000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l130:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01000000000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l131:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000000000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l132:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000000000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l133:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000000ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l134:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000000ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l135:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000000abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l136:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000000abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l137:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000089000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l138:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01000000890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l139:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000008900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l140:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000008900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l141:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000089ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l142:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000089ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l143:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000089abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l144:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100000089abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l145:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006700000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l146:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01000067000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l147:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000670000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l148:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000670000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l149:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006700ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l150:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006700ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l151:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006700abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l152:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006700abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l153:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006789000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l154:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01000067890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l155:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000678900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l156:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010000678900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l157:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006789ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l158:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006789ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l159:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006789abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l160:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100006789abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l161:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	ldd	[%g2], %f0
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450000000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l162:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01004500000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l163:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045000000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l164:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045000000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l165:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450000ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l166:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450000ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l167:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450000abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l168:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450000abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l169:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450089000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l170:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01004500890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l171:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045008900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l172:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045008900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l173:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450089ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l174:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450089ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l175:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450089abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l176:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100450089abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l177:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456700000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l178:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01004567000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l179:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045670000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l180:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045670000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l181:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456700ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l182:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456700ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l183:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456700abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l184:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456700abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l185:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456789000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l186:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01004567890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l187:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045678900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l188:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x010045678900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l189:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456789ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l190:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456789ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l191:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456789abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l192:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0100456789abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l193:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	ldd	[%g2], %f0
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000000000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l194:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01230000000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l195:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300000000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l196:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300000000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l197:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000000ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l198:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000000ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l199:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000000abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l200:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000000abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l201:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000089000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l202:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01230000890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l203:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300008900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l204:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300008900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l205:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000089ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l206:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000089ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l207:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000089abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l208:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123000089abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l209:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006700000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l210:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01230067000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l211:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300670000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l212:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300670000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l213:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006700ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l214:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006700ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l215:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006700abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l216:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006700abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l217:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006789000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l218:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01230067890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l219:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300678900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l220:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012300678900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l221:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006789ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l222:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006789ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l223:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006789abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l224:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123006789abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l225:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	ldd	[%g2], %f0
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450000000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l226:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01234500000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l227:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345000000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l228:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345000000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l229:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450000ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l230:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450000ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l231:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450000abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l232:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450000abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l233:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450089000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l234:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01234500890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l235:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345008900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l236:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345008900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l237:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450089ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l238:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450089ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l239:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450089abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l240:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123450089abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l241:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456700000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l242:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01234567000000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l243:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345670000cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l244:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345670000cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l245:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456700ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l246:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456700ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l247:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456700abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l248:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456700abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l249:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456789000000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l250:		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x01234567890000ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l251:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345678900cd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l252:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x012345678900cdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l253:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456789ab0000, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l254:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456789ab00ef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l255:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456789abcd00, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop
l256:	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY
	ldx	[%g3], %i0
	setx	0x0123456789abcdef, %g1, %i1
	cmp	%i0, %i1
	bne	test_failed
	nop

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
	.align	0x4000
user_data_start:
data:
	.xword	0x0123456789abcdef

temp_data:
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
.end:	



