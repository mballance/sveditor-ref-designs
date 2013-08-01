/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_dcache_diagnostic.s
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

main:           /* test begin */

        ta      T_CHANGE_HPRIV
ERR_OFF:
    setx    0x10, %i0, %g1
    stxa    %g0, [%g1] 0x4c

	set	1, %l0
	sllx	%l0, 13, %l0

DIAGNOS_TAG:
!! addr = 1d50 (index=85, way=3)  tag = 84a2604  d1 = 22112909f6ee0ffc  d2 = eb2e2bb83d3ada45
	setx	0x1d50, %i0, %g1
	setx	0x84a2604, %i0, %g2
	stxa	%g2, [%g1] 0x47
	setx	0x22112909f6ee0ffc, %i0, %g2
	stxa	%g2, [%g1] 0x46
	add	%g1, 8, %g1
	setx	0xeb2e2bb83d3ada45, %i0, %g2
	stxa	%g2, [%g1] 0x46

DIAGNOS_DATA:
!! addr = 1d50  tag = 84a2604  d1 = 22112909f6ee0ffc  d2 = eb2e2bb83d3ada45
	setx	0x1d50, %i0, %g1
	setx	0x84a2604, %i0, %g2
	ldxa	[%g1] 0x47, %l2
	setx	0x7fffffff, %i0, %i1
	and	%i1, %l2, %l2
	cmp	%g2, %l2
	bne	bad_end
	setx	0x22112909f6ee0ffc, %i0, %g3
	or	%g1, %l0, %g1
	ldxa	[%g1] 0x46, %l3
	cmp	%g3, %l3
	bne	bad_end
	add	%g1, 8, %g1
	setx	0xeb2e2bb83d3ada45, %i0, %g4
	ldxa	[%g1] 0x46, %l4
	cmp	%g4, %l4
	bne	bad_end

DIAGNOS_VALID_WAY3:
!! addr = 1d50 (index=55, way=3)  tag = 84a2604  d1 = 22112909f6ee0ffc  d2 = eb2e2bb83d3ada45
    setx    0x1d50, %i0, %g1
    setx    0x84a2606, %i0, %g2
    stxa    %g2, [%g1] 0x47
    setx    0x22112909f6ee0ffc, %i0, %g2
    stxa    %g2, [%g1] 0x46
    add %g1, 8, %g1
    setx    0xeb2e2bb83d3ada45, %i0, %g2
    stxa    %g2, [%g1] 0x46

REG_LOAD_WAY3:
setx    0x10944c0d50, %i0, %g1
setx    0x22112909f6ee0ffc, %i0, %g3
ldxa   [%g1]0x80, %g4
cmp %g3, %g4
bne bad_end

DIAGNOS_VALID_WAY2:
!! addr = 1750 (index=75, way=2)  tag = 84a2604  d1 = 22112909f6ee0ffc  d2 = eb2e2bb83d3ada45
    setx    0x1750, %i0, %g1
    setx    0x84a2606, %i0, %g2
    stxa    %g2, [%g1] 0x47
    setx    0x22112909f6ee0ffc, %i0, %g2
    stxa    %g2, [%g1] 0x46
    add %g1, 8, %g1
    setx    0xeb2e2bb83d3ada45, %i0, %g2
    stxa    %g2, [%g1] 0x46

REG_LOAD_WAY2:
setx    0x10944c0f50, %i0, %g1
setx    0x22112909f6ee0ffc, %i0, %g3
ldxa   [%g1]0x80, %g5
cmp %g3, %g5
bne bad_end

DIAGNOS_VALID_WAY1:
!! addr = 0d50 (index=55, way=1)  tag = 84a2604  d1 = 22112909f6ee0ffc  d2 = eb2e2bb83d3ada45
    setx    0x1750, %i0, %g1
    setx    0x84a2606, %i0, %g2
    stxa    %g2, [%g1] 0x47
    setx    0x22112909f6ee0ffc, %i0, %g2
    stxa    %g2, [%g1] 0x46
    add %g1, 8, %g1
    setx    0xeb2e2bb83d3ada45, %i0, %g2
    stxa    %g2, [%g1] 0x46

REG_LOAD_WAY1:
setx    0x10944c0d50, %i0, %g1
setx    0x22112909f6ee0ffc, %i0, %g3
ldxa   [%g1]0x80, %g6
cmp %g3, %g6
bne bad_end

DIAGNOS_VALID_WAY0:
!! addr = 0750 (index=75, way=0)  tag = 84a2604  d1 = 22112909f6ee0ffc  d2 = eb2e2bb83d3ada45
    setx    0x0750, %i0, %g1
    setx    0x84a2606, %i0, %g2
    stxa    %g2, [%g1] 0x47
    setx    0x22112909f6ee0ffc, %i0, %g2
    stxa    %g2, [%g1] 0x46
    add %g1, 8, %g1
    setx    0xeb2e2bb83d3ada45, %i0, %g2
    stxa    %g2, [%g1] 0x46

REG_LOAD_WAY0:
setx    0x10944c0f50, %i0, %g1
setx    0x22112909f6ee0ffc, %i0, %g3
ldxa   [%g1]0x80, %g7
cmp %g3, %g7
bne bad_end


        nop
        EXIT_GOOD
        nop
        nop

bad_end:
	EXIT_BAD
        nop
        nop
/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.xword 0x0001020304050607
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
