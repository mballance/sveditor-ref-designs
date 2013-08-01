/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: spc_por_rdchk.s
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
#ifndef __HBOOT_S__

#include "asi_s.h"

SECTION .RED_SEC TEXT_VA = 0xfffffffff0000000

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
POR:    
        jmp %g0+0x100
        nop

SECTION .POR_SEC TEXT_VA = 0x0

attr_text {
    Name=.POR_SEC,
    hypervisor
}

.text
    nop
.align 0x100
#endif

#ifndef ASI_CHECK_GOODTRAP
por_asr:
    rdpr %pstate, %g1
    rdhpr %hpstate, %g1
    rdpr %tba, %g1
    rdhpr %htba, %g1
    rd %y, %g1
    rdpr %pil, %g1
    rdpr %cwp, %g1
    rdpr %tt, %g1
    rd %ccr, %g1
    rd %asi, %g1
    rdpr %tl, %g1
    rdpr %cansave, %g1
    rdpr %canrestore, %g1
    rdpr %otherwin, %g1
    rdpr %cleanwin, %g1
    rdpr %wstate, %g1
    rdhpr %ver, %g1
    stx %fsr, [%g0]
    rd %fprs, %g1
    rd %gsr, %g1
    rd %pcr, %g1
    rd %pic, %g1
    rd %tick_cmpr, %g1
    rd %asr25, %g1
    rdhpr %hsys_tick_cmpr, %g1
    rdhpr %hintp, %g1
    rd %softint, %g1

por_tstack:
    ! Trap Stack 
por_irf:
    ! IRF
por_frf:
    ! FRF
por_stb:
    ! STBuffer 

#else
    !Clear error-inject
    ldxa [%g0]ASI_ERROR_INJECT, %g1
    stxa %g0, [%g0]ASI_ERROR_INJECT
#endif

por_asi:
    ! ASIs
    !   ASI_SCRATCHPAD_0_REG
    ldxa [%g0]ASI_SCRATCHPAD, %g1
    !   ASI_SCRATCHPAD_1_REG
    mov 0x8, %g1
    ldxa [%g1]ASI_SCRATCHPAD, %g1
    !   ASI_SCRATCHPAD_2_REG
    mov 0x10, %g1
    ldxa [%g1]ASI_SCRATCHPAD, %g1
    !   ASI_SCRATCHPAD_3_REG
    mov 0x18, %g1
    ldxa [%g1]ASI_SCRATCHPAD, %g1
    !   ASI_SCRATCHPAD_4_REG
    !mov 0x20, %g1
    !ldxa [%g1]ASI_SCRATCHPAD, %g1
    !   ASI_SCRATCHPAD_5_REG
    !mov 0x28, %g1
    !ldxa [%g1]ASI_SCRATCHPAD, %g1
    !   ASI_SCRATCHPAD_6_REG
    mov 0x30, %g1
    ldxa [%g1]ASI_SCRATCHPAD, %g1
    !   ASI_SCRATCHPAD_7_REG
    mov 0x38, %g1
    ldxa [%g1]ASI_SCRATCHPAD, %g1
    !   ASI_PRIMARY_CONTEXT_0 
    mov 0x8, %g1
    ldxa [%g1]ASI_PRIMARY_CONTEXT_REG, %g1
    !   ASI_PRIMARY_CONTEXT_1 
    mov 0x108, %g1
    ldxa [%g1]ASI_PRIMARY_CONTEXT_REG, %g1
    !   ASI_SECONDARY_CONTEXT_0 
    mov 0x010, %g1
    ldxa [%g1]ASI_PRIMARY_CONTEXT_REG, %g1
    !   ASI_SECONDARY_CONTEXT_1 
    mov 0x110, %g1
    ldxa [%g1]ASI_PRIMARY_CONTEXT_REG, %g1
    !   ASI_CPU_MONDO_QUEUE_HEAD 
    mov 0x3c0, %g1
    ldxa [%g1]ASI_QUEUE, %g1
    !   ASI_CPU_MONDO_QUEUE_TAIL 
    mov 0x3c8, %g1
    ldxa [%g1]ASI_QUEUE, %g1
    !   ASI_DEVICE_QUEUE_HEAD 
    mov 0x3d0, %g1
    ldxa [%g1]ASI_QUEUE, %g1
    !   ASI_DEVICE_QUEUE_TAIL 
    mov 0x3d8, %g1
    ldxa [%g1]ASI_QUEUE, %g1
    !   ASI_RES_ERROR_QUEUE_HEAD 
    mov 0x3e0, %g1
    ldxa [%g1]ASI_QUEUE, %g1
    !   ASI_RES_ERROR_QUEUE_TAIL 
    mov 0x3e8, %g1
    ldxa [%g1]ASI_QUEUE, %g1
    !   ASI_CWQ_HEAD 
    ldxa [%g0]ASI_SPU, %g1
    !   ASI_CWQ_TAIL 
    mov 0x8, %g1
    ldxa [%g1]ASI_SPU, %g1
    !   ASI_CWQ_FIRST 
    mov 0x10, %g1
    ldxa [%g1]ASI_SPU, %g1
    !   ASI_CWQ_LAST 
    mov 0x18, %g1
    ldxa [%g1]ASI_SPU, %g1
    !   ASI_CWQ_CSR 
    mov 0x20, %g1
    ldxa [%g1]ASI_SPU, %g1
    !   ASI_CWQ_SYNC 
    mov 0x30, %g1
    ldxa [%g1]ASI_SPU, %g1
    !   ASI_SPU_MA_CTL 
    mov 0x80, %g1
    ldxa [%g1]ASI_SPU, %g1
    !   ASI_SPU_MA_PA 
    mov 0x88, %g1
    ldxa [%g1]ASI_SPU, %g1
    !   ASI_SPU_MA_ADDR 
    mov 0x90, %g1
    ldxa [%g1]ASI_SPU, %g1
    !   ASI_SPU_MA_NP 
    mov 0x98, %g1
    ldxa [%g1]ASI_SPU, %g1
    !   ASI_SPU_MA_SYNC 
    mov 0xa0, %g1
    ldxa [%g1]ASI_SPU, %g1
    !   ASI_INST_MASK_REG
    mov 0x8, %g1
    ldxa [%g1]ASI_DIAG, %g1
    !   ASI_LSU_DIAG_REG 
    mov 0x10, %g1
    ldxa [%g1]ASI_DIAG, %g1
    !   ASI_ERROR_INJECT_REG 
    ldxa [%g0]ASI_ERROR_INJECT, %g1
    !   ASI_LSU_CONTROL_REG 
    ldxa [%g0]ASI_LSU_CONTROL, %g1
    !   ASI_DECR 
    mov 0x8, %g1
    ldxa [%g1]ASI_LSU_CONTROL, %g1
	
    !   ASI_OVERLAP_MODE - access not implemented. See bug 103105
    !mov 0x10, %g1
    !ldxa [%g1]ASI_LSU_CONTROL, %g1
    !   ASI_WMR_VEC_MASK 
    !mov 0x18, %g1
    !ldxa [%g1]ASI_LSU_CONTROL, %g1
	
    !   ASI_DESR 
    ldxa [%g0]ASI_DESR, %g1
    !   ASI_DFESR 
    mov 0x8, %g1
    ldxa [%g1]ASI_DFESR, %g1
    !   ASI_CERER 
    mov 0x10, %g1
    ldxa [%g1]ASI_CERER, %g1
    !   ASI_CETER
    mov 0x18, %g1
    ldxa [%g1]ASI_CETER, %g1
    !   ASI_CLESR
    mov 0x20, %g1
    ldxa [%g1]0x4c, %g1
    !   ASI_CLFESR
    mov 0x28, %g1
    ldxa [%g1]0x4c, %g1
    !   ASI_SPARC_PWR_MGMT 
    ldxa [%g0]ASI_SPARC_PWR_MGMT, %g1
    !   ASI_HYP_SCRATCHPAD_0_REG
    ldxa [%g0]ASI_HYP_SCRATCHPAD, %g1
    !   ASI_HYP_SCRATCHPAD_1_REG 
    mov 0x8, %g1
    ldxa [%g1]ASI_HYP_SCRATCHPAD, %g1
    !   ASI_HYP_SCRATCHPAD_2_REG
    mov 0x10, %g1
    ldxa [%g1]ASI_HYP_SCRATCHPAD, %g1
    !   ASI_HYP_SCRATCHPAD_3_REG 
    mov 0x18, %g1
    ldxa [%g1]ASI_HYP_SCRATCHPAD, %g1
    !   ASI_HYP_SCRATCHPAD_4_REG
    mov 0x20, %g1
    ldxa [%g1]ASI_HYP_SCRATCHPAD, %g1
    !   ASI_HYP_SCRATCHPAD_5_REG 
    mov 0x28, %g1
    ldxa [%g1]ASI_HYP_SCRATCHPAD, %g1
    !   ASI_HYP_SCRATCHPAD_6_REG
    mov 0x30, %g1
    ldxa [%g1]ASI_HYP_SCRATCHPAD, %g1
    !   ASI_HYP_SCRATCHPAD_7_REG 
    mov 0x38, %g1
    ldxa [%g1]ASI_HYP_SCRATCHPAD, %g1
    !   ASI_IMMU_TAG_TARGET
    ldxa [%g0]ASI_IMMU_TAG_REG, %g1
    !   ASI_IMMU_SFSR 
    mov 0x18, %g1
    ldxa [%g1]ASI_IMMU_TAG_REG, %g1
    !   ASI_IMMU_TAG_ACCESS 
    mov 0x30, %g1
    ldxa [%g1]ASI_IMMU_TAG_REG, %g1
    !   ASI_IMMU_VA_WATCHPOINT 
    mov 0x38, %g1
    ldxa [%g1]ASI_IMMU_TAG_REG, %g1
    !   ASI_MMU_REAL_RANGE_0 
    mov 0x108, %g1
    ldxa [%g1]ASI_MMU_REAL_RANGE, %g1
    !   ASI_MMU_REAL_RANGE_1 
    mov 0x110, %g1
    ldxa [%g1]ASI_MMU_REAL_RANGE, %g1
    !   ASI_MMU_REAL_RANGE_2 
    mov 0x118, %g1
    ldxa [%g1]ASI_MMU_REAL_RANGE, %g1
    !   ASI_MMU_REAL_RANGE_3 
    mov 0x120, %g1
    ldxa [%g1]ASI_MMU_REAL_RANGE, %g1
    !   ASI_MMU_PHYSICAL_OFFSET_0 
    mov 0x208, %g1
    ldxa [%g1]ASI_MMU_PHYSICAL_OFFSET, %g1
    !   ASI_MMU_PHYSICAL_OFFSET_1 
    mov 0x210, %g1
    ldxa [%g1]ASI_MMU_PHYSICAL_OFFSET, %g1
    !   ASI_MMU_PHYSICAL_OFFSET_2 
    mov 0x218, %g1
    ldxa [%g1]ASI_MMU_PHYSICAL_OFFSET, %g1
    !   ASI_MMU_PHYSICAL_OFFSET_3 
    mov 0x220, %g1
    ldxa [%g1]ASI_MMU_PHYSICAL_OFFSET, %g1
    !   ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0 
    mov 0x10, %g1
    ldxa [%g1]ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g1
    !   ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1 
    mov 0x18, %g1
    ldxa [%g1]ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g1
    !   ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2 
    mov 0x20, %g1
    ldxa [%g1]ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g1
    !   ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3 
    mov 0x28, %g1
    ldxa [%g1]ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g1
    !   ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0 
    mov 0x30, %g1
    ldxa [%g1]ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g1
    !   ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1 
    mov 0x38, %g1
    ldxa [%g1]ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g1
    !   ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2 
    mov 0x40, %g1
    ldxa [%g1]ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g1
    !   ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3 
    mov 0x48, %g1
    ldxa [%g1]ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g1
    !   ASI_ITSB_PTR_0  
    mov 0x50, %g1
    ldxa [%g1]ASI_ITSB_PTR, %g1
    !   ASI_ITSB_PTR_1 
    mov 0x58, %g1
    ldxa [%g1]ASI_ITSB_PTR, %g1
    !   ASI_ITSB_PTR_2
    mov 0x60, %g1
    ldxa [%g1]ASI_ITSB_PTR, %g1
    !   ASI_ITSB_PTR_3   
    mov 0x68, %g1
    ldxa [%g1]ASI_ITSB_PTR, %g1
    !   ASI_DTSB_PTR_0  
    mov 0x70, %g1
    ldxa [%g1]ASI_DTSB_PTR, %g1
    !   ASI_DTSB_PTR_1 
    mov 0x78, %g1
    ldxa [%g1]ASI_DTSB_PTR, %g1
    !   ASI_DTSB_PTR_2
    mov 0x80, %g1
    ldxa [%g1]ASI_DTSB_PTR, %g1
    !   ASI_DTSB_PTR_3
    mov 0x88, %g1
    ldxa [%g1]ASI_DTSB_PTR, %g1
    !   ASI_DMMU_SFSR 
    mov 0x18, %g1
    ldxa [%g1]ASI_DMMU, %g1
    !   ASI_DMMU_SFAR 
    mov 0x20, %g1
    ldxa [%g1]ASI_DMMU, %g1
    !   ASI_DTLB_TAG_ACCESS
    mov 0x30, %g1
    ldxa [%g1]ASI_DMMU, %g1
    !   ASI_DMMU_WATCHPOINT 
    mov 0x38, %g1
    ldxa [%g1]ASI_DMMU, %g1
    !   ASI_HWTW_CONFIG 
    mov 0x40, %g1
    ldxa [%g1]ASI_DMMU, %g1
    !   ASI_PARTITION_ID 
    mov 0x80, %g1
    ldxa [%g1]ASI_DMMU, %g1
    !   ASI_INTR_RECEIVE
    ldxa [%g0]ASI_INTR_RECEIVE, %g1

finished_por_rdchk:
    nop
    nop
#ifndef __HBOOT_S__
good_trap:
    ba good_trap
    nop
#endif
