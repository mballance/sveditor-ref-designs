/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_regs_peu.s
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



        ! PEU Control
L1:     
        set     0x101, %i3
        setx    0x8800680000, %l5, %l6
        ldx     [%l6], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync
        
        ! PEU Ingress Credits Initial
L2:     
        setx    0x10000200c0, tmp1, tmp2
        setx    0x8800680000, %l5, %l6
        add     %l6, 0x18, %g7
        ldx     [%g7], %g3 
        cmp     %g3, %l3
        bne     bad_trap
        membar #Sync

        ! PEU Other Event Log Enable
L3:
        set     0xffffff, %i3
        setx    0x8800681000, %l5, %l6
        ldx     [%l6], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! PEU Other Event Status Clear 
L4:
        setx    0x8800681000, %l5, %l6
        add     %l6, 0x018, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync


        ! PEU Other Event Status Set 
L5:
        setx    0x8800681000, %l5, %l6
        add     %l6, 0x020, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! PEU Uncorrectable Error Log Enable
L6:
        set     0x17f011, %i3
        setx    0x8800691000, %l5, %l6
        ldx     [%l6], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync


        ! PEU Uncorrectable Error Status Clear 
L7:
        setx    0x8800691000, %l5, %l6
        add     %l6, 0x018, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! PEU Uncorrectable Error Status Set
L8:
        setx    0x8800691000, %l5, %l6
        add     %l6, 0x020, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! PEU Receive Uncorrectable Error Header1 Log 
L9:
        setx    0x8800691000, %l5, %l6
        add     %l6, 0x028, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! PEU Receive Uncorrectable Error Header2 Log
L10:
        setx    0x8800691000, %l5, %l6
        add     %l6, 0x030, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! PEU Correctable Error Log Enable
L11:
        set     0x11c1, %i3
        setx    0x88006a1000, %l5, %l6
        ldx     [%l6], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! PEU Correctable Error Status Clear
L12:
        setx    0x88006a1000, %l5, %l6
        add     %l6, 0x018, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! PEU Correctable Error Status Set
L13:
        setx    0x88006a1000, %l5, %l6
        add     %l6, 0x020, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! PEU DLPL/SERDES Revision
L14:
        setx    0x88006e2000, %l5, %l6
        ldx     [%l6], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! PEU DLPL Event/Errog Log Enable
L15:
        set     0xf03ffff, %i3
        setx    0x88006e2000, %l5, %l6
        add     %l6, 0x108, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! PEU Serdes PLL Control/Status
L16:
        set     0x1, %i3
        setx    0x88006e2000, %l5, %l6
        add     %l6, 0x200, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! PEU Serdes Receiver Lane 0 - 7 Control
L17:
        set     0x552, %i3
        setx    0x88006e2000, %l5, %l6
        add     %l6, 0x338, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! PEU Serdes Transimitter Lane 0 - 7 Status
L18:
        set     0x1ec, %i3
        setx    0x88006e2000, %l5, %l6
        add     %l6, 0x438, %g7
        ldx     [%g7], %g3
        cmp     %g3, %i3
        bne     bad_trap
        membar #Sync

        ! PEU Serdes Macro 0 - 1 Test Configuration
L19:
        set     0x3, %i3
        setx    0x88006e2000, %l5, %l6
        add     %l6, 0x508, %g7
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
.xword 0x0
user_data_start:
.end


