/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_efu_stat_wptect.s
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

#include "hboot.s"
#include "asi_s.h"

.text
.global	 main

#ifndef CORE_AVAIL
#define CORE_AVAIL 0xe5
#endif

main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID
    wr   %g0,ASI_CMP_CORE,%asi

    cmp  %o1,63
    be   test_pass
    nop

! Check EFU_STAT contents for correctness
! Should have core_avail, bank_avail, and serial_num

    setx 0x8000001008,%g7,%g1
    ldx  [%g1],%g2
    setx EFU_STAT_VALUE,%g7,%g3
    cmp  %g2,%g3
    bne  %xcc,test_fail
    nop

! Warm reset - turn on next available core
    setx CORE_AVAIL,%g7,%l1
    srlx %o1,0x3,%l0
    set  0x1,%l2
    sllx %l2,%l0,%l2

    setx 0x00000000000000ff,%g7,%g1
    sllx %g1,%o1,%g1

next_core_loop:
    add  %l0,1,%l0
    cmp  %l0,0x9
    be   test_pass
    nop
    sllx %l2,1,%l2
    sllx %g1,8,%g1
    andcc %l1,%l2,%g0
    bz   next_core_loop
    nop

    stxa %g1,[ASI_CMP_CORE_ENABLE]%asi
    setx 0x8900000808,%g7,%g2
    set  0x1,%g3
    stx  %g3,[%g2]

halt:
    ba   halt
    nop

/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

