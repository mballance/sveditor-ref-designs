/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: dmaept_defines.h
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

#define DMAEPT_ENG1 0x100
#define DMAEPT_ENG2 0x200
#define DMAEPT_ENG3 0x300
#define DMAEPT_ENG4 0x400

#define DMAEPT_DATA_ADDR_UPPER          0x00
#define DMAEPT_DATA_ADDR_LOWER          0x04
#define DMAEPT_PATTERN                  0x08
#define DMAEPT_ENDING_INTERRUPT         0x0C
#define DMAEPT_OPERATION                0x10
#define DMAEPT_MAX_PYLD                 0x2C
#define DMAEPT_TAG                      0x28
#define DMAEPT_INTERRUPT_ACK            0x24
#define DMAEPT_STATUS                   0x14
#define DMAEPT_DATA_MSCMPR_OFFSET       0x18
#define DMAEPT_DATA_MSCMPR_VALUE_UPPER  0x1C
#define DMAEPT_DATA_MSCMPR_VALUE_LOWER  0x20
#define DMAEPT_MSI_ADDR_UPPER           0x30
#define DMAEPT_MSI_ADDR_LOWER           0x34
#define DMAEPT_MSI_DATA                 0x38

#define DMAEPT_INTERRUPT_ACK_INTA       eval(1 << 3)
#define DMAEPT_INTERRUPT_ACK_INTB       eval(1 << 2)
#define DMAEPT_INTERRUPT_ACK_INTC       eval(1 << 1)
#define DMAEPT_INTERRUPT_ACK_INTD       eval(1 << 0)

#define DMAEPT_ENDING_INTERRUPT_NONE    eval(0 << 16)
#define DMAEPT_ENDING_INTERRUPT_INTA    eval(1 << 16)
#define DMAEPT_ENDING_INTERRUPT_INTB    eval(2 << 16)
#define DMAEPT_ENDING_INTERRUPT_INTC    eval(3 << 16)
#define DMAEPT_ENDING_INTERRUPT_INTD    eval(4 << 16)
#define DMAEPT_ENDING_INTERRUPT_MSI     eval(5 << 16)

#define DMAEPT_OPERATION_MR             eval(1 << 24)
#define DMAEPT_OPERATION_MW             eval(2 << 24)

#define CFG0_RD_ADDR      mpeval(N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA)
#define CFG0_CMDSTS_ADDR  mpeval(N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA + 0x04)
#define CFG0_BAR0_ADDR    mpeval(N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA + 0x10)
#define CFG0_BAR1_ADDR    mpeval(N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA + 0x14)
#define CFG0_BAR2_ADDR    mpeval(N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA + 0x18)
#define CFG0_BAR3_ADDR    mpeval(N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA + 0x1c)
#define CFG0_BAR4_ADDR    mpeval(N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA + 0x20)
#define CFG0_BAR5_ADDR    mpeval(N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA + 0x24)

#define DMAEPT_BAR0 0x00000000
#define DMAEPT_MEM_SIZE 0x20000
#ifdef BOBO_USE_MEM32
/* Below should be 0xc100000000 - PART0_BASE + DMAEPT_BAR2 for mem 32 PCI-E accesses */
#define BOBO_PA 0xbf00020000
#else
/* Below should be 0xc800000000 - PART0_BASE + DMAEPT_BAR0 for mem 64 PCI-E accesses */
#define BOBO_PA 0xc600000000
#endif
