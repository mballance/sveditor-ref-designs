/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ifu_basic_ld.s
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
#define MAIN_PAGE_NUCLEUS_ALSO

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	! Get TID in %g6
	ta	T_RD_THID
	mov	%o1, %g6
	sllx      %g6, 0x4, %g6

	ta T_CHANGE_HPRIV

	!# LD/ST testing

	setx	user_data_start, %g7, %g1

lduw_1:		
	lduw [%g1 + 0x0], %i0
	lduw [%g1 + 0x4], %i1
	lduw [%g1 + 0x8], %i2
	lduw [%g1 + 0xc], %i3

ldub_1:		
	ldub [%g1 + 0xa0], %o0
	ldub [%g1 + 0xa1], %o1
	ldub [%g1 + 0xa2], %o2
	ldub [%g1 + 0xa3], %o3
	ldub [%g1 + 0xa4], %o4
	ldub [%g1 + 0xa5], %o5
	ldub [%g1 + 0xa6], %o6
	ldub [%g1 + 0xa7], %o7
	ldub [%g1 + 0x10], %i0
	ldub [%g1 + 0x11], %i1
	ldub [%g1 + 0x12], %i2
	ldub [%g1 + 0x13], %i3
	ldub [%g1 + 0x14], %i4
	ldub [%g1 + 0x15], %i5
	ldub [%g1 + 0x16], %i6
	ldub [%g1 + 0x17], %i7
	stb  %i0,  [%g1 + 0xa0]
	stb  %i1,  [%g1 + 0xa1]
	stb  %i2,  [%g1 + 0xa2]
	stb  %i3,  [%g1 + 0xa3]
	stb  %i4,  [%g1 + 0xa4]
	stb  %i5,  [%g1 + 0xa5]
	stb  %i6,  [%g1 + 0xa6]
	stb  %i7,  [%g1 + 0xa7]
	ldub [%g1 + 0xa0], %l0
	ldub [%g1 + 0xa1], %l1
	ldub [%g1 + 0xa2], %l2
	ldub [%g1 + 0xa3], %l3
	ldub [%g1 + 0xa4], %l4
	ldub [%g1 + 0xa5], %l5
	ldub [%g1 + 0xa6], %l6
	ldub [%g1 + 0xa7], %l7	

ldub_2:		
	ldub [%g1 + 0xa8], %o0
	ldub [%g1 + 0xa9], %o1
	ldub [%g1 + 0xaa], %o2
	ldub [%g1 + 0xab], %o3
	ldub [%g1 + 0xac], %o4
	ldub [%g1 + 0xad], %o5
	ldub [%g1 + 0xae], %o6
	ldub [%g1 + 0xaf], %o7
	ldub [%g1 + 0x18], %i0
	ldub [%g1 + 0x19], %i1
	ldub [%g1 + 0x1a], %i2
	ldub [%g1 + 0x1b], %i3
	ldub [%g1 + 0x1c], %i4
	ldub [%g1 + 0x1d], %i5
	ldub [%g1 + 0x1e], %i6
	ldub [%g1 + 0x1f], %i7
	stb  %i0,  [%g1 + 0xa8]
	stb  %i1,  [%g1 + 0xa9]
	stb  %i2,  [%g1 + 0xaa]
	stb  %i3,  [%g1 + 0xab]
	stb  %i4,  [%g1 + 0xac]
	stb  %i5,  [%g1 + 0xad]
	stb  %i6,  [%g1 + 0xae]
	stb  %i7,  [%g1 + 0xaf]
	ldub [%g1 + 0xa8], %l0
	ldub [%g1 + 0xa9], %l1
	ldub [%g1 + 0xaa], %l2
	ldub [%g1 + 0xab], %l3
	ldub [%g1 + 0xac], %l4
	ldub [%g1 + 0xad], %l5
	ldub [%g1 + 0xae], %l6
	ldub [%g1 + 0xaf], %l7	

lduh_1:		
	lduh [%g1 + 0xb0], %o0
	lduh [%g1 + 0xb2], %o1
	lduh [%g1 + 0xb4], %o2
	lduh [%g1 + 0xb6], %o3
	lduh [%g1 + 0x20], %i0
	lduh [%g1 + 0x22], %i1
	lduh [%g1 + 0x24], %i2
	lduh [%g1 + 0x26], %i3
	sth  %i0,  [%g1 + 0xb0]
	sth  %i1,  [%g1 + 0xb2]
	sth  %i2,  [%g1 + 0xb4]
	sth  %i3,  [%g1 + 0xb6]
	lduh [%g1 + 0xb0], %l0
	lduh [%g1 + 0xb2], %l1
	lduh [%g1 + 0xb4], %l2
	lduh [%g1 + 0xb6], %l3

lduh_2:		
	lduh [%g1 + 0xb8], %o0
	lduh [%g1 + 0xba], %o1
	lduh [%g1 + 0xbc], %o2
	lduh [%g1 + 0xbe], %o3
	lduh [%g1 + 0x28], %i0
	lduh [%g1 + 0x2a], %i1
	lduh [%g1 + 0x2c], %i2
	lduh [%g1 + 0x2e], %i3
	sth  %i0,  [%g1 + 0xb8]
	sth  %i1,  [%g1 + 0xba]
	sth  %i2,  [%g1 + 0xbc]
	sth  %i3,  [%g1 + 0xbe]
	lduh [%g1 + 0xb8], %l0
	lduh [%g1 + 0xba], %l1
	lduh [%g1 + 0xbc], %l2
	lduh [%g1 + 0xbe], %l3

lduw_2:		
	lduw [%g1 + 0xc0], %o0
	lduw [%g1 + 0xc4], %o1
	lduw [%g1 + 0xc8], %o2
	lduw [%g1 + 0xcc], %o3 
	lduw [%g1 + 0x30], %i0
	lduw [%g1 + 0x34], %i1
	lduw [%g1 + 0x38], %i2
	lduw [%g1 + 0x3c], %i3 
	stw  %i0,  [%g1 + 0xc0]
	stw  %i1,  [%g1 + 0xc4]
	stw  %i2,  [%g1 + 0xc8]
	stw  %i3,  [%g1 + 0xcc]
	lduw [%g1 + 0xc0], %l0
	lduw [%g1 + 0xc4], %l1
	lduw [%g1 + 0xc8], %l2
	lduw [%g1 + 0xcc], %l3 

ldx_1:		
	ldx  [%g1 + 0xd0], %o0
	ldx  [%g1 + 0xd8], %o1
	ldx  [%g1 + 0x40], %i0
	ldx  [%g1 + 0x48], %i1
	stx  %i0,  [%g1 + 0xd0]
	stx  %i2,  [%g1 + 0xd8]
	ldx  [%g1 + 0x40], %l0
	ldx  [%g1 + 0x48], %l1

ld_1:	
	ld [%g1 + 0xe0], %f0
	ld [%g1 + 0xe4], %f1
	ld [%g1 + 0xe8], %f2
	ld [%g1 + 0xec], %f3 
	ld [%g1 + 0x50], %f0
	ld [%g1 + 0x54], %f1
	ld [%g1 + 0x58], %f2
	ld [%g1 + 0x5c], %f3 
	st  %f0,  [%g1 + 0xe0]
	st  %f1,  [%g1 + 0xe4]
	st  %f2,  [%g1 + 0xe8]
	st  %f3,  [%g1 + 0xec]
	ld [%g1 + 0xe0], %f0
	ld [%g1 + 0xe4], %f1
	ld [%g1 + 0xe8], %f2
	ld [%g1 + 0xec], %f3 
	

!#	!# Ld to I/O space
!#ld_IO:	setx	0xc000000000, %i0, %l0
!#	setx	0x0123456789abcdef, %i0, %l1
!#	setx	0xfedcba9876543210, %i0, %l2
!#	ldx	[%l0], %l3
!# 	stx	%l1, [%l0+0x0]
!# 	stx	%l2, [%l0+0x8]
!#	ldub	[%l0+0x0], %l4
!#	ldub	[%l0+0x1], %l4
!#	ldub	[%l0+0x2], %l4
!#	ldub	[%l0+0x3], %l4
!#	ldub	[%l0+0x4], %l4
!#	ldub	[%l0+0x5], %l4
!#	ldub	[%l0+0x6], %l4
!#	ldub	[%l0+0x7], %l4
!#	ldub	[%l0+0x8], %l4
!#	ldub	[%l0+0x9], %l4
!#	ldub	[%l0+0xa], %l4
!#	ldub	[%l0+0xb], %l4
!#	ldub	[%l0+0xc], %l4
!#	ldub	[%l0+0xd], %l4
!#	ldub	[%l0+0xe], %l4
!#	ldub	[%l0+0xf], %l4
!#
!#	lduh	[%l0+0x0], %l5
!#	lduh	[%l0+0x2], %l5
!#	lduh	[%l0+0x4], %l5
!#	lduh	[%l0+0x6], %l5
!#	lduh	[%l0+0x8], %l5
!#	lduh	[%l0+0xa], %l5
!#
!#	lduw	[%l0+0x0], %l6
!#	lduw	[%l0+0x4], %l6
!#	lduw	[%l0+0x8], %l6
!#	lduw	[%l0+0xc], %l6
!#
!#	ldx	[%l0+0x0], %l7
!#	ldx	[%l0+0x8], %l7

!# 	!# Ld from I/O Space Random 0x82
!# ld_IO2:	setx	0x8200000000, %i0, %l0
!# 	!# Each thread must use a different random addr (ldst_sync limitation)
!# 	add	%l0, %g6, %l0
!# 	ldx	[%l0+0x0], %l3
!# 	ldx	[%l0+0x0], %l3
!# 	ldx	[%l0+0x8], %l3
!# 	ldx	[%l0+0x8], %l3
	
	EXIT_GOOD	/* test finish  */

/** these files just include for adding into the spc2 released - auditdir can pick up */
/*
#include "interrupt0x60_thread_init.s"
#include "system_init.s"
#include "interrupt0x60_sys_init.s"
#include "interrupt0x60_handler.s"
#include "ssi_defines.h"
#include "interrupt0x60_defines.h"
*/

/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.xword 0xffffffff00000dad
.xword 0x08090a0b0c0d0e0f
.xword 0x1011121314151617
.xword 0x18191a1b1c1d1e1f
.xword 0x2021222324252627
.xword 0x28292a2b2c2d2e2f
.xword 0x3031323334353637
.xword 0x38393a3b3c3d3e3f
.xword 0x4041424344454647
.xword 0x48494a4b4c4d4e4f
.xword 0x5051525354555657
.xword 0x58595a5b5c5d5e5f
.xword 0x6061626364656667
.xword 0x68696a6b6c6d6e6f
.xword 0x7071727374757677
.xword 0x78797a7b7c7d7e7f
.xword 0x8081828384858687
.xword 0x88898a8b8c8d8e8f
.xword 0x9091929394959697
.xword 0x98999a9b9c9d9e9f
.xword 0xa0a1a2a3a4a5a6a7
.xword 0xa8a9aaabacadaeaf
.xword 0xb0b1b2b3b4b5b6b7
.xword 0xb8b9babbbcbdbebf
.xword 0xc0c1c2c3c4c5c6c7
.xword 0xc8c9cacbcccdcecf
.xword 0xd0d1d2d3d4d5d6d7
.xword 0xd8d9dadbdcdddedf
.xword 0xe0e1e2e3e4e5e6e7
.xword 0xe8e9eaebecedeeef
.xword 0xf0f1f2f3f4f5f6f7
.xword 0xf8f9fafbfcfdfeff
.end
