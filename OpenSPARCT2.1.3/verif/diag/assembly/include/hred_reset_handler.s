/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: hred_reset_handler.s
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
.global nc_check_core_master_thread
.global check_core_master_thread
.global nc_chip_master_thread
.global chip_master_thread

#ifdef RESET_CHECK_REG
#include  "spc_por_rdchk.s"
#endif

#ifdef RESET_STAT_CHECK
! Clear %cwp before doing SAVE or using %i/%l/%o, to work around bug
hred_reset_handler_clear_cwp:
    wrpr	0, %cwp
#endif /* RESET_STAT_CHECK */

hred_reset_handler_clear_red_state:
    ! Setup for normal operations
    ! Reset hpstate.red = 0
    rdhpr	%hpstate, %l1
    wrhpr	%l1, 0x820, %hpstate
    wrpr	1, %tl

    ! set hyper trap base addr
    best_set_reg(HV_TRAP_BASE_PA,  %g2, %l7)
    wrhpr %l7, %g0, %htba

    ! Doing this in delay slot of jump from boot prom ...
    !wrpr	0, %g0, %gl

    ! load core id to %g1
    ldxa    [%g0] ASI_INTR_ID, %g1      ! USING this on N2 as a shortcut

    !! CAUTION !! Don't modify G1 until PORTABLE_CORE

#ifndef CMP_THREAD_START
hred_reset_handler_non_cmp_check_master_tid:
    ! Non-cmp thread startup.
#ifndef PORTABLE_CORE
    ! If T0 then chip-master
    brz %g1, nc_chip_master_thread      ! T0 is chip master
#endif
    wr %g0,  ASI_CMP_CORE, %asi
    ! Else figure out if lowest running
    ldxa [0x50]%asi, %g2                ! Who is running ?
    neg %g2, %l1
    xnor %g2, %l1, %l1
    popc %l1, %l1                       ! Get lowest bit set ..
    dec %l1
    cmp %l1, %g1
    bne,a %xcc, nc_check_core_master_thread
    srlx %g1, 3, %l1                    ! Get core-id

nc_chip_master_thread:
                        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        !!!!! System Level Inits in system_inits.s !!!!!
                        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "system_init.s"
nc_core_master_thread:
                        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        !!!!! Core - Level Inits in core_init.s !!!!!
                        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "core_init.s"

    ba,a all_threads

nc_check_core_master_thread:
    mov (CREGS_LSU_CTL_REG_DC << 1 | CREGS_LSU_CTL_REG_IC), %g2
    stxa %g2, [%g0] 0x45                ! Enable L1
    and %g1, 0x7, %l2                   ! Portable core ..
    brz  %l2, nc_core_master_thread     ! T0 is core master
    ldxa [0x50]%asi, %g2                ! Who is running ?
    neg %g2, %l1
    xnor %g2, %l1, %l1
    popc %l1, %l1                       ! Get lowest bit set ..
    dec %l1
    cmp %l1, %g1
    be %xcc, nc_core_master_thread
    nop

#else
    ! CMP thread startup   ! DO NOT MODIFY %G1 until CMP IS Done
    ! Find out if current thread is chip master thread
    !    Use CMP THREAD START and M4 macros for efficiency.
    !    When SIXGUNS is defined, cannot use CMP THREAD START for portability

check_chip_master_thread:
#ifndef SIXGUNS
#ifndef PORTABLE_CORE
changequote([, ])dnl ! The M4_* variables need this
    cmp %g1, M4_master_tid
changequote(`,')dnl ! [] are not quotes anymore
#else
    andcc %g1, 0x7, %g2
#endif
#else
    ! Determine master thread by querying CORE_RUNNING
    mov 0x50, %g3
    ldxa [%g3]ASI_CMP_CORE, %g2         ! Who is running ?
    neg %g2, %l1
    xnor %g2, %l1, %l1
    popc %l1, %l1                       ! Get lowest bit set ..
    dec %l1
    cmp %l1, %g1
#endif
    bne %xcc, check_core_master_thread
    wr %g0,  ASI_CMP_CORE, %asi

chip_master_thread:
                        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        !!!!! System Level Inits in system_inits.s !!!!!
                        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "system_init.s"

start_core_master_threads:
#ifndef PORTABLE_CORE
changequote([, ])dnl ! The M4_* variables need this
    best_set_reg2( M4_core_lsb_mask, %g3, %g4)
changequote(`,')dnl ! [] are not quotes anymore
    ba core_master_thread
    stxa %g4, [ASI_CMP_CORE_RUNNING_RW]%asi      ! Start core_master_threads
#endif

check_core_master_thread:

    ! Find out if current thread is core master thread
    ! by comparing current TID mask with  M4-core-lsb-mask.

#ifndef PORTABLE_CORE
    mov 0x1, %g4
    sllx %g4, %g1, %g4
changequote([, ])dnl ! The M4_* variables need this
    best_set_reg2(M4_core_lsb_mask, %g2, %g3)
changequote(`,')dnl ! [] are not quotes anymore
    mov (CREGS_LSU_CTL_REG_DC << 1 | CREGS_LSU_CTL_REG_IC), %g2
    andcc %g3, %g4, %g0
    bz  %xcc, all_threads
#else
    mov (CREGS_LSU_CTL_REG_DC << 1 | CREGS_LSU_CTL_REG_IC), %g2
    andcc %g1, 0x7, %g4     
    brnz %g4, all_threads
    nop
#endif
    stxa %g2, [%g0] 0x45                ! Enable L1

BOOT_TRACE_TO_SSI
core_master_thread:
                        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        !!!!! Core - Level Inits in core_init.s !!!!!
                        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "core_init.s"

BOOT_TRACE_TO_SSI
start_threads_in_core:
    mov 0xff, %g4
    ! load core id to %g1
    ldxa    [%g0] ASI_INTR_ID, %g1      ! USING this on N2 as a shortcut
    sllx %g4, %g1, %g4
changequote([, ])dnl ! The M4_* variables need this
    best_set_reg2(M4_thread_mask, %g2, %g3)
changequote(`,')dnl  ! Change quote back so all [] are not quoted ..
#ifdef PORTABLE_CORE
    sllx %g3, %g1, %g3
#endif
    and %g3, %g4, %g4
    stxa %g4, [ASI_CMP_CORE_RUNNING_W1S]%asi     ! Start all threads in core


#endif
all_threads:

#ifdef SIXGUNS
#define PORTABLE_CORE
#endif
#ifdef NO_SLAM_INIT
#include "hboot_init.s"
#endif

#ifndef HBOOT_HV_ONLY

hred_reset_handler_setup_partition_id:
    ! %g1 has raw TID
    ! load partition id to %l7
#ifdef PORTABLE_CORE
    mov     0x7, %g2
    and     %g1, %g2, %l7         ! %l7 has TID
#else
    or      %g1, %g0, %l7         ! %l7 has TID
#endif
    setx    part_id_list, %g1, %g2
    sllx    %l7, 3, %l7             ! offset - partition list
    ldx     [%g2 + %l7], %g2	    ! %g2 contains partition ID
                                    ! WARNING DO NOT USE %g2 !!!

    mov	ASI_PARTITION_ID_VAL, %g1
    stxa	%g2, [%g1] ASI_PARTITION_ID


! HWTW setup for real_tange and physical offsets ..
#ifdef MMU_SLAM
#include "mmu_slam.s"
    registerSlam:
    nop
#else

#ifndef NOHWTW
! Set mode for TSB search. The default mode is Sequential
set_tsb_search_mode:
#ifdef TSB_SEARCH_BURST
    mov	ASI_TSB_SEARCH_MODE_ADDR,  %l2
    or	TSB_SEARCH_BURST, %g0, %l1
    stxa	%l1, [%l2] ASI_TSB_SEARCH_MODE_REG
#endif
#ifdef TSB_SEARCH_PREDICTION
    mov	ASI_TSB_SEARCH_MODE_ADDR,  %l2
    or	TSB_SEARCH_PREDICTION, %g0, %l1
    stxa	%l1, [%l2] ASI_TSB_SEARCH_MODE_REG
#endif

hred_physical_offset:
    wr %g0, ASI_MMU_PHYSICAL_OFFSET, %asi
    setx partition_phys_offset_list, %g1, %g3
    umul %g2, 32, %g4
    add %g4, %g3, %g4

! %g2 -> partion ID
! %g3 -> [partition_phys_offset_list]
! %g4 -> [partition_phys_offset_list + PID*32]

hred_physical_offset_0:
    ldx     [%g4], %l1
    stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi

hred_physical_offset_1:
    ldx     [%g4+8], %l1
    stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi

hred_physical_offset_2:
    ldx     [%g4+16], %l1
    stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi

hred_physical_offset_3:
    ldx     [%g4+24], %l1
    stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

! Set the ranges as follows
!  3fff - 0
!  3ffff - 4000
!  3fffff - 40000
!  3ffffff - 400000
!
hred_real_range:
    wr %g0, ASI_MMU_REAL_RANGE, %asi
    !!! setx 0x8000048000000800, %g1, %l1
    !!! setx 0x807ffffff8000000, %g1, %l1         ! MAX REAL RANGE !!!

#ifndef MMU_REAL_RANGE_0
    setx    0x800007fff8000000, %g1, %l1
#else
    best_set_reg( MMU_REAL_RANGE_0 , %g1, %l1)
#endif
hred_real_range0:
    stxa    %l1, [ASI_MMU_REAL_RANGE_0] %asi

#ifndef MMU_REAL_RANGE_1
    setx    0x80007ffff8004000, %g1, %l1
#else
    best_set_reg(MMU_REAL_RANGE_1 , %g1, %l1)
#endif
hred_real_range1:
    stxa    %l1, [ASI_MMU_REAL_RANGE_1] %asi

#ifndef MMU_REAL_RANGE_2
    setx    0x8007fffff8040000, %g1, %l1
#else
    best_set_reg(MMU_REAL_RANGE_2 , %g1, %l1)
#endif
hred_real_range2:
    stxa    %l1, [ASI_MMU_REAL_RANGE_2] %asi

#ifndef MMU_REAL_RANGE_3
    setx    0x807ffffff8400000, %g1, %l1
#else
    best_set_reg(MMU_REAL_RANGE_3 , %g1, %l1)
#endif
hred_real_range3:
    stxa    %l1, [ASI_MMU_REAL_RANGE_3] %asi

#endif

hred_tsb_config:
    ! Load tsb config/base from memory
    ! and write to corresponding ASI's
    ! set tsb-config-regs for one partition

    setx    tsb_config_base_list, %l0, %g1
    umul %g2, 80, %g2 		! %g2 contains offset to tsb_config_base_list
    add	%g1, %g2, %g1		! %g1 contains pointer to tsb_config_base_list

    wr %g0, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %asi


hred_tsb_z_config_0:
    !!! Write CONTEXT ZERO, TSB_CONFIG_0 !!!

    ldx [%g1], %g4          ! part_N_z_tsb_config_0
    stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi


hred_tsb_nz_config_0:
    !!! Write CONTEXT NON-ZERO, TSB_CONFIG_0 !!!

    ldx [%g1+8], %g4          ! part_N_nz_tsb_config_0
    stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi

hred_tsb_z_config_1:
    !!! Write CONTEXT ZERO, TSB_CONFIG_1 !!!

    ldx [%g1+16], %g4          ! part_N_z_tsb_config_1
    stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi

hred_tsb_nz_config_1:
    !!! Write CONTEXT NON-ZERO, TSB_CONFIG_1 !!!

    ldx [%g1+24], %g4          ! part_N_nz_tsb_config_1
    stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi

hred_tsb_z_config_2:
    !!! Write CONTEXT ZERO, TSB_CONFIG_2 !!!

    ldx [%g1+32], %g4          ! part_N_z_tsb_config_2
    stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi

hred_tsb_nz_config_2:
    !!! Write CONTEXT NON-ZERO, TSB_CONFIG_2 !!!

    ldx [%g1+40], %g4          ! part_N_nz_tsb_config_2
    stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi


hred_tsb_z_config_3:
    !!! Write CONTEXT ZERO, TSB_CONFIG_3 !!!

    ldx [%g1+48], %g4          ! part_N_z_tsb_config_2
    stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi

hred_tsb_nz_config_3:
    !!! Write CONTEXT NON-ZERO, TSB_CONFIG_3 !!!

    ldx [%g1+56], %g4          ! part_N_nz_tsb_config_3
    stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi

#endif

#endif

#ifndef NOPMUENABLE
hred_reset_handler_enable_pmu:
    ! Enable PMU for counting instruction types
    set cregs_pcr_reg, %g2
    wr %g2, %g0, %pcr
#endif

    ! Initialize control registers per defines
    ! Added conditionals, assuming that these values init at 0x0..
ctrl_reg_init:
    wr	%g0, cregs_fprs_imm, %fprs
    wr	%g0, cregs_ccr_imm, %ccr
    wr	%g0, cregs_asi_imm, %asi
    best_set_reg(cregs_tick_r64, %g1, %g2)
    wrpr	%g2, %tick
    wrpr	cregs_pil_imm, %pil
#if (NO_SLAM_INIT || CREGS_CANSAVE > 0 || CREGS_CANSAVE > 0x0)
    wrpr	cregs_cansave_imm, %cansave
#endif
#if (NO_SLAM_INIT || CREGS_CANRESTORE > 0 || CREGS_CANRESTORE > 0x0)
    wrpr	cregs_canrestore_imm, %canrestore
#endif
#if (NO_SLAM_INIT || CREGS_OTHERWIN > 0 || CREGS_OTHERWIN > 0x0)
    wrpr	cregs_otherwin_imm, %otherwin
#endif
#if (NO_SLAM_INIT || CREGS_CLEANWIN > 0 || CREGS_CLEANWIN > 0x0)
    wrpr	cregs_cleanwin_imm, %cleanwin
#endif
#if (NO_SLAM_INIT || CREGS_WSTATE > 0 || CREGS_WSTATE > 0x0)
    wrpr	cregs_wstate_imm, %wstate
#endif

    ! Set lsu control reg. enable dcache, icache, immu, dmmu

    best_set_reg(cregs_lsu_ctl_reg_r64, %g1, %l7)
    stxa	%l7, [%g0] ASI_LSU_CTL_REG

    ! Enable error detection
    ! CETER is per thread
#ifndef NOERRCHK
enable_strand_err_traps:
    add %g0, CETER_VA, %g4
    add %g0, CETER_DATA, %g1
    sllx %g1, 60, %g1
    stxa %g1, [%g4]0x4c		!! CETER
#endif

#ifdef RESET_STAT_CHECK
hred_reset_handler_check_reset_stat:
#include "ccu_defines.h"
    setx RESET_STAT, %g1, %g2
    ldx [%g2], %g1
    and %g1, 2, %g1         !! nonzero if WMR
    brz %g1, done_reset_stat_check
    nop
this_is_wmr:
    mov 0x8, %g1
    stxa %g0, [%g1]ASI_PRIMARY_CONTEXT_REG
done_reset_stat_check:
#endif

#ifdef ENABLE_INTR0x60
#include "interrupt0x60_thread_init.s"
#endif /* ENABLE_INTR0x60 */

#ifndef DTM_ENABLED
#if defined(ENABLE_PCIE_LINK_TRAINING) || defined(FC_NO_PEU_VERA)
! ***************************************************************
! PCI Express Link Training included here for the master thread
! ***************************************************************
#ifdef CMP_THREAD_START
    ldxa    [%g0] ASI_INTR_ID, %g1
changequote([, ])dnl
    cmp     %g1, M4_master_tid
changequote(`,')dnl
    bne     %xcc, skip_wait_for_link
    nop
#include "system_init_pcie_wait.s"
#else
#include "system_init_pcie_wait.s"
#endif /* CMP_THREAD_START */

skip_wait_for_link:
    nop
#endif /* (ENABLE_PCIE_LINK_TRAINING) || defined(FC_NO_PEU_VERA) */
#endif /* not DTM_ENABLED */
	
#ifdef SYNC_THREADS
sync_thread:
    cmp_sync_threads
#endif

#ifdef ENABLE_NIU_BACKGROUND_PACKETS_IN_BOOT

#ifndef FC_NO_NIU_T2
#include "niu_start_bg_pkts.s"
#endif

#endif /* ENABLE_NIU_BACKGROUND_PACKETS_IN_BOOT */

#ifndef HBOOT_HV_ONLY
hred_reset_handler_jump_to_priv_reset:
    best_set_reg(PRIV_RESET_VA, %g1, %g2)
    wrhpr  cregs_htstate_r64, %htstate
    mov    0x0, %o0	/* please don't delete this , used in customized */
                        /* IMMU miss trap */
    jmp	%g2
    wrhpr  %g0, 0x0, %hpstate
    nop
    nop

#else
hboot_hv_only:
    !! jump directly to user code - in hpriv mode ..
    setx    start_label_list, %g1, %g2
    ldx     [%g2], %o5        ! %o5 contains start_label
    mov 0x0, %o3
    mov 0x1, %o4
    ta  T_CHANGE_CTX

#endif
