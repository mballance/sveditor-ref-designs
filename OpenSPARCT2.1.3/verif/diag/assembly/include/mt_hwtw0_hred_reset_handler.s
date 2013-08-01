/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mt_hwtw0_hred_reset_handler.s
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
#define TRAP_2E_START             0x0122000
#define MAIN_BASE_TEXT_VA_CONTEXT 0x20000044
		
! HRED_SESET_HANDLER Code here
! 
	!! N2 TBD Need to enable L1-caches
	!! N2 TBD Need to enable L2-cache


#ifndef CUSTOM_THREAD_START
    ! N2 Thread start stuff here
#ifdef SYNC_THREADS
	! N2 Thread sync stuff here
#endif
#endif

	! Reset hpstate.red = 0 
    ! N2 hpstate.enb = 1

	rdhpr	%hpstate, %l1 
	wrhpr	%l1, 0x820, %hpstate

	wrpr	0, %tl
    wrpr	0, %g0, %gl     

#ifdef NO_SLAM_INIT
#include "hboot_init.s"
#endif
	
	! load partition id to %l7
    wr      %g0, ASI_CORE_ID, %asi
    ldxa    [ASI_CORE_ID_VA] %asi, %l7

#ifdef PORTABLE_CORE
    set     0x07, %g1
#else
    set     0x3f, %g1
#endif
    and     %l7, %g1, %l7         ! %l7 has TID
	setx	part_id_list, %g1, %g2
    sllx    %l7, 3, %l7             ! offset - partition list
    ldx     [%g2 + %l7], %g2	    ! %g2 contains partition ID

	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx HV_TRAP_BASE_PA, %l0, %l7
	wrhpr %l7, %g0, %htba

hred_tsb_config:
	! Load tsb config/base from memory
	! and write to corresponding ASI's
	! set tsb-config-regs for one partition

	setx	tsb_config_base_list, %l0, %g1
	umul %g2, 80, %g2 		! %g2 contains offset to tsb_config_base_list
	add	%g1, %g2, %g1		! %g1 contains pointer to tsb_config_base_list

    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
    wr %g3, 0x0, %asi


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

	! Init dtsb entry for i context zero ps0, ps1
	! Set lsu control reg. enable dcache, icache, immu, dmmu

	setx	cregs_lsu_ctl_reg_r64, %g1, %l7
	stxa	%l7, [%g0] ASI_LSU_CTL_REG

	wrpr	1, %tl
	setx	cregs_htstate_r64, %g1, %g4
	wrhpr	%g4, %g0, %htstate
	wrpr	0, %tl
	mov     0x0, %o0	/* please don't delete this , used in customized */
                        /* IMMU miss trap */
	
	! Van's code begin -> preloading iTLB

	! IMMU_TAG_ACCESS
	set	0x0134000, %l2
	mov	0x30, %l3
	stxa	%l2, [%l3] 0x50

	mov	0x000, %l4
	setx	0x8000001000134540, %l1, %l2 ! data, sun4v
	stxa	%l2, [%l4] 0x54
	! Van's code end

	setx	HPriv_Reset_Handler, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x800, %hpstate
    nop
    nop

