/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_regs_dram_2.s
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
#define tmp3    %l4
#define tmp4    %l5


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


        ! DRAM PRECHARGE COMMAND PERIOD
L1:  
        set     0x3, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0xb8, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM WRITE RECOVER PERIOD
L2:  
        set     0x3, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0xc0, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM AUTOREFRESH TO ACTIVE PERIOD
L3:  
        set     0x27, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0xc8, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM MODE REG SET COMMAND PERIOD
L4:  
        set     0x2, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0xd0, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM FOUR ACTIVE WINDOW 
L5:  
        set     0xa, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0xd8, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM INTERNAL WRITE TO READ COMMAND DELAY
L6:  
        set     0x2, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0xe0, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM PRECHARGE WAIT DURING POWER UP 
L7:  
        set     0x55, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0xe8, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM DIMM STACKED 
L8:  
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x108, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! DRAM EXTENDED MODE (2)
L9:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x110, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! DRAM EXTENDED MODE (1)
L10:
        set     0x18, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x118, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM EXTENDED MODE (3)
L11:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x120, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! DRAM 8 BANK MODE
L12:
        set     0x1, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x128, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM BRANCH DISABLED
L13:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x138, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! DRAM SELECT LOW ORDER ADDRESS BITS
L14:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x140, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! DRAM SINGLE CHANNEL MODE
L15:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x148, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync 

        ! DRAM DIMMs PRESENT
L16:
        set     0x1, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x1a0, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM FAIL-OVER STATUS
L17:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x220, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! DRAM FAIL-OVER MASK
L18:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x228, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! FBD CHANNEL STATE
L19:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x800, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! FBD FAST RESET FLAG (Bug filed 117094)
        ! Wait for JC to update the Riesling 6/22/06
! L20:
!       setx    0x8400000000, %l5, %l6
!       add     %l6, 0x808, %g7
!       ldx     [%g7], %g3
!       cmp     %g3, %g0
!       bne     bad_trap
!       membar #Sync

        ! FBD CHANNEL RESET
L21:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x810, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! TS1 SOUTHBOUND TO NORTHBOUND MAPPING
L22:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x818, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! TS1 TEST PARAMETER
L23:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x820, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! TS3 FAILOVER CONFIGURATION

L24:
        set     0xffff, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x828, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
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
.word 0x0
user_data_start:
.end

