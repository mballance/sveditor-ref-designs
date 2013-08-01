/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_regs_bist.s
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


        ! Debug Port Configuration
L1:
        setx    0x8600000000, %l5, %l6
        ldx     [%l6], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! IO Quiesce Control
L2:
        setx    0x8600000000, %l5, %l6
        add     %l6, 0x8, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! MBIST Mode         
! L3:
!       setx    0x8500000000, %l5, %l6
!       ldx     [%l6], %g3
!       cmp     %g3, %g0
!       bne     bad_trap
!       membar #Sync

        ! MBIST Bypass             
! L4:
!       setx    0x8500000000, %l5, %l6
!       setx    0x8, %l5, %g7
!       add     %l6, %g7, %g7
!       ldx     [%g7], %g3
!       cmp     %g3, %g0
!       bne     bad_trap
!       membar #Sync

        ! MBIST Start             
L5:
        setx    0x8500000000, %l5, %l6
        setx    0x10, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! MBIST Abort               
L6:
        setx    0x8500000000, %l5, %l6
        setx    0x18, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! MBIST Result               
L7:
        setx    0x8500000000, %l5, %l6
        setx    0x20, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! MBIST Done                  
L8:
        setx    0x8500000000, %l5, %l6
        setx    0x28, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! MBIST Fail                  
L9:
        setx    0x8500000000, %l5, %l6
        setx    0x30, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! MBIST Start WMR             
L10:
        setx    0x8500000000, %l5, %l6
        setx    0x38, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! LBIST Mode             
L11:
        setx    0x8500000000, %l5, %l6
        setx    0x40, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! LBIST Bypass             
L12:
        setx    0x8500000000, %l5, %l6
        setx    0x48, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! LBIST Start             
L13:
        setx    0x8500000000, %l5, %l6
        setx    0x50, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! LBIST Done             
L14:
        setx    0x8500000000, %l5, %l6
        setx    0x60, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! Cycle Count            
L15:
        setx    0x8500000000, %l5, %l6
        setx    0x100, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! DCR                    
L16:
        setx    0x8500000000, %l5, %l6
        setx    0x108, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! Trigout                
L17:
        setx    0x8500000000, %l5, %l6
        setx    0x110, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! PEU Testconfig Time
L18:
        setx    0x8500000000, %l5, %l6
        add     %l6, 0x180, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! SSI Log
L19:
        setx    0x8500000000, %l5, %l6
        add     %l6, 0x18, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! PLL_CTL
L20:
        setx    0x1002011c1, tmp1, tmp2
        setx    0x8300000000, %l5, %l6
        ldx     [%l6], %g7
        cmp     %g7, %l3
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

