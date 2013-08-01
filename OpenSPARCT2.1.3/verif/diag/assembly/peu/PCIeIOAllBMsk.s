/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeIOAllBMsk.s
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
	
#define IO_RD_ADDR mpeval((N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA) | IO_ACCESS_PA)
	

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV
        nop

	setx	IO_RD_ADDR, %g1, %g2
	mov	%g2, %g3

	! Do 32 VIS stores to create all possible byte masks that result in 1 DW writes

	mov	%g0, %g7		! Byte mask to use == 0

	setx    test_data, %g1, %g4
	ldd	[%g4], %f0              ! data to be stored 

	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x00
	lduw	[%g3], %i0
	lduw	[%g3 + 4], %i1
	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x01
	lduw	[%g3], %i2
	lduw	[%g3 + 4], %i3

	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x02
	lduw	[%g3], %i4
	lduw	[%g3 + 4], %i5

	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x03
	lduw	[%g3], %i6
	lduw	[%g3 + 4], %i7

	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x04
	lduw	[%g3], %i0
	lduw	[%g3 + 4], %i1

	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x05
	lduw	[%g3], %i2
	lduw	[%g3 + 4], %i3

	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x06
	lduw	[%g3], %i4
	lduw	[%g3 + 4], %i5
	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x07
	lduw	[%g3], %i6
	lduw	[%g3 + 4], %i7
	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x08
	lduw	[%g3], %i0
	lduw	[%g3 + 4], %i1
		
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x09
	lduw	[%g3], %i2
	lduw	[%g3 + 4], %i3
	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x0a
	lduw	[%g3], %i4
	lduw	[%g3 + 4], %i5
	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x0b
	lduw	[%g3], %i6
	lduw	[%g3 + 4], %i7
	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x0c
	lduw	[%g3], %i0
	lduw	[%g3 + 4], %i1

	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x0d
	lduw	[%g3], %i2
	lduw	[%g3 + 4], %i3
	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x0e
	lduw	[%g3], %i4
	lduw	[%g3 + 4], %i5
	
	add	%g7, 1, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x0f
	lduw	[%g3], %i6
	lduw	[%g3 + 4], %i7
	
	set	0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x10
	lduw	[%g3], %i0
	lduw	[%g3 + 4], %i1
	
	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x20
	lduw	[%g3], %i2
	lduw	[%g3 + 4], %i3
	
	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x30
	lduw	[%g3], %i4
	lduw	[%g3 + 4], %i5
	
	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x40
	lduw	[%g3], %i6
	lduw	[%g3 + 4], %i7

	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x50
	lduw	[%g3], %i0
	lduw	[%g3 + 4], %i1

	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x60
	lduw	[%g3], %i2
	lduw	[%g3 + 4], %i3
	
	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x70
	lduw	[%g3], %i4
	lduw	[%g3 + 4], %i5

	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x80
	lduw	[%g3], %i6
	lduw	[%g3 + 4], %i7
	
	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0x90
	lduw	[%g3], %i0
	lduw	[%g3 + 4], %i1

	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0xa0
	lduw	[%g3], %i2
	lduw	[%g3 + 4], %i3

	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0xb0
	lduw	[%g3], %i4
	lduw	[%g3 + 4], %i5

	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0xc0
	lduw	[%g3], %i6
	lduw	[%g3 + 4], %i7

	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0xd0
	lduw	[%g3], %i0
	lduw	[%g3 + 4], %i1

	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0xe0
	lduw	[%g3], %i2
	lduw	[%g3 + 4], %i3

	add	%g7, 0x10, %g7
	add	%g3, 8, %g3
	stda	%f0, [%g3+%g7]ASI_PST8_PRIMARY	! store with mask = 0xf0
	lduw	[%g3], %i4
	lduw	[%g3 + 4], %i5

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

	.align 16
test_data:
	.xword	0x0123456789abcdef      !!! original data


/************************************************************************
   Test case data start
 ************************************************************************/

SECTION       .DATA DATA_VA=IO_RD_ADDR
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}
	
.data
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

.end:	



