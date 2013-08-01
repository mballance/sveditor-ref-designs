/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_regs_dram.s
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

	! DRAM REFRESH COUNTER
L1:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x0038, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap    
        membar #Sync

	! DRAM ERROR STATUS REG
L2:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x0280, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap    
        membar #Sync

	! DRAM ERROR ADDRESS   
L3:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x0288, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap    
        membar #Sync

	! DRAM ERROR INJECT REG
L4:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x0290, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap    
        membar #Sync

	! DRAM ERROR COUNTER REG
L5:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x0298, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap    
        membar #Sync

	! DRAM FBD ERROR SYNDROME
L6:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x0c00, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap    
        membar #Sync

	! DRAM ERROR LOCATION REG
L7:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x02A0, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap    
        membar #Sync

	! DRAM DEBUG TRIGGER    
L8:
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x0230, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap    
        membar #Sync

        ! DRAM CAS ADDRESS WIDTH
L9:
        set     0xb, %i3
        setx    0x8400000000, %l5, %l6
        ldx     [%l6], %g7
        cmp     %g7, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM RAS ADDRESS WIDTH
L10:
        set     0xf, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x8, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM CAS LATENCY
L11:
        set     0x3, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x10, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM CAS SCRUB FREQUENCY
L12:
        set     0xfff, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x18, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM REFRESH FREQUENCY
L13:
       set     0x820, %i3
       setx    0x8400000000, %l5, %l6
       add     %l6, 0x20, %g7
       ldx     [%g7], %g3
       cmp     %g3, %i3
       bne     bad_trap
       membar #Sync

        ! DRAM OPEN BANK
L14:   
        setx    0x1ffff, tmp1, tmp2
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x28, %g7
        ldx     [%g7], %g3
        cmp     %g3, %l3
        bne     bad_trap
        membar #Sync

        ! DRAM SCRUB ENABLE
L15:     
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x40, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync
        
        ! DRAM PROGRAMMABLE TIME
L16:   
        set     0xffff, %i3 
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x48, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync
        

        ! DRAM RAS TO RAS DIFFERENT BANK DELAY
L17:   
        set     0x2, %i3 
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x80, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! DRAM RAS TO RAS SAME BANK DELAY
L18:
        set     0xc, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x88, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync
        
        ! DRAM RAS TO CAS DELAY
L19:  
        set     0x3, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x90, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync
        
        ! DRAM WRITE TO READ CAS DELAY
L20:    
        setx    0x8400000000, %l5, %l6
        add     %l6, 0x98, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! DRAM READ TO WRITE CAS DELAY
L21:    
        setx    0x8400000000, %l5, %l6
        add     %l6, 0xa0, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

         ! DRAM INTERNAL READ TO PRECHARGE DELAY
L22:
        set     0x2, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0xa8, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync
        
        ! DRAM ACTIVE TO PRECHARGE DELAY
L23:  
        set     0x9, %i3
        setx    0x8400000000, %l5, %l6
        add     %l6, 0xb0, %g7
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

