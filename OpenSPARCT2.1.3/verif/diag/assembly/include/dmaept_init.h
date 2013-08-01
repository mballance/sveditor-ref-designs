/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: dmaept_init.h
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

        b PEU_DMAEPT_END
        nop

DMAEptInit:
        save
        
        ! Setup an ASI for little-endian access to PCI space
        ! ************ %l4 saves %asi so it can be restored later
        ! ************ Don't use %l4.
        rd      %asi, %l4
        wr      %g0, ASI_NL, %asi
        
        ! Setup the Command Register
        setx    CFG0_CMDSTS_ADDR, %l1, %l2
        lduwa   [%l2] %asi, %l1 ! Read it first
        ! Enable:
        !   8:  SERR
        !   6:  Parity Error
        !   2:  Bus Mastering
        !   1:  Memory Space
        or      %l1, 0x00000146, %l1
        stwa    %l1, [%l2] %asi

        ! Find out which bits of BAR0 are writable.
        setx    CFG0_BAR0_ADDR, %l1, %l2 ! BAR0
        setx    0xffffffff, %l1, %l3
        stwa    %l3, [%l2] %asi
        lduwa   [%l2] %asi, %l3

        ! Now set BAR0 to the low 32 bits of PART_0_BASE
        ! plus PCIE_MEM64_OFFSET
        setx    DMAEPT_BAR0, %l1, %l3
        setx    PCIE_MEM64_OFFSET, %l1, %l0
        add     %l0, %l3, %l0
        stwa    %l0, [%l2] %asi
        ! Just want one last look.
        lduwa   [%l2] %asi, %l1

        ! Setup BAR1 with upper 32 bits of base & offset
        srlx    %l0, 0x20, %l1
        stwa    %l1, [%l2+0x04] %asi ! BAR1

        ! Setup BAR2 as a Mem 32 BAR
        setx    DMAEPT_MEM_SIZE, %l1, %l0
        add     %l0, %l3, %l1
        stwa    %l1, [%l2+0x08] %asi ! BAR2

        ! Setup BAR3 as an IO BAR
        clr     %l1
        stwa    %l1, [%l2+0x0c] %asi ! BAR3

        ! Restore %asi to what it had when we started.
        wr      %l4, %g0, %asi

DMAEpt_Init_Done:
        ret
        restore
        
PEU_DMAEPT_END: 
        nop

        
