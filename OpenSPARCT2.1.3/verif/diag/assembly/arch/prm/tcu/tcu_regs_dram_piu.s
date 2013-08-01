/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_regs_dram_piu.s
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



        ! DISABLE STATE PERIOD (Bug filed - 109124) 
! L1:
!       set     0x3f, %i3
!       setx    0x8400000000, %l5, %l6
!       add     %l6, 0x838, %g7
!       ldx     [%g7], %g3
!       cmp     %g3, %i3
!       bne     bad_trap
!       membar #Sync

       ! CALIBRATE STATE PERIOD  
L2:    
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x848, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! Training State Minimum Time
L3:    
        set     0xff, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x858, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! Training State Timeout
L4:     
        set     0xff, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x868, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! Testing State Timeout
L5:    
       set     0xff, %i3
       setx    0x8400000000, %l5, %l6
       add     %l6, 0x878, %g7
       ldx     [%g7], %g3
       cmp     %g3, %i3
       bne     bad_trap
       membar #Sync
        
        ! Polling State Timeout
L6:    
       set     0xff, %i3
       setx    0x8400000000, %l5, %l6
       add     %l6, 0x888, %g7
       ldx     [%g7], %g3
       cmp     %g3, %i3
       bne     bad_trap
       membar #Sync

        ! Config State Done     
L7:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x890, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! DRAM Per-Rank CKE
L8:     
        set     0xffff, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x8a0, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! L0s Duration
L9:   
        set     0x2a, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x8a8, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! Channel Sync Fram Frequency
L10:
        set     0x2a, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x8b0, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! SERDES Configuration Bus
L11:    
       set     0x1000018, %i3
       setx    0x8400000000, %l5, %l6
       add     %l6, 0x8d0, %g7
       ldx     [%g7], %g3
       cmp     %g3, %i3
       bne     bad_trap
       membar #Sync

        ! SERDES Transmitter and Receiver
L12:
       setx    0x8400000000, %l5, %l6
       add     %l6, 0x8d8, %g7
       ldx     [%g7], %g3
       cmp     %g3, %g0
       bne     bad_trap
       membar #Sync

        ! SERDES Test Configuration Bus
L13:
        set     0xc003, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x8e0, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM FBD Injected Error Source
L14:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0xc08, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! DRAM FBR Count
L15:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0xc10, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! IMU Error Log Enable
L16:
        set     0x7fff, %i3
        setx    0x8800631000, %l5, %l6
        ldx     [%l6], %g3
        cmp     %g3, %i3
        bne     bad_trap 
        membar #Sync

        ! IMU Error Status Clear
L17:
        setx    0x8800631000, %l5, %l6
        add     %l6, 0x018, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! IMU Error Status Set
L18:   
        setx    0x8800631000, %l5, %l6
        add     %l6, 0x020, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! IMU RDS Error Log
L19:     
        setx    0x8800631000, %l5, %l6
        add     %l6, 0x028, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync
        
        ! IMU SCS Error Log
L20:     
        setx    0x8800631000, %l5, %l6
        add     %l6, 0x030, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync
        
        ! IMU EQS Error Log
L21:     
        setx    0x8800631000, %l5, %l6
        add     %l6, 0x038, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! MMU Error Log Enable
L22:
        set     0x1fffff, %i3
        setx    0x8800641000, %l5, %l6
        ldx     [%l6], %g3
        cmp     %g3, %i3
        bne     bad_trap 
        membar #Sync

        ! MMU Error Status Clear
L23:
        setx    0x8800641000, %l5, %l6
        add     %l6, 0x018, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! MMU Translation Fault Addr
L24:   
        setx    0x8800641000, %l5, %l6
        add     %l6, 0x028, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! MMU Translation Fault Status
L25:
        setx    0x8800641000, %l5, %l6
        add     %l6, 0x030, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync
        
        ! MMU TTE Cache Data
L26:     
        setx    0x8800648000, %l5, %l6
        ldx     [%l6], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync
        
        ! MMU DEV2IOTSB
L27:     
        setx    0x8800649000, %l5, %l6
        ldx     [%l6], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync
        
        ! MMU IOTSBDESC
L28:     
        setx    0x8800649000, %l5, %l6
        add     %l6, 0x100, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync
      
        ! ILU Error Log Enable
L29:
        set     0xf0, %i3
        setx    0x8800651000, %l5, %l6
        ldx     [%l6], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! ILU Error Status Clear
L30:
        setx    0x8800651000, %l5, %l6
        add     %l6, 0x018, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! ILU Error Status Set
L31:   
        setx    0x8800651000, %l5, %l6
        add     %l6, 0x020, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! DMU ILU Diagnostic
L32:     
        setx    0x3ffff0000, tmp1, tmp2
        setx    0x8800652000, %l5, %l6
        ldx     [%l6], %g3
        cmp     %g3, %l3
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
user_data_start:
.end

