/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: system_init_pcie_wait.s
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
#include "dmu_peu_regs.h"

PEU_LINK_TRAINING_WAIT: 
!
! Skip the wait for link training if in Riesling.
!
#ifdef SKIP_PCIE_LINK_WAIT
        ba      LinkTrainingDone
        nop
#endif

!
! wait for the "Link Up" status bit to get set in the PEU
!
        setx    FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_ADDR, %g2, %g3

	mov     1023, %l0
        mov     FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_EN_ERR__LUP_P, %l1

LinkTrainingLoop:
#ifndef FC_NO_PEU_VERA
        nop    ! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.LinkTrainingLoop)) -> printf("\nIn loop_LinkTraining \n")
#endif
        ldx	[%g3], %g4
        andcc   %l1, %g4, %g5
        bne     LinkTrainingDone
	nop

	dec	%l0
	brnz	%l0, LinkTrainingLoop
	nop

LinkTrainingTimeout:
        ta     T_BAD_TRAP
	nop

LinkTrainingDone:
#ifndef FC_NO_PEU_VERA
	nop      ! $EV trig_pc_d(1, @VA(.RED_EXT_SEC.LinkTrainingDone)) -> printf("\nPCI LinkTraining done\n")
#endif

#if defined(FC_NO_PEU_VERA)
#include "dmaept_init.h"
        call    DMAEptInit
        nop
#endif
