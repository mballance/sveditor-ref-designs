/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_asi_core_en_subset.s
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

#ifndef CORE_AVAIL
#define CORE_AVAIL 0xff
#endif

.text
.global	 main


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID
    wr   %g0,ASI_CMP_CORE,%asi

! Check that core enable status equals core avail
    setx CORE_AVAIL,%g7,%g1

! Check that thread on same core is on
    or   %g1,%g0,%l0
    sub  %g0,1,%l1
loop:
    add  %l1,1,%l1
    andcc %l0,1,%l2
    bz   loop
    srlx %l0,1,%l0

    sllx %l1,3,%g2
    cmp  %g2,%o1
    bne  test_fail
    nop

    call compute_core_avail    ! return in %g1
    nop
    ldxa [ASI_CMP_CORE_ENABLED]%asi,%g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop

! End of diag
    setx 0xffffff0000,%g7,%g2
    ldub [%g2],%g3
    cmp  %g3,1
    be   test_pass
    nop

! Program core_enable
    setx 0xffffffffffffffff,%g7,%g6
    stxa %g6,[ASI_CMP_CORE_ENABLE]%asi

! Change test section
    set  0x1,%g1
    stb  %g1,[%g2]
    ldub [%g2],%g1

! Warm reset
    setx 0x8900000808,%g7,%g2
    stx  %g1,[%g2]

halt:
    ba   halt
    nop

/******************************************************
 * Subroutine code
 *******************************************************/

compute_core_avail:
    or   %g0,%g1,%l0
    or   %g0,%g0,%g1
    set  0x8,%l1
comp_loop:
    sllx %g1,8,%g1
    andcc %l0,0x80,%l2
    bz   skip
    nop
    or   %g1,0xff,%g1
skip:
    sllx %l0,1,%l0
    subcc %l1,1,%l1
    bnz  comp_loop
    nop
    retl
    nop

/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD
