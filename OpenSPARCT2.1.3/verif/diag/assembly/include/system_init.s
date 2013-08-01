/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: system_init.s
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
#ifdef   SEND_BOOT_TRACE_TO_SSI

#define  BOOT_TRACE_TO_SSI dec %i2; stb %i2, [%i1] 

#else
#define BOOT_TRACE_TO_SSI
#endif



/* First, set the PEU SERDES PLL ratio, since that requires WMR
 * which should be done prior to enabling caches */

#include "peu_set_serdes_pll_ratio.s"

/*
 * Set up PEU registers for dtm
 */
#ifdef DTM_ENABLED
#ifdef SEND_BOOT_TRACE_TO_SSI
set_address_ssi_boot_trace:
setx 0xfffff00000, %i0, %i1
sub  %g0, 1, %i2
sth  %i2, [%i1]
#endif

programm_peu_reg_dtm:
#define PEU_IOMMU_CNTL_REG_ADDR         0x8800640000
#define PEU_IOMMU_DATA                  0x0000000000000002

#define PEU_SYMBOL_TIMER_REG_ADDR       0x88006e2078
#define PEU_SYMBOL_TIMER_DATA           0x20

#define PEU_MAC_CTRL_REG_ADDR           0x88006e2060
#define PEU_MAC_CTRL_REG_SCRAMBLE_MASK  0xfffffffffffffffd
#define PEU_MAC_CTRL_REG_SCRAMBLE_DATA  0x0000000000000002

    setx PEU_IOMMU_DATA, %o1, %g4
    setx PEU_IOMMU_CNTL_REG_ADDR, %o1, %g2
    stx  %g4, [%g2]
    nop

! Disable scrambling so that peu_mio_debug_txdata is meaningful.
programm_peu_scrambling_reg_dtm:
    setx PEU_MAC_CTRL_REG_ADDR, %o1, %g2
    setx PEU_MAC_CTRL_REG_SCRAMBLE_MASK, %o1, %g4
    ldx [%g2], %o1
    and %o1, %g4, %g3
    setx PEU_MAC_CTRL_REG_SCRAMBLE_DATA, %o1, %g4
    or  %g3, %g4, %g4
    stx %g4, [%g2]


#include "peu_init_dtm.h"
end_programm_peu_dtm:
#endif
! end of ifdef DTM_ENABLED



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       ! Configure L2-cache
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#ifdef L2_REG_PROG
BOOT_TRACE_TO_SSI
system_init_l2_prog:
        setx    cregs_l2_ctl_reg_r64, %g2, %l1
        mov     0xa9, %g2
        sllx    %g2, 32, %g2
#ifdef BANK01
        stx     %l1, [%g2 + 0x000]
        stx     %l1, [%g2 + 0x040]
#endif
#ifdef BANK23
        stx     %l1, [%g2 + 0x080]
        stx     %l1, [%g2 + 0x0c0]
#endif
#ifdef BANK45
        stx     %l1, [%g2 + 0x100]
        stx     %l1, [%g2 + 0x140]
#endif
#ifdef BANK67
        stx     %l1, [%g2 + 0x180]
        stx     %l1, [%g2 + 0x1c0]
#endif
#ifndef SET_L2_ERROR_EN_REG
#define SET_L2_ERROR_EN_REG 1
#endif /* SET_L2_ERROR_EN_REG */
#endif /* L2_REG_PROG */


#if SET_L2_ERROR_EN_REG
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! L2_ERROR_EN_REG ( bit 0 is CEEN, bit 1 is NCEEN )
!
! Errors are always logged in the L2_ERROR_STATUS_REG
! and L2_ERROR_ADDRESS_REG regardless of the setting of the CEEN and 
! NCEEN bits in L2_ERROR_EN_REG.
! L2_ERROR_EN_REG only controls whether or not the error is reported back
! to the appropriate virtual core.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BOOT_TRACE_TO_SSI
        ! enable l2 error trap
system_init_set_l2_error_en_reg:	
	setx    cregs_l2_error_en_reg_r64, %g2, %l1
	mov	0xaa, %g2
	sllx	%g2, 32, %g2
#ifdef BANK01
	stx	%l1, [%g2 + 0x000]
	stx	%l1, [%g2 + 0x040]
#endif
#ifdef BANK23
	stx	%l1, [%g2 + 0x080]
	stx	%l1, [%g2 + 0x0c0]
#endif
#ifdef BANK45
	stx	%l1, [%g2 + 0x100]
	stx	%l1, [%g2 + 0x140]
#endif
#ifdef BANK67
	stx	%l1, [%g2 + 0x180]
	stx	%l1, [%g2 + 0x1c0]
#endif
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#endif /* SET_L2_ERROR_EN_REG */


!! L2 should be enabled by now, lets get l1 enabled.
#if (CREGS_L2_CTL_REG_DIS == 0)
system_init_enable_l1:
    mov (CREGS_LSU_CTL_REG_DC << 1 | CREGS_LSU_CTL_REG_IC), %g2
    stxa %g2, [%g0] 0x45
#endif


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!Debug port programming for modes
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#ifdef DEBUG_SOC_OBS
system_init_enable_debug_soc_obs:
  mov     0x86, %g2
  sllx    %g2, 32, %g2
  mov     0x1, %l1
  stx     %l1, [%g2]
#endif

#ifdef DEBUG_SOC_CUS
system_init_enable_debug_soc_cus:
  mov     0x86, %g2
  sllx    %g2, 32, %g2
  setx    DEBUG_SOC_CUS, %l2, %l1
  stx     %l1, [%g2]
#endif

#ifdef DEBUG_SOC_RAND
system_init_enable_debug_soc_rand:
  mov     0x86, %g2
  sllx    %g2, 32, %g2
  setx    TG_SEED, %l2, %l1
  or      %l1, 0x1, %l1
  stx     %l1, [%g2]
#endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!Progam the SSI clock ratio io2clk/4
!!system defaults to io2clk/8
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#ifdef SSI_CLK_4
system_init_program_ssi_clk_4:
#include "ncu_defines.h"
   setx NCU_SCKSEL, %l2, %l1
   mov  0x1, %l2
   stx  %l2, [%l1]
#endif

#ifdef SSI_CLK_8_2
system_init_program_ssi_clk_8_2:
#include "ncu_defines.h"
   setx NCU_SCKSEL, %l2, %l1
   mov  0x2, %l2
   stx  %l2, [%l1]
#endif

#ifdef SSI_CLK_8_3
system_init_program_ssi_clk_8_3:
#include "ncu_defines.h"
   setx NCU_SCKSEL, %l2, %l1
   mov  0x3, %l2
   stx  %l2, [%l1]
#endif

! ***************************************************************
! PCI Express Link Training included here for the master thread
! to execute if desired by the diag (non DTM mode version)
! ***************************************************************
#ifndef DTM_ENABLED
#if defined(ENABLE_PCIE_LINK_TRAINING) || defined(FC_NO_PEU_VERA)
#include "peu_init.h"
#endif
#endif
	
! ***************************************************************
! NIU initialization included here for the master thread to execute
!
! ***************************************************************
#if defined(TX_TEST) || defined(RX_TEST)

#ifndef FC_NO_NIU_T2
#include "niu_defines.h"
	call	N2_NIU_INIT
	nop
	ba	system_init_N2_NIU_Basic_init_done
	nop
#include "niu_init.h"
#endif

system_init_N2_NIU_Basic_init_done:
	nop
#endif

#ifdef CREGS_TICK_ENABLE
BOOT_TRACE_TO_SSI
system_init_enable_tick:
    ! Tick-enable is chip level ..
    mov CREGS_TICK_ENABLE, %g2
    mov 0x38, %g3
    stxa %g2, [%g3]0x41
#endif

#if ENABLE_INTR0x60
#include "interrupt0x60_sys_init.s"
#endif /* ENABLE_INTR0x60 */
