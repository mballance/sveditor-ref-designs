/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: spc_flush0.s
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
#include "defines.h"
#include "old_boot.s"

.text
.global main

main:
	/*
	 *****************************************	 
	 * Initialize all the registers
	 ***************************************** 
	 */
	set     0x3009b3e4,     %l0
	set     0x957f43e9,     %l1
	set     0xeef55c5d,     %l2
	set     0xf29039ca,     %l3
	set     0x926f8329,     %l4
	set     0x3d6172cd,     %l5
	set     0xcb84ab9b,     %l6
	set     0xe92be485,     %l7
	set     0xc04c977d,     %i0
	set     0x6492e2d0,     %i1
	set     0xbe33ddd8,     %i2
	set     0xd0fb061f,     %i3
	set     0xaa1a6a9f,     %i4
	set     0x17492ca0,     %i5
	set     0x9abec99c,     %i6
	set     0x48c19ef4,     %i7
	set     0x4478dc0f,     %o0
	set     0xc4d9756a,     %o1
	set     0x4392b7d9,     %o2
	set     0xde4928d2,     %o3
	set     0xf8ffc02c,     %o4
	set     0xcdee525b,     %o5
	set     0xd6d8db1b,     %o6
	set     0x9ede1023,     %o7
	set	0x1,		%g1

tc_0:
	add	%l0, %l1, %i0
	add	%l2, %l3, %i1
	add	%l4, %l5, %i2
	add	%l6, %l7, %i3

	brnz	%g1, tc_1
	nop

	setx	tc_1, %l0, %l1
	set	0xa0060019, %i4
	set	0xa206801b, %i5
	set	0xa406001a, %i6
	set	0xa606401b, %i7
	st	%i4, [%l1]
	add	%l1, 0x4, %l1
	st	%i5, [%l1]
	add	%l1, 0x4, %l1
	st	%i6, [%l1]
	add	%l1, 0x4, %l1
	st	%i7, [%l1]
	flush	%l1
tc_1:
	add	%i0, %i2, %l0
	add	%i1, %i3, %l1
	add	%i0, %i1, %l2
	add	%i2, %i3, %l3

	brnz	%g1, tc_0
	sub	%g1, 1, %g1

	EXIT_GOOD

.data
.xword 0123456789abcdef
.end

