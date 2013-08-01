/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: spc2_hboot_test.s
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
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

    ta T_CHANGE_HPRIV

    ldxa [%g0]0x63, %l1
    tid2vtid(%l1)

    ta T_CHANGE_NONHPRIV
    rdth_id()

	!# Initialize registers ..

	!# Global registers
	set	0x5,	%g1
	set	0x9,	%g2
	set	0xC,	%g3
	set	0x7,	%g4
	set	0xB,	%g5
	set	0x3,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xA,	%i1
	set	-0x5,	%i2
	set	-0x9,	%i3
	set	-0x0,	%i4
	set	-0x6,	%i5
	set	-0x0,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x6BC97FF6,	%l0
	set	0x58CD6641,	%l1
	set	0x7CCA8958,	%l2
	set	0x08A07B35,	%l3
	set	0x475FF3C1,	%l4
	set	0x22DB92D6,	%l5
	set	0x26538D1E,	%l6
	set	0x6CB6F74A,	%l7

	!# Execute some ALU ops ..

	addcc	%o6,	%i0,	%o0
	andcc	%g3,	0x0EB,	%o7
	addccc	%g4,	%g5,	%i3
	and	%l5,	%g7,	%l2
	orncc	%i1,	0x39A,	%l0
	sra	%g0,	0x1,	%l3
	addcc	%g1,	0x202,	%o1
	sll	%l6,	%g2,	%i2
	addc	%l4,	%o5,	%i4
	andn	%o2,	0x3F1,	%l7
	subccc	%i7,	%i5,	%g6
	andn	%l1,	0x327,	%o3
	srax	%i6,	0x5,	%o0
	andn	%i0,	0x2F0,	%o6
	addc	%o4,	0x14E,	%g3
	xnorcc	%g5,	%g4,	%l5
	subc	%i3,	0x0,	%o7
	subc	%i1,	0xD,	%l2
	and	%g7,	%g1,	%l3
	sub	%g0,	0x7,	%g2
	or	%i2,	%o1,	%l4
	and	%o5,	0x173,	%o2
	subc	%l7,	%l0,	%l6
	add	%g6,	%i4,	%i7
	andn	%l1,	0x276,	%i5
	orcc	%i6,	%o6,	%o4
	subccc	%o3,	%g3,	%o0
	sra	%i0,	0x0,	%g4
	andn	%o7,	0x0F6,	%i1
	xnorcc	%l5,	%l2,	%i3
	orcc	%g7,	0x3AC,	%l3
	add	%g5,	0x0D5,	%i2
	xnorcc	%g0,	0x106,	%g1
	xnor	%o1,	0x089,	%l4
	sll	%g2,	0xE,	%l0
	srl	%o2,	0x1,	%l6
	orncc	%o5,	0x12E,	%g6
	and	%l7,	%i4,	%i6
	andcc	%i5,	%o6,	%o3
	xor	%i7,	%o4,	%g3
	subc	%l1,	%o7,	%g4
	subc	%o0,	0x0,	%i1
	andncc	%i0,	0x2D8,	%i3
	andn	%g7,	%l3,	%l2
	subccc	%g0,	0x8,	%g1
	addcc	%l5,	%l4,	%g2
	srax	%g5,	0x0,	%i2
	xorcc	%o1,	%o2,	%g6
	add	%o5,	0x055,	%i4
	srlx	%l6,	0xF,	%l7
	orncc	%l0,	0x34B,	%o3
	xnor	%i6,	0x313,	%o6
	subcc	%o4,	%l1,	%o7
	subcc	%g4,	%i7,	%i1
	subcc	%i5,	%o0,	%i3
	subc	%l3,	0xB,	%i0
	srax	%l2,	0x6,	%g0
	orn	%l5,	0x27F,	%g1
	orcc	%g7,	0x315,	%g2
	xnorcc	%g3,	%l4,	%g5
	orcc	%o2,	%i2,	%i4
	orncc	%o5,	%l7,	%l6
	orncc	%o1,	%l0,	%o3
	orn	%o4,	0x0BE,	%l1
	sub	%o6,	%g6,	%o7
	xor	%g4,	%i6,	%i1
	xnorcc	%i7,	0x171,	%i5
	xnorcc	%o0,	0x0A5,	%l2
	sub	%l3,	%i0,	%g0
	addc	%g1,	0x216,	%g7
	sub	%i3,	%l5,	%g2
	and	%l4,	%g5,	%i4
	sll	%o5,	%i2,	%l6
	subccc	%l7,	0x5,	%o1
	subc	%g3,	%l0,	%o3
	subc	%o6,	0xB,	%o4
	orcc	%o2,	%g6,	%l1
	addcc	%i6,	%o7,	%i1
	and	%i7,	0x11C,	%l2
	addc	%o0,	0x3DF,	%i5
	addc	%g0,	%g4,	%g1
	xorcc	%l3,	0x00B,	%i3
	andn	%g2,	0x363,	%i0
	srlx	%g7,	%i4,	%g5
	xor	%l4,	0x3E5,	%i2
	subccc	%o5,	0x6,	%l5
	andncc	%l7,	0x287,	%l0
	sra	%g3,	0x6,	%o6
	andn	%o1,	0x2E5,	%o3
	subc	%l6,	0x0,	%o2
	sllx	%i6,	0x0,	%o7
	srlx	%i1,	%i7,	%g6
	orncc	%l1,	0x252,	%o4
	and	%g0,	%o0,	%g4
	xorcc	%i5,	0x19F,	%l2
	xor	%g2,	%i0,	%g7
	add	%l3,	0x13C,	%g5
	sub	%g1,	0x2,	%i3
	and	%i4,	0x1FD,	%o5
	orn	%i2,	0x369,	%l0
	or	%l5,	%g3,	%o6
	xnorcc	%l4,	0x19C,	%l6
	subcc	%o2,	%o3,	%l7
	addcc	%o7,	%i6,	%i1
	xorcc	%o1,	0x17F,	%o4
	orn	%i7,	0x39D,	%l1
	sub	%o0,	0x9,	%g0
	srl	%l2,	0x5,	%i5
	xnorcc	%g6,	%g7,	%g4
	or	%g2,	0x236,	%g5
	andncc	%i3,	0x2FC,	%i4
	subc	%o5,	0x2,	%l3
	and	%g1,	0x167,	%i0
	addccc	%l5,	0x33D,	%g3
	subccc	%o6,	0xE,	%i2
	andncc	%o2,	0x302,	%o3
	srlx	%l0,	0x8,	%l4
	and	%l7,	%i6,	%l6
	and	%o7,	0x3B1,	%i1
	srl	%o1,	0x1,	%o0
	addccc	%o4,	%l1,	%l2
	andncc	%i5,	%g0,	%g7
	sll	%g6,	%i7,	%i3
	srlx	%i4,	%g4,	%g5
	orn	%o5,	0x3DF,	%l3
	subccc	%g1,	0x2,	%g2
	xnor	%i0,	%g3,	%o6
	orcc	%i2,	0x2F7,	%o3
	orncc	%l0,	0x3BE,	%l7
	addc	%o2,	0x2B6,	%l4
	srlx	%l5,	0xD,	%o7
	subccc	%o1,	0x9,	%i1
	orn	%i6,	0x2BB,	%o4
	srax	%l1,	0x2,	%i5
	subc	%o0,	0xF,	%l2
	addcc	%g6,	%g0,	%l6
	srlx	%i7,	%i4,	%i3
	and	%g4,	%g7,	%o5
	subccc	%g5,	0xF,	%g2
	xnor	%g3,	%o6,	%i0
	subc	%l3,	0x4,	%l0
	addccc	%o3,	0x179,	%g1
	addcc	%i2,	0x0CC,	%o2
	xor	%l7,	0x2FB,	%l5
	srax	%i1,	0xA,	%o7
	xnorcc	%o1,	0x2DB,	%l4
	add	%o4,	0x07D,	%i6
	andcc	%i5,	%o0,	%l2
	sllx	%l6,	%l1,	%i7
	srlx	%i4,	0xB,	%g6
	srax	%g7,	%o5,	%g0
	xorcc	%g2,	0x38B,	%g4
	xor	%g5,	0x34A,	%i0
	orncc	%g3,	0x252,	%l0
	subc	%l3,	0x6,	%o3
	xor	%i2,	0x055,	%i3
	srl	%o6,	%l5,	%g1
	orcc	%i1,	%o1,	%l7
	addc	%l4,	%o4,	%o2
	addccc	%i6,	0x206,	%o0
	xor	%o7,	0x240,	%i5
	orncc	%l2,	0x235,	%i7
	orcc	%i4,	0x1D5,	%l1
	xor	%i4,	%o4,	%g3
	addcc	%l6,	0x22F,	%l3
	orncc	%i1,	%i0,	%l0
	subc	%l1,	0x0,	%o3
	andn	%g1,	0x0CB,	%g7
	orncc	%g6,	%i2,	%o7
	xor	%g2,	%i6,	%o2
	srax	%i7,	%i0,	%l1
	sllx	%i1,	0x5,	%l0
	andcc	%o0,	%g5,	%l7
	orcc	%o4,	%o3,	%g3
	or	%o6,	0x0CC,	%g0
	subc	%l4,	0x3,	%g1
	orcc	%l2,	0x193,	%g7
	or	%i3,	0x064,	%g4
	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.word 0xD6B3479D
.word 0xDB28926C
.end

#include "err_handlers.s"

