/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: spc_pmu_asr.s
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

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	ta	T_RD_THID
	mov	%o1, %l7
	umul	%l7, 256, %l7


	!# Initialize registers ..

	!# Global registers
	set	0xB,	%g1
	set	0x5,	%g2
	set	0x7,	%g3
	set	0xE,	%g4
	set	0x7,	%g5
	set	0xB,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xC,	%i1
	set	-0x8,	%i2
	set	-0xF,	%i3
	set	-0x1,	%i4
	set	-0xB,	%i5
	set	-0x4,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x08538AD0,	%l0
	set	0x07398F35,	%l1
	set	0x4B289E70,	%l2
	set	0x0004A8EF,	%l3
	set	0x7750ABA7,	%l4
	set	0x0E460AC4,	%l5
	set	0x7AA8D017,	%l6
	!# Output registers
	set	0x170F,	%o0
	set	0x14E1,	%o1
	set	0x1B1D,	%o2
	set	-0x0859,	%o3
	set	0x0DF7,	%o4
	set	-0x112E,	%o5
	set	0x1988,	%o6
	set	-0x0D3D,	%o7

	!# Execute some ALU ops ..

	srl	%i2,	0x06,	%i4
	sth	%l5,	[%l7 + 0x08]

	!# Try to read and write the PIC
    ta  T_RD_THID
    mov %o1, %l0
       !setx	0x01234567DEADBEEF, %g1, %l0
	wr %l0, %g0, %pic	/* write to PIC */
	rd %pic, %l3
	cmp %l0, %l3
	bne bad
	nop

	sllx %l0, 0x4, %l2	/* generate different value to write to PCR */
	setx 0xffffffffffffffcf, %g1, %l3
	and %l3, %l2, %l2	/*  ... make sure to turn off TOE bits PCR[5:4]*/

	wr %l2, %g0, %pcr	
	rd %pcr, %l4
	and %g0, %l5, %l5
	or %g0, 0xFF, %l5	/* Only compare lower 8 bits of PCR, since NAS only implements them now. */
	and %l4, %l5, %l4
	cmp %l2, %l4
	bne bad
	nop
	

loop_1057:
        nop

loop_1058:
        nop


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Diag:
!
!	Type f   	: 1800
!	Type cti   	: 1058
!	Type i   	: 1065
!	Type l   	: 1077
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */
	nop
	nop


bad:	EXIT_BAD	
/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.word 0x3C2D3A79
.word 0xA4FF68F0
.word 0x13C701A5
.word 0xC99B6312
.word 0xA4F4C560
.word 0x5BABF289
.word 0xFCE126DE
.word 0x192FB03E
.word 0x6E8EE4BD
.word 0x2B2C2E3E
.word 0xB6DED02A
.word 0xC01083B1
.word 0x44988A1F
.word 0x9DE7EB5A
.word 0xB74AA760
.word 0xE4BEBA23
.word 0x91772362
.word 0x0EFD27D4
.word 0x0A6D28DF
.word 0x1E6E6B20
.word 0x37CF0203
.word 0x08A35333
.word 0x37D2B902
.word 0x40B11BA1
.word 0x753FB53E
.word 0x915CE10C
.word 0xEA67753F
.word 0xAF5B00C5
.word 0xBDB94A52
.word 0x1D0FD9E3
.word 0x9EA12949
.word 0xF6D465AC
.word 0x3D702202
.word 0x3142FEAE
.word 0x1C59D52C
.word 0xCFA86D05
.word 0xE2CCEFBC
.word 0xB384E260
.word 0x9479CC2D
.word 0x9F49FC0A
.word 0xFA0AFE12
.word 0x9BADD844
.word 0x7ABF68B6
.word 0xD79B2787
.word 0x2DABAA5B
.word 0x2A7D2369
.word 0xEBC7D953
.word 0xC91A563E
.word 0x21899566
.word 0x5545E80A
.word 0xD551D8ED
.word 0xECBD2D1B
.word 0x5F55E84B
.word 0x51D80E1A
.word 0x8D1CE3BC
.word 0xD126CC9F
.word 0x3939976F
.word 0xD0E0B2D5
.word 0xD7524BD8
.word 0x86F9D052
.word 0x005953F7
.word 0xB834B88A
.word 0x0B2A90E3
.word 0x0F749E26
.end
