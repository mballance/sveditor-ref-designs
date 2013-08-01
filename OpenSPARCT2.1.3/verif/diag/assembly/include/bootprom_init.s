/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: bootprom_init.s
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
#include "partial_modes.h"
bootprom_init:
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! This section replicated from hred_reset_handler.s
!! becuse we need to run the bootprom init fom chip master
!! thread ONLY.
!
    rdhpr   %hpstate, %l1
    wrhpr   %l1, 0x820, %hpstate
    wrpr    1, %tl

    ! set hyper trap base addr
    best_set_reg(HV_TRAP_BASE_PA,  %g2, %l7)
    wrhpr %l7, %g0, %htba

    ! Doing this in delay slot of jump from boot prom ...
    !wrpr    0, %g0, %gl

    ! load core id to %g1
    ldxa    [%g0] ASI_INTR_ID, %g1      ! USING this on N2 as a shortcut

#ifndef CMP_THREAD_START
bootprom_init_non_cmp_check_master_tid:
    ! Non-cmp thread startup.
#ifndef PORTABLE_CORE
    ! If T0 then chip-master
    brz %g1, bootprom_init_master      ! T0 is chip master
    ! Else figure out if lowest running
#endif
    wr %g0,  ASI_CMP_CORE, %asi
    ldxa [0x50]%asi, %g2                ! Who is running ?
    and %g2, 1, %g3                     ! T0 IS running
    brnz %g3, bootprom_init_notmaster
    neg %g2, %l1
    xnor %g2, %l1, %l1
    popc %l1, %l1                       ! Get lowest bit set ..
    dec %l1
    cmp %l1, %g1
    be %xcc, bootprom_init_master
    srlx %g1, 3, %l1                    ! Get core-id
#else
bootprom_init_cmp_check_master_tid:
#ifndef SIXGUNS
#ifndef PORTABLE_CORE
    ! CMP thread startup   ! DONT USE %G1 until CMP IS Done
    ! Find out if current thread is chip master thread,
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
    be %xcc, bootprom_init_master
#endif

!!!!!!!!!End of thread check for chip master !!!!!!!!!!!!!!!!!!!

bootprom_init_notmaster:

#ifndef CMP_THREAD_START
ifelse(mpeval((HV_RED_TEXT_PA > 0xffffffff),2),1,
    `setx nc_check_core_master_thread,  %g3, %g2',
    `set nc_check_core_master_thread,  %g2')
    jmp %g2
    wr %g0,  ASI_CMP_CORE, %asi
#else
ifelse(mpeval((HV_RED_TEXT_PA > 0xffffffff),2),1,
    `setx check_core_master_thread,  %g3, %g2',
    `set check_core_master_thread,  %g2')
    jmp %g2
    wr %g0,  ASI_CMP_CORE, %asi
#endif

bootprom_init_master:
!!!!!!!!!!!! Master Thread Inits Here !!!!!!!!!!!!!!!!!!!!!!!!!!
#ifdef SYNC_SLAM_NO_SLAM
#include "ccu_defines.h"
    setx RESET_STAT, %g3, %g2
    ldx [%g2], %g3          !! read reset source
    and %g3, 2, %g3         !! nonzero if WMR
    brnz %g3, continue_por
    nop
    setx RESET_GEN, %g2, %g4
    mov  0x1, %g3 
    stx  %g3, [%g4]  !!trigger a warm reset
#endif


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!if ccu programming is required then it is done here
!and then a warm reset is issued
#ifdef WARM_RESET_INIT
bootprom_init_check_reset_stat:
#include "ccu_defines.h"
    setx RESET_STAT, %g3, %g2
    ldx [%g2], %g3          !! read reset source
    and %g3, 2, %g3         !! nonzero if WMR
    brnz %g3, continue_por
    nop
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!program the ccu
#ifdef CCU_REG_PROG
bootprom_init_program_ccu:
    setx cregs_ccu_ctl_reg_r64, %g2, %g3
    setx PLL_CTL, %g2, %g4
    stx  %g3, [%g4]    !!store to pll_ctl reg to make freq change
#endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! AT 04/12/06: Add DTM setup for PEU/PSR CSRs.

#ifdef DTM_ENABLED

#define PEU_MPY_FACTOR_DATA    0x0000000000000005
#define PEU_ILU_FACTOR_DATA    0x00000003ffff0004

#define PEU_PLL_CNTL_REG_ADDR	0x88006e2200
#define PEU_ILU_REG_ADDR	0x8800652000

! program MPY field of PEU Serdes PLL Ctrl Reg to x10
	setx PEU_MPY_FACTOR_DATA, %g1, %g4
	setx PEU_PLL_CNTL_REG_ADDR, %g1, %g2
	stx	%g4, [%g2]

! Now switch the PEU rate scale from full to half rate

	setx PEU_ILU_FACTOR_DATA, %g1, %g4
	setx PEU_ILU_REG_ADDR, %g1, %g2
	stx	%g4, [%g2]

#if defined(NO_SLAM_INIT_MCUCTL)

#ifndef MCU_CHANNEL_DATA
#define MCU_CHANNEL_DATA   0x0000000000170017
#endif

#define MCU_CHANNEL_MASK   0xffffffffff000000
#define MCU_CHANNEL_ADDR   0x84000008b8

#define SER_CONFIG_DATA	 0x0000000010000000
#define SER_CONFIG_MASK	 0xffffffffcfffffff
#define SER_CONFIG_ADDR	 0x84000008d0

	mov  0x1, %g5
	sllx %g5, 12, %g5	!! %g5 is 0x1000. MCU0/1/2/3's FBD_CHANNEL_STATE_REG is 0x1000 apart

!  Now set the channel latency in the MCU to 0x14

	setx	MCU_CHANNEL_ADDR, %g1, %g2
	setx	MCU_CHANNEL_MASK, %g1, %g4
#ifdef BANK01
	ldx	[%g2], %g1
	and	%g1, %g4, %g3
	setx	MCU_CHANNEL_DATA, %g1, %g4  !MCU_CHANNEL_DATA
	or	%g3, %g4, %g4
	stx	%g4, [%g2]
#endif
	add	%g2, %g5, %g2  !%g2 has MCU1 address
#ifndef BANK01
#ifdef BANK23
	ldx	[%g2], %g1
	and	%g1, %g4, %g3
	setx	MCU_CHANNEL_DATA, %g1, %g4  !MCU_CHANNEL_DATA
	or	%g3, %g4, %g4
#endif
#endif

#ifdef BANK23
	stx	%g4, [%g2]
#endif
	add	%g2, %g5, %g2  !%g2 has MCU2 address

#ifndef BANK01
#ifndef BANK23
#ifdef BANK45
	ldx	[%g2], %g1
	and	%g1, %g4, %g3
	setx	MCU_CHANNEL_DATA, %g1, %g4  !MCU_CHANNEL_DATA
	or	%g3, %g4, %g4
#endif
#endif
#endif

#ifdef BANK45
	stx	%g4, [%g2]
#endif
	add	%g2, %g5, %g2    !%g2 has MCU3 address

#ifndef BANK01
#ifndef BANK23
#ifndef BANK45
#ifdef BANK67
	ldx	[%g2], %g1
	and	%g1, %g4, %g3
	setx	MCU_CHANNEL_DATA, %g1, %g4  !MCU_CHANNEL_DATA
	or	%g3, %g4, %g4
#endif
#endif
#endif
#endif

#ifdef BANK67
	stx	%g4, [%g2]
#endif

! Now set the MCU serdes Configuration Register to half rate.

	setx	SER_CONFIG_ADDR, %g1, %g2
	setx	SER_CONFIG_MASK, %g1, %g4
#ifdef BANK01
	ldx	[%g2], %g1
	and	%g1, %g4, %g3
	setx	SER_CONFIG_DATA, %g1, %g4
	or	%g3, %g4, %g4
	stx	%g4, [%g2]
#endif
	add	%g2, %g5, %g2
#ifndef BANK01
#ifdef BANK23
	ldx	[%g2], %g1
	and	%g1, %g4, %g3
	setx	SER_CONFIG_DATA, %g1, %g4
	or	%g3, %g4, %g4
#endif
#endif
#ifdef BANK23
	stx	%g4, [%g2]
#endif
	add	%g2, %g5, %g2
#ifndef BANK01
#ifndef BANK23
#ifdef BANK45
	ldx	[%g2], %g1
	and	%g1, %g4, %g3
	setx	SER_CONFIG_DATA, %g1, %g4
	or	%g3, %g4, %g4
#endif
#endif
#endif
#ifdef BANK45
	stx	%g4, [%g2]
#endif
	add	%g2, %g5, %g2

#ifndef BANK01
#ifndef BANK23
#ifndef BANK45
#ifdef BANK67
	ldx	[%g2], %g1
	and	%g1, %g4, %g3
	setx	SER_CONFIG_DATA, %g1, %g4
	or	%g3, %g4, %g4
#endif
#endif
#endif
#endif
#ifdef BANK67
	stx	%g4, [%g2]
#endif

#include "boot_mcuctl_init_b4wmr.s"

#endif		
! end of ifdef NO_SLAM_INIT_MCUCTL
#endif		
! end of ifdef DTM_ENABLED

! END AT 04/12/06

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#ifdef MBIST_REG_PROG
bootprom_init_program_mbist:
#include "mbist_defines.h"
    setx MBIST_MODE, %g2, %g4
    mov  MBIST_MODE_REG, %g3
    stx  %g3, [%g4]    !!store to mbist_mode to configure mbist operation

    setx MBIST_BYPASS_REG, %g2, %g3
    setx MBIST_BYPASS, %g2, %g4
    stx  %g3, [%g4]  !!Program mbist_bypass to select engines

    setx MBIST_START_WMR, %g2, %g4
    mov  0x1, %g3
    stx  %g3, [%g4]  !!Enable MBIST operation during warm reset
#endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#ifdef L2_CORE_ENABLE
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!program core enable register
bootprom_init_program_core_enable:
    ldxa [%g0]0x41, %g3
    stxa %g3, [%g0+0x20]

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!program bank enable register
bootprom_init_program_l2_bank_enable:
    setx 0x8400001018, %g2, %g3
    ldxa [%g3], %g4
    add %g3, 0x8, %g3
    stxa %g4, [%g3]
#endif

#ifdef L2_IDX_HASH_EN
bootprom_init_program_l2_hash_enable:
#include "ncu_defines.h"
    setx L2_IDX_HASH_EN_ADDR, %g2, %g3
    mov  0x1, %g4
    stx  %g4, [%g3]
#endif


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!Progam the SSI clock ratio io2clk/4
!!system defaults to io2clk/8
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#ifdef SSI_CLK_4
bootprom_init_program_ssi_clk_4:
#include "ncu_defines.h"
   setx NCU_SCKSEL, %l2, %l1
   mov  0x1, %l2
   stx  %l2, [%l1]
#endif

#ifdef SSI_CLK_8_2
bootprom_init_program_ssi_clk_8_2:
#include "ncu_defines.h"
   setx NCU_SCKSEL, %l2, %l1
   mov  0x2, %l2
   stx  %l2, [%l1]
#endif

#ifdef SSI_CLK_8_3
bootprom_init_program_ssi_clk_8_3:
#include "ncu_defines.h"
   setx NCU_SCKSEL, %l2, %l1
   mov  0x3, %l2
   stx  %l2, [%l1]
#endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Down the FBD links b4 a warm reset is given
    setx 0x8400000800, %g3, %g4    !! MCU0's FBD_CHANNEL_STATE_REG
    mov  0x1, %g5
    sllx %g5, 12, %g5     !! %g5 is 0x1000. MCU0/1/2/3's FBD_CHANNEL_STATE_REG is 0x1000 apart
    stx  %g0, [%g4]
    add  %g4, %g5, %g4
    stx  %g0, [%g4]
    add  %g4, %g5, %g4
    stx  %g0, [%g4]
    add  %g4, %g5, %g4
    stx  %g0, [%g4]

! AT 04/12/06: 	For DTM vector generation, JTAG asserts PB_RST to trigger
!		WMR1 and WMR2.	Hence, not trigger WMR here in boot code.
! 		In normal DTM runs, still want to issue the WMR.
#ifndef DTM_JTAG_POR

!Generate the warm reset
    setx RESET_GEN, %g2, %g4
    mov  0x1, %g3
    stx  %g3, [%g4]  !!trigger a warm reset
#endif /* DTM_JTAG_POR */

#endif

continue_por:
#ifndef DTM_ENABLED  /* Does not work for partial mode in DTM so removed for DTM */
        setx    0x8400000280, %g2, %g3
        ldx     [%g3], %g4
        stx     %g4, [%g3]
#endif
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!WRITE to ASI_VEC_MASK This will cause all threads started
!from now on to vector to 0000020
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#ifdef BOOT_SLAVE_THREADS_FROM_MEMORY
programm_asi_vec_mask:
mov 1, %l0
mov 0x18, %l1
stxa %l0, [%l1]0x45   !set the vec mask to 1 this should cause
                      !fetches to 0x0000 for other threads
#endif


#ifdef DTM_ENABLED
#ifdef TOGGLE_ENFTP
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Set and release the ENFTP signal
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#define SERDES_CONFIG_ENFTP_MASK 0x80000

        setx    SER_CONFIG_ADDR, %g3, %g2
        ldx     [%g2], %g4
        setx    SERDES_CONFIG_ENFTP_MASK, %g5, %g6
        mov  0x1, %g5
        sllx %g5, 12, %g5       !! %g5 is 0x1000. MCU0/1/2/3's FBD_CHANNEL_STATE_REG is 0x1000 apart
        xor     %g6, %g4, %g4

    
        stx     %g4, [%g2]
        add     %g2, %g5, %g2
        stx     %g4, [%g2]
        add     %g2, %g5, %g2
        stx     %g4, [%g2]              
        add     %g2, %g5, %g2           
        stx     %g4, [%g2]
    
    
        setx    SER_CONFIG_ADDR, %g3, %g2 
        ldx     [%g2], %g4
        setx    SERDES_CONFIG_ENFTP_MASK, %g5, %g6
        mov  0x1, %g5
        sllx %g5, 12, %g5       !! %g5 is 0x1000. MCU0/1/2/3's FBD_CHANNEL_STATE_REG is 0x1000 apart

        xor     %g6, %g4, %g4
    
    
        stx     %g4, [%g2] 
        add     %g2, %g5, %g2
        stx     %g4, [%g2]
        add     %g2, %g5, %g2
        stx     %g4, [%g2]
        add     %g2, %g5, %g2
        stx     %g4, [%g2]
#endif /* TOGGLE_ENFTP */
#endif /* DTM_ENABLED */

!! AT 04/12/06: Add DTM setup to bypass IOMMU, also disable scrambling.
!		Note these are not wmr_protected, need to do this after WMR2.
!		Then trigger user event to train PCI-E link.

#ifdef DTM_ENABLED
#ifdef SSI_VEC_DIAG_POST_WRM_PEU

programm_peu_reg_dtm:
#define PEU_IOMMU_CNTL_REG_ADDR         0x8800640000
#define PEU_IOMMU_DATA                  0x0000000000000002

#define PEU_SYMBOL_TIMER_REG_ADDR	0x88006e2078
#define PEU_SYMBOL_TIMER_DATA		0x20

#define PEU_MAC_CTRL_REG_ADDR		0x88006e2060
#define PEU_MAC_CTRL_REG_SCRAMBLE_MASK	0xfffffffffffffffd
#define PEU_MAC_CTRL_REG_SCRAMBLE_DATA	0x0000000000000002

    setx PEU_IOMMU_DATA, %g1, %g4
    setx PEU_IOMMU_CNTL_REG_ADDR, %g1, %g2
    stx  %g4, [%g2]
    nop

! Disable scrambling so that peu_mio_debug_txdata is meaningful.
programm_peu_scrambling_reg_dtm:
    setx PEU_MAC_CTRL_REG_ADDR, %g1, %g2
    setx PEU_MAC_CTRL_REG_SCRAMBLE_MASK, %g1, %g4
    ldx [%g2], %g1
    and %g1, %g4, %g3
    setx PEU_MAC_CTRL_REG_SCRAMBLE_DATA, %g1, %g4
    or	%g3, %g4, %g4
    stx %g4, [%g2]

! Now we need to create a user event for the tester to send
! sufficent FTS order sets

! Also need  the tester to send one SKP order set
! Following user event does both

#ifdef DTM_PCI_USER_EVENT
!!!! StartDtm:
!!!!! x$EV trig_pc_d(1,expr(@VA(.RED_SEC.StartDtm)&0x0000ffffffffffff,16,16)) -> EnablePCIeIgCmd("STARTDTM", 0, 0, 0, 1)

! the above User Event does 25 FTSs and 1 SKP
#endif

#include "peu_init_dtm.h"

#endif		
! end of ifdef SSI_VEC_DIAG_POST_WRM
#endif		
! end of ifdef DTM_ENABLED


!!!! MCU Inits

!!!!!!!#if defined(NO_SLAM_INIT_MCUCTL)
#include "hboot_mcuctl_init.s"
!!!!!!!#endif


!!!! Partial Bank Enable

#ifdef BANK_SET_MASK_CSR
 ! Check bank enable status
 setx    0x8000001028, %g3, %g2
 ldx  [%g2 + 0], %l1
 sllx   %l1, 0x4, %l1
 and %l1, 1, %l1
 brnz	%l1, partial

 ! Set partial bank mode

 sub %g2, 8, %g2
 mov BANK_SET_MASK_CSR, %l1
 stx %l1, [%g2 + 0]
 stx %l1, [%g2 + 0x40]
 stx %l1, [%g2 + 0x80]
 stx %l1, [%g2 + 0xc0]
 stx %l1, [%g2 + 0x100]
 stx %l1, [%g2 + 0x140]
 stx %l1, [%g2 + 0x180]
 stx %l1, [%g2 + 0x1c0]

 ! Warm reset
 setx    0x8900000808, %g3, %g4
 mov     0x1, %g5
 stx     %g5, [%g4]

 partial:
#endif

#ifdef SSI_VEC_DIAG_POST_WRM
#include SSI_VEC_DIAG_POST_WRM
#endif


!!!!!!!!!!!! Master Thread Inits END !!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!! END OF BOOTPROM INIT    !!!!!!!!!!!!!!!!!!!!!!!!!!

#ifndef CMP_THREAD_START
ifelse(mpeval((HV_RED_TEXT_PA > 0xffffffff),2),1,
    `setx nc_chip_master_thread,  %g3, %g2',
    `set nc_chip_master_thread,  %g2')
    jmp %g2
    wr %g0,  ASI_CMP_CORE, %asi
#else
ifelse(mpeval((HV_RED_TEXT_PA > 0xffffffff),2),1,
    `setx chip_master_thread,  %g3, %g2',
    `set chip_master_thread,  %g2')
    jmp %g2
    wr %g0,  ASI_CMP_CORE, %asi
#endif

! No Code beyond this point
