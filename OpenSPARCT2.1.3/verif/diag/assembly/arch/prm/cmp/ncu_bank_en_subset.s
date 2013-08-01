/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_bank_en_subset.s
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

#ifndef BANK_AVAIL
#define BANK_AVAIL 0xff
#endif

.text
.global	 main


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID
    wr   %g0,ASI_CMP_CORE,%asi

    setx 0xffffff0000,%g7,%g3
    lduw [%g3],%g5
    cmp  %g5,%g0
    bnz  not_first_core
    nop

    setx BANK_AVAIL,%g7,%g6
    call calc_bank_en_st    !return in %g5
    nop
    stw  %g5,[%g3]
    lduw [%g3],%g5

not_first_core:
! Check that bank_enable_status is correct
    setx 0x8000001028,%g7,%g2
    ldx  [%g2],%g4
    cmp  %g4,%g5
    bne  %xcc,test_fail
    nop

all_th:
! Program bank_enable
    set  0xff,%g6
    setx 0x8000001020,%g7,%g2
    stx  %g6,[%g2]

! Turn on next available core
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
    set  0x1,%g1
    stx  %g1,[%g2]

halt:
    ba   halt
    nop

/******************************************************
 * Subroutine code
 *******************************************************/

calc_bank_en_st:
    and  %g6,0x1,%l0
    srl  %g6,1,%l6
    and  %l6,%l0,%l0

    srl  %l6,1,%l6
    and  %l6,0x1,%l1
    srl  %l6,1,%l6
    and  %l6,%l1,%l1

    srl  %l6,1,%l6
    and  %l6,0x1,%l2
    srl  %l6,1,%l6
    and  %l6,%l2,%l2

    srl  %l6,1,%l6
    and  %l6,0x1,%l3
    srl  %l6,1,%l6
    and  %l6,%l3,%l3

    sll  %l3,3,%l3
    sll  %l2,2,%l2
    sll  %l1,1,%l1
    or   %l0,%l1,%l0
    or   %l0,%l2,%l0
    or   %l0,%l3,%l0
    and  %l0,0xf,%l0
    cmp  %l0,0xf
    be   not_pm
    nop
    or   %l0,0x10,%l0

not_pm:
! Remove illegal combinations
    cmp  %l0,0x17
    be   val_13
    nop
    cmp  %l0,0x1b
    be   val_13
    nop
    cmp  %l0,0x1d
    be   val_1c
    nop
    cmp  %l0,0x1e
    be   val_1c
    nop

final_shift:
    sll  %l0,8,%l4
    or   %l0,%l4,%g5
    retl
    nop

val_13:
    set  0x13,%l0
    ba   final_shift
    nop

val_1c:
    set  0x1c,%l0
    ba   final_shift
    nop

    
/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD
