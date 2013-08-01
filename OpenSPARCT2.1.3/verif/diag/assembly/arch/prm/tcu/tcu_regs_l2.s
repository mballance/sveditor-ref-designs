/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_regs_l2.s
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


	! ASI_PARTITION_ID   
L1:
        wr %g0, 0x58, %asi 
        ldxa [%g0 + ASI_PARTITION_ID_VAL] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_CMP_CORE_INTR_ID   
L2:
        wr %g0, 0x63, %asi 
        ldxa [%g0 ] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

	! ASI_CMP_CORE_ID    
L3:
        setx    0x7003f0000, tmp1, tmp2
        wr %g0, 0x63, %asi 
        ldxa [%g0 + ASI_CMP_CORE_ID] %asi, %g7
        cmp     tmp2, %g7  
        bne     bad_trap
        membar #Sync

	! ASI_INTR_RECEIVE   
L4:
        wr %g0, 0x72, %asi 
        ldxa [%g0 ] %asi, %g7
        cmp     %g7 , %g0 
        bne     bad_trap
        membar #Sync

        ! L2_ERROR_EN_REG
L5:
        setx    0xAA00000000, %l5, %l6
        ldx     [%l6], %g7
        cmp     %g7, %g0
        bne     bad_trap
        membar #Sync

        ! L2_ERROR_STATUS_REG
L6:
        setx    0xAB00000000, %l5, %l6
        ldx     [%l6], %g7
        cmp     %g7, %g0
        bne     bad_trap
        membar #Sync

        ! L2_ERROR_ADDRESS_REG
L7:
        setx    0xAC00000000, %l5, %l6
        ldx     [%l6], %g7
        cmp     %g7, %g0
        bne     bad_trap
        membar #Sync

        ! L2_NOTDATA_ERROR_REG
L8:
        setx    0xAE00000000, %l5, %l6
        ldx     [%l6], %g7
        cmp     %g7, %g0
        bne     bad_trap
        membar #Sync

        ! L2_ERROR_INJECT_REG
L9:
        setx    0xAD00000000, %l5, %l6
        ldx     [%l6], %g7
        cmp     %g7, %g0
        bne     bad_trap
        membar #Sync


        ! L2_MASK_REG
L10:
        setx    0xAF00000000, %l5, %l6
        ldx     [%l6], %g7
        cmp     %g7, %g0
        bne     bad_trap
        membar #Sync

        ! L2_COMP_REG
L11:
        setx    0xBF00000000, %l5, %l6
        ldx     [%l6], %g7
        cmp     %g7, %g0
        bne     bad_trap
        membar #Sync

        ! L2_BANK_AVAILABLE
L12:
        setx    0xff, tmp1, tmp2
        setx    0x8000000000, %l5, %l6
        setx    0x1018, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %l3
        bne     bad_trap
        membar #Sync


        ! L2_BANK_ENABLE
L13:
        setx    0xff, tmp1, tmp2
        setx    0x8000000000, %l5, %l6
        setx    0x1020, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %l3
        bne     bad_trap
        membar #Sync

        ! L2_BANK_ENABLE_STATUS
L14:
        setx    0xf0f, tmp1, tmp2
        setx    0x8000000000, %l5, %l6
        setx    0x1028, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %l3
        bne     bad_trap
        membar #Sync
        
        ! L2_INDEX_HASH_ENABLE
L15:     
        setx    0x8000000000, %l5, %l6
        setx    0x1030, %l5, %g7
        add     %l6, %g7, %g7
        ldx     [%g7], %g3
        cmp     %g3, %g0
        bne     bad_trap
        membar #Sync

        ! L2_CONTROL_REG
L16:
        set     0x1, %i3
        setx    0xA900000000, %l5, %l6
        ldx     [%l6], %g7
        cmp     %g7, %i3
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

