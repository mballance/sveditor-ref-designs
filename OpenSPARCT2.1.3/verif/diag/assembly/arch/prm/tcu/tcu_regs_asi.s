/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_regs_asi.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define  TEST_DATA0         0x4c3fdead4c3fbeef
#define tmp1    %l2
#define tmp2    %l3

#include "asi_s.h"
#include "mcu_defines.h"
#include "tcu_defines.h"

/************************************************************************
   Test case code start
 ************************************************************************/

#ifdef FAST_BOOT
#define RESET_VEC 0x0000000000000000
#else
#define RESET_VEC 0xfffffffff0000000
#endif

SECTION .RED_SEC TEXT_VA = RESET_VEC
attr_text {
    Name=.RED_SEC,
    hypervisor
}

.text
      nop
      nop
      nop
      nop
      nop
      nop
      nop
      nop

.global main

main:

	! ASI_INST_MASK_REG   
L1:
        wr %g0, 0x42, %asi 
        ldxa [%g0 + ASI_INST_MASK] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_LSU_DIAG_REG   
L2:
        wr %g0, 0x42, %asi 
        ldxa [%g0 + ASI_LSU_DIAG] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_ERROR_INJECT_REG (ASI_ERROR_INJECT)   
L3:
        wr %g0, 0x43, %asi 
        ldxa [%g0 ] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_LSU_CONTROL_REG   
L4:
        wr %g0, 0x45, %asi 
        ldxa [%g0 ] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_DECR   
L5:
        wr %g0, 0x45, %asi 
        ldxa [%g0 +  0x8] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_RST_VEC_MASK  
L6:
        set     0x1, %i3
        wr %g0, 0x45, %asi 
        ldxa [%g0 +  0x18] %asi, %g7
        cmp     %g7 , %i3 
        bne     bad_trap
        membar #Sync

	! ASI_DESR   
L7:
        wr %g0, 0x4c, %asi 
        ldxa [%g0 ] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_DFESR   
L8:
        wr %g0, 0x4c, %asi 
        ldxa [%g0 + 0x8] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_CERER   
L9:
        wr %g0, 0x4c, %asi 
        ldxa [%g0 + 0x10] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_CETER   
L10:
        wr %g0, 0x4c, %asi 
        ldxa [%g0 + 0x18] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_CLESR   
L11:
        wr %g0, 0x4c, %asi 
        ldxa [%g0 + 0x20] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_CLFESR   
L12:
        wr %g0, 0x4c, %asi 
        ldxa [%g0 + 0x28] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_SPARC_PWR_MGMT   
L13:
        wr %g0, 0x4e, %asi 
        ldxa [%g0 ] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_HYP_SCRATCHPAD_0   
L14:
        wr %g0, 0x4f, %asi 
        ldxa [%g0 ] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_CMP_TICK_ENABLE   
L15:
        wr %g0, 0x41, %asi 
        ldxa [%g0 + ASI_CMP_TICK_ENABLE] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_CORE_AVAILABLE  (0x41)
L16:
        set     0xff, tmp2
        wr %g0, 0x41, %asi 
        ldxa [%g0 ] %asi, %g7
        cmp     tmp2, %g7 
        bne     bad_trap
        membar #Sync

        ! ASI_CORE_ENABLE_STATUS (0x41)
L17:
        set     0xff, tmp2
        wr %g0, 0x41, %asi
        ldxa [%g0 + ASI_CMP_CORE_ENABLED] %asi, %g7
        cmp     tmp2, %g7
        bne     bad_trap
        membar #Sync

       ! ASI_CORE_ENABLE (0x41)
L18:
        set     0xff, tmp2
        wr %g0, 0x41, %asi
        ldxa [%g0 + ASI_CMP_CORE_ENABLE] %asi, %g7
        cmp     tmp2, %g7
        bne     bad_trap
        membar #Sync

        ! ASI_XIR_STEERING (0x41)
L19:
        set     0xff, tmp2
        wr %g0, 0x41, %asi
        ldxa [%g0 + ASI_CMP_XIR_STEERING] %asi, %g7
        cmp     tmp2, %g7
        bne     bad_trap
        membar #Sync

        ! ASI_CORE_RUNNING_RW (0x41)
L20:
        set     0x1, tmp2
        wr %g0, 0x41, %asi
        ldxa [%g0 + ASI_CMP_CORE_RUNNING_RW] %asi, %g7
        cmp     tmp2, %g7
        bne     bad_trap
        membar #Sync

        ! ASI_CORE_RUNNING_STATUS (0x41)
L21:
        set     0x1, tmp2
        wr %g0, 0x41, %asi
        ldxa [%g0 + ASI_CMP_CORE_RUNNING_STATUS] %asi, %g7
        cmp     tmp2, %g7
        bne     bad_trap
        membar #Sync

        ! ASI_HYP_SCRATCHPAD_1
L22:
        wr %g0, 0x4f, %asi
        ldxa [%g0 + ASI_HYP_SCRATCHPAD_1] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_HYP_SCRATCHPAD_2
L23:
        wr %g0, 0x4f, %asi
        ldxa [%g0 + ASI_HYP_SCRATCHPAD_2] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_HYP_SCRATCHPAD_3
L24:
        wr %g0, 0x4f, %asi
        ldxa [%g0 + ASI_HYP_SCRATCHPAD_3] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_HYP_SCRATCHPAD_4
L25:
        wr %g0, 0x4f, %asi
        ldxa [%g0 + ASI_HYP_SCRATCHPAD_4] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync
        ! ASI_HYP_SCRATCHPAD_5
L26:
        wr %g0, 0x4f, %asi 
        ldxa [%g0 + ASI_HYP_SCRATCHPAD_5] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_HYP_SCRATCHPAD_6
L27:
        wr %g0, 0x4f, %asi 
        ldxa [%g0 + ASI_HYP_SCRATCHPAD_6] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_HYP_SCRATCHPAD_7
L28:
        wr %g0, 0x4f, %asi 
        ldxa [%g0 + ASI_HYP_SCRATCHPAD_7] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_IMMU_TAG_TARGET
L29:
        wr %g0, 0x50, %asi 
        ldxa [%g0 ] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_IMMU_SFSR
L30:
        wr %g0, 0x50, %asi 
        ldxa [%g0 + ASI_IMMU_SFSR_VAL] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_IMMU_TAG_ACCESS
L31:
        wr %g0, 0x50, %asi 
        ldxa [%g0 + ASI_IMMU_TAG_ACCESS_VAL] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_IMMU_VA_WATCHPOINT
L32:
        wr %g0, 0x50, %asi
        ldxa [%g0 + 0x38] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_REAL_RANGE_0
L33:
        wr %g0, 0x52, %asi
        ldxa [%g0 + ASI_MMU_REAL_RANGE_0] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_REAL_RANGE_1
L34:
        wr %g0, 0x52, %asi
        ldxa [%g0 + ASI_MMU_REAL_RANGE_1] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_REAL_RANGE_2
L35:
        wr %g0, 0x52, %asi
        ldxa [%g0 + ASI_MMU_REAL_RANGE_2] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_REAL_RANGE_3
L36:
        wr %g0, 0x52, %asi
        ldxa [%g0 + ASI_MMU_REAL_RANGE_3] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_PHYSICAL_OFFSET_0
L37:
        wr %g0, 0x52, %asi
        ldxa [%g0 + ASI_MMU_PHYSICAL_OFFSET_0] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync
        ! ASI_MMU_PHYSICAL_OFFSET_1
L38:
        wr %g0, 0x52, %asi 
        ldxa [%g0 + ASI_MMU_PHYSICAL_OFFSET_1] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_PHYSICAL_OFFSET_2
L39:
        wr %g0, 0x52, %asi 
        ldxa [%g0 + ASI_MMU_PHYSICAL_OFFSET_2] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_PHYSICAL_OFFSET_3
L40:
        wr %g0, 0x52, %asi 
        ldxa [%g0 + ASI_MMU_PHYSICAL_OFFSET_3] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0
L41:
        wr %g0, 0x54, %asi 
        ldxa [%g0 + ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1
L42:
        wr %g0, 0x54, %asi
        ldxa [%g0 + ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2
L43:
        wr %g0, 0x54, %asi
        ldxa [%g0 + ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3
L44:
        wr %g0, 0x54, %asi
        ldxa [%g0 + ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0
L45:
        wr %g0, 0x54, %asi
        ldxa [%g0 + ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync
        ! ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1
L46:
        wr %g0, 0x54, %asi
        ldxa [%g0 + ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2
L47:
        wr %g0, 0x54, %asi
        ldxa [%g0 + ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3
L48:
        wr %g0, 0x54, %asi
        ldxa [%g0 + ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_ITSB_PTR_0
L49:
        wr %g0, 0x54, %asi
        ldxa [%g0 + ASI_ITSB_PTR_0] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_ITSB_PTR_1
L50:
        wr %g0, 0x54, %asi
        ldxa [%g0 + ASI_ITSB_PTR_1] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_ITSB_PTR_2
L51:
        wr %g0, 0x54, %asi
        ldxa [%g0 + ASI_ITSB_PTR_2] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_ITSB_PTR_3
L52:
        wr %g0, 0x54, %asi 
        ldxa [%g0 + ASI_ITSB_PTR_3] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_DTSB_PTR_0
L53:
        wr %g0, 0x54, %asi 
        ldxa [%g0 + ASI_DTSB_PTR_0] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_DTSB_PTR_1
L54:
        wr %g0, 0x54, %asi 
        ldxa [%g0 + ASI_DTSB_PTR_1] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_DTSB_PTR_2
L55:
        wr %g0, 0x54, %asi 
        ldxa [%g0 + ASI_DTSB_PTR_2] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_MMU_DTSB_PTR_3
L56:
        wr %g0, 0x54, %asi 
        ldxa [%g0 + ASI_DTSB_PTR_3] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_PENDING_TABLEWALK_CONTROL
L57:
        wr %g0, 0x54, %asi 
        ldxa [%g0 + 0x90] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_PENDING_TABLEWALK_STATUS
L58:
        wr %g0, 0x54, %asi
        ldxa [%g0 + 0x98] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_DMMU_TAG_TARGET
L59:
        wr %g0, 0x58, %asi
        ldxa [%g0 ] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_DMMU_SFSR
L60:
        wr %g0, 0x58, %asi
        ldxa [%g0 + ASI_DMMU_SFSR] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_DMMU_SFAR
L61:
        wr %g0, 0x58, %asi
        ldxa [%g0 + ASI_DMMU_SFAR] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_DMMU_TAG_ACCESS
L62:
        wr %g0, 0x58, %asi
        ldxa [%g0 + ASI_DMMU_TAG_ACCESS_VAL] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

L63:
        wr %g0, 0x58, %asi
        ldxa [%g0 + ASI_DMMU_VA_WATCHPOINT_VAL] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

        ! ASI_HWTW_CONFIG
L64:
        wr %g0, 0x58, %asi 
        ldxa [%g0 + 0x40] %asi, %g7
        cmp     %g7 , %g0
        bne     bad_trap
        membar #Sync

good_trap:
	ba good_trap
        nop
	nop
bad_trap:
	ba bad_trap
	nop



/************************************************************************
   Test case data start
 ************************************************************************/
.data
.xword 0x0
user_data_start:
.end

