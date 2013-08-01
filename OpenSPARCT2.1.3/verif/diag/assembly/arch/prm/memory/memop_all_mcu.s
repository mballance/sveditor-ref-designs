/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_all_mcu.s
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
	ta      T_CHANGE_HPRIV

	setx	data1, %g1, %g2
	setx	scratch, %g1, %g3

	! Load data for 1st block store/load

	ldd	[%g2], %f0
	ldd	[%g2+0x8], %f2
	ldd	[%g2+0x10], %f4
	ldd	[%g2+0x18], %f6
	ldd	[%g2+0x20], %f8
	ldd	[%g2+0x28], %f10
	ldd	[%g2+0x30], %f12
	ldd	[%g2+0x38], %f14

	! Do block store commit using 1st MCU

	stda	%f0, [%g3]ASI_BLK_COMMIT_PRIMARY
	membar	#Sync

	! Do block load using 1st MCU

	ldda	[%g3]ASI_BLOCK_PRIMARY, %f16

	! Test the data read

	fcmpd	%fcc0, %f0, %f16
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f2, %f18
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f4, %f20
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f6, %f22
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f8, %f24
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f10, %f26
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f12, %f28
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f14, %f30
	fbnz	%fcc0, test_failed
	nop

	! Load data for 2nd block store/load

	add	%g2, 64, %g2
	or	%g3, 0x80, %g3

	ldd	[%g2], %f0
	ldd	[%g2+0x8], %f2
	ldd	[%g2+0x10], %f4
	ldd	[%g2+0x18], %f6
	ldd	[%g2+0x20], %f8
	ldd	[%g2+0x28], %f10
	ldd	[%g2+0x30], %f12
	ldd	[%g2+0x38], %f14

	! Do block store commit using 2nd MCU

	stda	%f0, [%g3]ASI_BLK_COMMIT_PRIMARY
	membar	#Sync

	! Do block load using 2nd MCU

	ldda	[%g3]ASI_BLOCK_PRIMARY, %f16

	! Test the data read

	fcmpd	%fcc0, %f0, %f16
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f2, %f18
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f4, %f20
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f6, %f22
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f8, %f24
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f10, %f26
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f12, %f28
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f14, %f30
	fbnz	%fcc0, test_failed
	nop

	! Load data for 3rd block store/load

	add	%g2, 64, %g2
	or	%g3, 0x100, %g3

	ldd	[%g2], %f0
	ldd	[%g2+0x8], %f2
	ldd	[%g2+0x10], %f4
	ldd	[%g2+0x18], %f6
	ldd	[%g2+0x20], %f8
	ldd	[%g2+0x28], %f10
	ldd	[%g2+0x30], %f12
	ldd	[%g2+0x38], %f14

	! Do block store commit using 3rd MCU

	stda	%f0, [%g3]ASI_BLK_COMMIT_PRIMARY
	membar	#Sync

	! Do block load using 3rd MCU

	ldda	[%g3]ASI_BLOCK_PRIMARY, %f16

	! Test the data read

	fcmpd	%fcc0, %f0, %f16
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f2, %f18
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f4, %f20
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f6, %f22
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f8, %f24
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f10, %f26
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f12, %f28
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f14, %f30
	fbnz	%fcc0, test_failed
	nop

	! Load data for 4th block store/load

	add	%g2, 64, %g2
	or	%g3, 0x180, %g3

	ldd	[%g2], %f0
	ldd	[%g2+0x8], %f2
	ldd	[%g2+0x10], %f4
	ldd	[%g2+0x18], %f6
	ldd	[%g2+0x20], %f8
	ldd	[%g2+0x28], %f10
	ldd	[%g2+0x30], %f12
	ldd	[%g2+0x38], %f14

	! Do block store commit using 4th MCU

	stda	%f0, [%g3]ASI_BLK_COMMIT_PRIMARY
	membar	#Sync

	! Do block load using 4th MCU

	ldda	[%g3]ASI_BLOCK_PRIMARY, %f16

	! Test the data read

	fcmpd	%fcc0, %f0, %f16
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f2, %f18
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f4, %f20
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f6, %f22
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f8, %f24
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f10, %f26
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f12, %f28
	fbnz	%fcc0, test_failed
	nop
	fcmpd	%fcc0, %f14, %f30
	fbnz	%fcc0, test_failed
	nop

	! DONE

	ba	test_passed
	nop


/**********************************************************************
 *  Common code.
 *********************************************************************/
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
	.align	64
data1:
	.xword	0x0000000000000000
	.xword	0x0001000100010001
	.xword	0x0002000200020002
	.xword	0x0003000300030003
	.xword	0x0004000400040004
	.xword	0x0005000500050005
	.xword	0x0006000600060006
	.xword	0x0007000700070007
data2:
	.xword	0x0008000800080008
	.xword	0x0009000900000009
	.xword	0x000a000a000a000a
	.xword	0x000b000b000b000b
	.xword	0x000c000c000c000c
	.xword	0x000d000d000d000d
	.xword	0x000e000e000e000e
	.xword	0x000f000f000f000f
data3:
	.xword	0x0010001000100010
	.xword	0x0011001100110011
	.xword	0x0012001200120012
	.xword	0x0013001300130013
	.xword	0x0014001400140014
	.xword	0x0015001500150015
	.xword	0x0016001600160016
	.xword	0x0017001700170017
data4:
	.xword	0x0018001800180018
	.xword	0x0019001900100019
	.xword	0x001a001a001a001a
	.xword	0x001b001b001b001b
	.xword	0x001c001c001c001c
	.xword	0x001d001d001d001d
	.xword	0x001e001e001e001e
	.xword	0x001f001f001f001f

	.align	0x200			! addr [8:6] = 0
scratch:
	.skip	0x200

user_data_end:

.end


