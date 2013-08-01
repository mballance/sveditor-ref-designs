/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeBadPIOAccess.s
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
#define MAIN_PAGE_HV_ALSO
	
#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
	inc     %l4; \
	done;

#include "hboot.s"
	
/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
main:
        ta T_CHANGE_HPRIV
        nop

	mov	0, %l4		! zero the interrupt count
	
/************************************************************************
   Read & Write - within 8MB noncacheable region, but not in the range
   60.0000 - 6f.ffff
 ************************************************************************/

	setx	0x0000008800000000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800100000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800200000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800300000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800400000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800500000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800700000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
/************************************************************************
   Read & Write - within 8MB noncacheable region, and in the range
   60.0000 - 6f.ffff, but not mapped to any CSRs.  Try to hit most
   of the gaps in the addressing range.
 ************************************************************************/

	setx	0x0000008800600000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x00000088006011e0, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800601200, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x00000088006015e0, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800601600, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800601b00, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800602000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800603000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800609000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x000000880060c000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800610ff0, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800612000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800630030, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x000000880062d000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800634020, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800649000, %g1, %g2

	! try a good address followed by a bad one
	stx	%g3, [%g2 + 0x78]	!! good address
	stx	%g4, [%g2 + 0x80]	!! bad address
	stx	%g5, [%g2 + 0x88]
	ldx	[%g2 + 0x78], %g4	!! good address
	ldx	[%g2 + 0x80], %g5	!! bad address
	ldx	[%g2 + 0x88], %g6
	
	! try a good address followed by a bad one
	stx	%g3, [%g2 + 0x1f8]	!! good address
	stx	%g4, [%g2 + 0x200]	!! bad address
	stx	%g5, [%g2 + 0x208]
	stx	%g6, [%g2 + 0x210]
	ldx	[%g2 + 0x1f8], %g4	!! good address
	ldx	[%g2 + 0x200], %g5	!! bad address
	ldx	[%g2 + 0x208], %g6
	ldx	[%g2 + 0x210], %g7
	
	setx	0x0000008800653110, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800665000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800671000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800683100, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x0000008800692000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x00000088006aaaa0, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x00000088006bbbb0, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x00000088006ccc00, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x00000088006dddd0, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x00000088006e3000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x00000088006f0000, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
	setx	0x00000088006ffff0, %g1, %g2
	stx	%g3, [%g2]
	ldx	[%g2], %g4

	! test whether enough exceptions were taken
	sub	%l4, 39, %l4
	brnz	%l4, test_failed
	nop
		
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

