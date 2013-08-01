/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: NcuRegRw.s
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
#include "peu_defines.h"

#define	ALL_FS					0xffffffffffffffff
#define	IOMMU_INVALIDATE_REG_ADDR		0x0000008000002030

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
main:
        ta T_CHANGE_HPRIV
        nop

        setx    ALL_FS, %g1, %g5

        setx    MEM32_OFFSET_BASE_REG_ADDR, %g1, %g2		! 0x8000002000
        setx    MEM32_OFFSET_BASE_REG_DATA, %g1, %g3
        ldx     [%g2], %g4					! read POR value

        stx     %g5, [%g2]					! store all Fs
        ldx     [%g2], %g4					! read back

        stx     %g3, [%g2]					! store default value
        ldx     [%g2], %g4					! read back

        setx    MEM32_OFFSET_MASK_REG_ADDR, %g1, %g2		! 0x8000002008
        setx    MEM32_OFFSET_MASK_REG_DATA, %g1, %g3
        ldx     [%g2], %g4					! read POR value

        stx     %g5, [%g2]					! store all Fs
        ldx     [%g2], %g4					! read back

        stx     %g3, [%g2]					! store default value
        ldx     [%g2], %g4					! read back

        setx    MEM64_OFFSET_BASE_REG_ADDR, %g1, %g2		! 0x8000002010
        setx    MEM64_OFFSET_BASE_REG_DATA, %g1, %g3
        ldx     [%g2], %g4					! read POR value

        stx     %g5, [%g2]					! store all Fs
        ldx     [%g2], %g4					! read back

        stx     %g3, [%g2]					! store default value
        ldx     [%g2], %g4					! read back

        setx    MEM64_OFFSET_MASK_REG_ADDR, %g1, %g2		! 0x8000002018
        setx    MEM64_OFFSET_MASK_REG_DATA, %g1, %g3
        ldx     [%g2], %g4					! read POR value

        stx     %g5, [%g2]					! store all Fs
        ldx     [%g2], %g4					! read back

        stx     %g3, [%g2]					! store default value
        ldx     [%g2], %g4					! read back
	
        setx    IOCFG_OFFSET_BASE_REG_ADDR, %g1, %g2		! 0x8000002020
        setx    IOCFG_OFFSET_BASE_REG_DATA, %g1, %g3
        ldx     [%g2], %g4					! read POR value

        stx     %g5, [%g2]					! store all Fs
        ldx     [%g2], %g4					! read back

        stx     %g3, [%g2]					! store default value
        ldx     [%g2], %g4					! read back

        setx    IOCFG_OFFSET_MASK_REG_ADDR, %g1, %g2		! 0x8000002028
        setx    IOCFG_OFFSET_MASK_REG_DATA, %g1, %g3
        ldx     [%g2], %g4					! read POR value

        stx     %g5, [%g2]					! store all Fs
        ldx     [%g2], %g4					! read back

        stx     %g3, [%g2]					! store default value
        ldx     [%g2], %g4					! read back

! not used in PCIe link training, but as long as we're here ...
	
        setx    IOMMU_INVALIDATE_REG_ADDR, %g1, %g2		! 0x8000002030
        setx    0xa0a0a0a0a0a0a0a0, %g1, %g3
        ldx     [%g2], %g4					! read POR value

        stx     %g5, [%g2]					! store all Fs
        ldx     [%g2], %g4					! read back

        stx     %g3, [%g2]					! store a0a0...
        ldx     [%g2], %g4					! read back
	
	nop
	nop
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

