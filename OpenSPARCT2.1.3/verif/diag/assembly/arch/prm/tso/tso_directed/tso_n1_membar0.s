/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n1_membar0.s
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
#define		srcaddr		%l0
#define		dstaddr		%l1
#define		count		%l2

! Define number of 64 byte subblocks to copy
#define SBLKS 128

#include "hboot.s"

.global main
.text
main:

setup_addresses:
	setx out_stream, %g2, dstaddr
	add %g0, 0x10, %i0
	add %i0, 1, %i1
	add %i0, 1, %i2
	add %i0, 1, %i3
	add %i0, 1, %i4
	add %i0, 1, %i5
	add %i0, 1, %i6
	add %i0, 1, %i7

	set	0x10, %l3
loop:
	st		%i0, [dstaddr + 0x0]
	st		%i1, [dstaddr + 0x4]
	st		%i2, [dstaddr + 0x8]
	st		%i3, [dstaddr + 0xc]
	st		%i4, [dstaddr + 0x10]
	st		%i5, [dstaddr + 0x14]
	st		%i6, [dstaddr + 0x18]
	st		%i7, [dstaddr + 0x1c]
	st		%i0, [dstaddr + 0x20]
	st		%i1, [dstaddr + 0x24]
	st		%i2, [dstaddr + 0x28]
	st		%i3, [dstaddr + 0x2c]
	membar #Sync
	dec %l3
	brnz	%l3, loop
	nop

	ld		[dstaddr + 0x0], %i0
	ld		[dstaddr + 0x4], %i0
	ld		[dstaddr + 0x8], %i0
	ld		[dstaddr + 0xc], %i0
	ld		[dstaddr + 0x10], %i0
	ld		[dstaddr + 0x14], %i0
	ld		[dstaddr + 0x18], %i0
	ld		[dstaddr + 0x1c], %i0
	ld		[dstaddr + 0x20], %i0
	ld		[dstaddr + 0x24], %i0
	ld		[dstaddr + 0x28], %i0
	ld		[dstaddr + 0x2c], %i0

	ta GOOD_TRAP
user_text_end:

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.global out_stream
.data
.align 	0x40
user_data_start:
out_stream:
	init_mem(0x11111111, SBLKS*16, 4, +, 0, +, 0)

user_data_end:
