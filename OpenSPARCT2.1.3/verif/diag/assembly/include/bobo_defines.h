/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: bobo_defines.h
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
#ifndef __BOBO_DEFINES_H__
#define __BOBO_DEFINES_H__

/* All of the following are relative to the BOBO base address,
   which is 0xc800000000 (physical address) */

#define BOBO_REG_BASE     0x00000
#define BOBO_PIW_BASE     0x02000
#define BOBO_INTR_BASE    0x06000
#define BOBO_ENGINE_BASE0 0x10000
#define BOBO_ENGINE_SIZE  0x02000
#define BOBO_ENGINE_BASE1 eval(BOBO_ENGINE_BASE0 + 1*BOBO_ENGINE_SIZE)
#define BOBO_ENGINE_BASE2 eval(BOBO_ENGINE_BASE0 + 2*BOBO_ENGINE_SIZE)
#define BOBO_ENGINE_BASE3 eval(BOBO_ENGINE_BASE0 + 3*BOBO_ENGINE_SIZE)
#define BOBO_ENGINE_BASE4 eval(BOBO_ENGINE_BASE0 + 4*BOBO_ENGINE_SIZE)
#define BOBO_ENGINE_BASE5 eval(BOBO_ENGINE_BASE0 + 5*BOBO_ENGINE_SIZE)
#define BOBO_ENGINE_BASE6 eval(BOBO_ENGINE_BASE0 + 6*BOBO_ENGINE_SIZE)
#define BOBO_ENGINE_BASE7 eval(BOBO_ENGINE_BASE0 + 7*BOBO_ENGINE_SIZE)

#define BOBO_INTR_VECT_STATUS_OFFSET  eval(BOBO_REG_BASE + 0x7000)

/* The following are relative to BOBO_ENGINE_BASEx */
#define BOBO_ENGINE_SADDR_LO_OFFSET        0x00
#define BOBO_ENGINE_SADDR_HI_OFFSET        0x04
#define BOBO_ENGINE_DADDR_LO_OFFSET        0x08
#define BOBO_ENGINE_DADDR_HI_OFFSET        0x0C
#define BOBO_ENGINE_XFER_BYTE_COUNT_OFFSET 0x10
#define BOBO_ENGINE_DMA_REPETITION_OFFSET  0x14
#define BOBO_ENGINE_REQ_SIZE_OFFSET        0x18
#define BOBO_ENGINE_ADDR_STRIDE_OFFSET     0x1C
#define BOBO_ENGINE_REQ_DELAY_OFFSET       0x20
#define BOBO_ENGINE_PATTERN_CONTROL_OFFSET 0x24
#define BOBO_ENGINE_PATTERN_DATA_OFFSET    0x28
#define BOBO_ENGINE_END_INTR_OFFSET        0x2C
#define BOBO_ENGINE_OPERATION_OFFSET       0x40
#define BOBO_ENGINE_STATUS_OFFSET          0x70

#define BOBO_ENGINE_REQ_SIZE_MAX_REQ_SHIFT  16
#define BOBO_ENGINE_REQ_SIZE_MIN_REQ_SHIFT  0

#define BOBO_ENGINE_END_INTR_ENABLE         (1<<31)
#define BOBO_ENGINE_END_INTR_INT_TYPE_INTX  eval(1<<29)
#define BOBO_ENGINE_END_INTR_VECTOR_SHIFT   16

#define BOBO_ENGINE_OPERATION_OP_MR         eval(1<<24)
#define BOBO_ENGINE_OPERATION_OP_MW         eval(2<<24)
#define BOBO_ENGINE_OPERATION_OP_INTR       eval(3<<24)

#endif /* __BOBO_DEFINES_H__ */
