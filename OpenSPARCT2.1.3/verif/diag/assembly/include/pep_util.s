/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: pep_util.s
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
#include "peu_defines.h"
#include "dmaept_defines.h"

SetupDMA:       
        ! parms are:
        ! %i0 Engine
        ! %i1 Address
        ! %i2 Pattern
        ! %i3 Interrupt type
        ! %i4 Packet size, dont use 0.
        
        save

        ! Setup ASI - little-endian access to PCI space
        wr %g0, ASI_NL, %asi

        ! Offset accesses by PART_0_BASE + PCIE_MEM64_OFFSET since
        ! BAR is set that way. Physical addresses generated via TSB
        ! have this offset so mimic that when accessing directly, as here.
        sllx    %i0, 8, %l0 ! Engine ID, multiply by 0x100
        setx    (N2_PCIE_BASE_ADDR + MEM64_OFFSET_BASE_REG_DATA + PCIE_MEM64_OFFSET + PART_0_BASE), %l1, %l2
        add     %l0, %l2, %l2 ! %l2 is base address of engine regs

        ! Store upper half of address
        srlx    %i1, 32, %l0
        !setx    0xfffc0000, %l1, %l0 ! Always bypass for now.
        stwa    %l0, [%l2+DMAEPT_DATA_ADDR_UPPER] %asi

        ! Store lower half of address
        stwa    %i1, [%l2+DMAEPT_DATA_ADDR_LOWER] %asi
        
        ! Store pattern value
        stwa    %i2, [%l2+DMAEPT_PATTERN] %asi
        
        ! Interrupt type
        stwa    %i3, [%l2+DMAEPT_ENDING_INTERRUPT] %asi
        
        ! Packet size
        stwa    %i4, [%l2+DMAEPT_MAX_PYLD] %asi
        
        ! Tag for MR operations, use engine ID
        stwa    %i0, [%l2+DMAEPT_TAG] %asi

        ret
        restore

SetupInterrupt:       
        ! parms are:
        ! %i0 Engine
        ! %i1 Interrupt type
        
        save

        ! Setup an ASI for little-endian access to PCI space
        wr %g0, ASI_NL, %asi

        ! Offset accesses by PART_0_BASE + PCIE_MEM64_OFFSET since
        ! BAR is set that way. Physical addresses generated via TSB
        ! have this offset so mimic that when accessing directly, as here.
        sllx    %i0, 8, %l0 ! Engine ID, multiply by 0x100
        setx    (N2_PCIE_BASE_ADDR + MEM64_OFFSET_BASE_REG_DATA + PCIE_MEM64_OFFSET + PART_0_BASE), %l1, %l2
        add     %l0, %l2, %l2 ! %l2 is base address of engine regs

        ! Interrupt type
        stwa    %i1, [%l2+DMAEPT_ENDING_INTERRUPT] %asi

        ret
        restore

SetupMSI:       
        ! parms are:
        ! %i0 Engine
        ! %i1 MSI Address
        ! %i2 MSI Data
        
        save

        ! Setup an ASI for little-endian access to PCI space
        wr %g0, ASI_NL, %asi

        ! Offset accesses by PART_0_BASE + PCIE_MEM64_OFFSET since
        ! BAR is set that way. Physical addresses generated via TSB
        ! have this offset so mimic that when accessing directly, as here.
        sllx    %i0, 8, %l0 ! Engine ID, multiply by 0x100
        setx    (N2_PCIE_BASE_ADDR + MEM64_OFFSET_BASE_REG_DATA + PCIE_MEM64_OFFSET + PART_0_BASE), %l1, %l2
        add     %l0, %l2, %l2 ! %l2 is base address of engine regs

        ! Store upper half of address
        srlx    %i1, 32, %l0
        stwa    %l0, [%l2+DMAEPT_MSI_ADDR_UPPER] %asi

        ! Store lower half of address
        stwa    %i1, [%l2+DMAEPT_MSI_ADDR_LOWER] %asi
        
        ! Store MSI data
        stwa    %i2, [%l2+DMAEPT_MSI_DATA] %asi

        ret
        restore
        
InitiateDMA: ! Operation & count, this starts the engine.
        ! parms are:
        ! %i0 Engine
        ! %i1 Operation & Count
        save

        ! Setup an ASI for little-endian access to PCI space
        wr %g0, ASI_NL, %asi

        ! Offset accesses by PART_0_BASE + PCIE_MEM64_OFFSET since
        ! BAR is set that way. Physical addresses generated via TSB
        ! have this offset so mimic that when accessing directly, as here.
        sllx    %i0, 8, %l0 ! Engine ID, multiply by 0x100
        setx    (N2_PCIE_BASE_ADDR + MEM64_OFFSET_BASE_REG_DATA + PCIE_MEM64_OFFSET + PART_0_BASE), %l1, %l2
        add     %l0, %l2, %l2 ! %l2 is base address of engine regs

        stwa    %i1, [%l2+DMAEPT_OPERATION] %asi

        ret
        restore

WaitOnDMA:       
        ! parms are:
        ! %i0 Engine
        ! %i1 Timeout count
        save

        ! Setup an ASI for little-endian access to PCI space
        wr %g0, ASI_NL, %asi

        ! Offset accesses by PART_0_BASE + PCIE_MEM64_OFFSET since
        ! BAR is set that way. Physical addresses generated via TSB
        ! have this offset so mimic that when accessing directly, as here.
        sllx    %i0, 8, %l0 ! Engine ID, multiply by 0x100
        setx    (N2_PCIE_BASE_ADDR + MEM64_OFFSET_BASE_REG_DATA + PCIE_MEM64_OFFSET + PART_0_BASE), %l1, %l2
        add     %l0, %l2, %l2 ! %l2 is base address of engine regs

        ! Setup to read the status register, watching for engine
        ! to finish, a DMA MR from the endpoint takes a lot longer
        ! to complete than the DMA MW for some reason.
        mov     %i1, %l4
        setx    0xf, %l1, %l5         ! ... state state 0
        setx    0x10, %l1, %l6        ! or miscompare

LoopOnEnd:
        lduwa   [%l2+DMAEPT_STATUS] %asi, %l1
        andcc   %l1, %l6, %l0
        bne     Miscompare
        setx    1, %l1, %i0 ! Return 1 for miscompare
        
        andcc   %l1, %l5, %l0
        beq     Return ! Idle, good
        clr     %i0 ! Return 0 for good
        cmp     %l0, 0x4 ! Also allow for Waiting for interrupt Ack'
        bge     Return

        dec     %l4
        brnz    %l4, LoopOnEnd
        nop

        b       Return
        setx    2, %l1, %i0 ! Return 2 for hang

Miscompare:
        ! Read miscompare info
        lduwa   [%l2+DMAEPT_DATA_MSCMPR_OFFSET] %asi, %i4
        lduwa   [%l2+DMAEPT_DATA_MSCMPR_VALUE_UPPER] %asi,%i5
        lduwa   [%l2+DMAEPT_DATA_MSCMPR_VALUE_LOWER] %asi, %i6

Return: 
        ret
        restore

        
