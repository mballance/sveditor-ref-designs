/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: peu_init_dtm.h
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
! Per DH suggestion, before any PIO access to PCI-E addr space, need to setup
! Base and Mask registers in NCU.  Copied the code below from ./peu_init.h
! 	- AT, 02/28/06

#include "peu_defines.h"
#include "dmu_peu_regs.h"

!
! Set up the Base and Mask registers in the NCU to enable PIO reads and writes
!
        setx    MEM32_OFFSET_BASE_REG_ADDR, %g2, %g3		! 0x8000002000
        setx    MEM32_OFFSET_BASE_REG_DATA, %g2, %g4
        stx     %g4, [%g3]

        !setx    MEM32_OFFSET_MASK_REG_ADDR, %g2, %g3		! 0x8000002008
        setx    MEM32_OFFSET_MASK_REG_DATA, %g2, %g4
        stx     %g4, [%g3 + 0x8]

        !setx    MEM64_OFFSET_BASE_REG_ADDR, %g2, %g3		! 0x8000002010
        setx    MEM64_OFFSET_BASE_REG_DATA, %g2, %g4
        stx     %g4, [%g3 + 0x10]

        !setx    MEM64_OFFSET_MASK_REG_ADDR, %g2, %g3		! 0x8000002018
        setx    MEM64_OFFSET_MASK_REG_DATA, %g2, %g4
        stx     %g4, [%g3 + 0x18]
	
        !setx    IOCFG_OFFSET_BASE_REG_ADDR, %g2, %g3		! 0x8000002020
        setx    IOCFG_OFFSET_BASE_REG_DATA, %g2, %g4
        stx     %g4, [%g3 + 0x20]

        !setx    IOCFG_OFFSET_MASK_REG_ADDR, %g2, %g3		! 0x8000002028
        setx    IOCFG_OFFSET_MASK_REG_DATA, %g2, %g4
        stx     %g4, [%g3 + 0x28]

	! Load the PCIE MEM64 OFFSET Register (and pio deadlock mode bits)
	
        setx    FIRE_DLC_IMU_ICS_CSR_A_MEM_64_PCIE_OFFSET_REG_ADDR, %g2, %g3
#ifndef	PEU_PIO_MODE
#define PCIE_MEM64_OFFSET_PLUS_PIO_MODE   PCIE_MEM64_OFFSET
#else
#define PCIE_MEM64_OFFSET_PLUS_PIO_MODE   mpeval(PCIE_MEM64_OFFSET | (PEU_PIO_MODE & 3))
#endif
        setx    PCIE_MEM64_OFFSET_PLUS_PIO_MODE, %g2, %g4
        stx     %g4, [%g3]

!	! enable bypass in IOMMU
	
!	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g2, %g3
!	mov	FIRE_DLC_MMU_CSR_A_CTL__BYPASS_EN, %g4
!	stx	%g4, [%g3]
