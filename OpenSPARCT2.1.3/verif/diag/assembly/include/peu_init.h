/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: peu_init.h
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

#define PEU_DEVICE_CNTRL_REG_ADDR	FIRE_PLC_TLU_CTB_TLR_CSR_A_DEV_CTL_ADDR
#define PEU_DEVICE_CNTRL__MPS_128	0x00
#define PEU_DEVICE_CNTRL__MPS_256	0x20
#define PEU_DEVICE_CNTRL__MPS_512	0x40

! NonPosted Header Credit - hw default 0x10
#ifndef	PEU_NPH_CREDIT
#define PEU_NPH_CREDIT			0x10
#else
#define PEU_SET_CREDITS 0
#endif

! Posted Header Credit - hw default 0x20. Changes must satisfy (PEU_PH_CREDIT+PEU_NPH_CREDIT) <= 0x30
#ifndef	PEU_PH_CREDIT
#define PEU_PH_CREDIT			0x20
#else
#define PEU_SET_CREDITS 0
#endif

! Posted Data Credit - hw default 0xc0. Changes must be less than 0xc0
#ifndef	PEU_PD_CREDIT
#define PEU_PD_CREDIT			0xc0
#else
#define PEU_SET_CREDITS 0
#endif

PEU_LINK_TRAINING_START:
	! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.PEU_LINK_TRAINING_START)) -> printf("\n\nIn peu_init.h\n")

	
#ifdef PEU_SET_CREDITS
! before doing link training, set the Ingress Initial Credits
	
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_ICI_ADDR, %g2, %g3
	setx	mpeval((PEU_NPH_CREDIT<<32)|(PEU_PH_CREDIT<<12)|(PEU_PD_CREDIT)), %g2, %g4
	stx	%g4, [%g3]
#endif
	
#ifdef ENABLE_PCIE_MPS_512
! before doing link training, set the MPS to 512
	
	setx	PEU_DEVICE_CNTRL_REG_ADDR, %g2, %g3
	mov	PEU_DEVICE_CNTRL__MPS_512, %g4
	stx	%g4, [%g3]
#else
#ifdef ENABLE_PCIE_MPS_256
! before doing link training, set the MPS to 256
	
	setx	PEU_DEVICE_CNTRL_REG_ADDR, %g2, %g3
	mov	PEU_DEVICE_CNTRL__MPS_256, %g4
	stx	%g4, [%g3]
#endif
#endif

#ifdef SET_PCIE_ACK_FREQ
! before doing link training, set the ACK_FREQ
	
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CFG_ADDR, %g2, %g3
	mov	SET_PCIE_ACK_FREQ, %g4
	sll	%g4, 8, %g4
	or	%g4, 1, %g4	! bit 0 defaults to 1 == data link layer enable
	stx	%g4, [%g3]
#endif

/*
! The following registers must be initialized in the PEU to start Link Training.
! * FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL    Reg to reset Detect.QuietilupeuScenario
!
! Following registers are optional.
! * FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL   Reg to set FTS (Fast Training Sequence) to a smaller value
! *  FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_RW1S_ALIAS_ADDR  Set FTS (Fast Training Sequence) to a smaller value
!
*/
        setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_LINK_CTL_ADDR, %g2, %g3
	ldx	[%g3], %g4
#ifdef PCI_NORMAL_LINK_INIT
        mov     0x0000, %g5	! Mission mode (normal)
#else
        mov     0x0010, %g5	! FAST LINK MODE, for simulation.
#endif
	or	%g4, %g5, %g5
        stx     %g5, [%g3]

	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g2, %g3
#ifndef PCIE_NPWR_EN_DISABLE
	setx	mpeval(FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_DATA+0x00100000), %g2, %g4
#else
	mov	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_DATA, %g4
#endif
	stx	%g4, [%g3]

   
#ifndef FC_NO_PEU_VERA
TrigPEUStart:
	nop         ! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.TrigPEUStart)) -> set_StartPEUTest()
#endif

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

	! enable bypass in IOMMU
	
	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g2, %g3
	mov	FIRE_DLC_MMU_CSR_A_CTL__BYPASS_EN, %g4
	stx	%g4, [%g3]
