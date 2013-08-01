/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_l2_idx_hash_en_wptect.s
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


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID

    wr   %g0,ASI_CMP_CORE,%asi
    setx 0x8000001030,%g7,%g1
    setx 0x8000001038,%g7,%g2
    setx 0xffffff0000,%g7,%g3

! What part of the test are we on?
    lduw [%g3],%g4
    cmp  %g4,0x1
    be   test_1
    nop

test_0:
    cmp  %g4,%g0
    bne  test_fail
    nop
! Set l2 idx hash enable
    set  0x1,%g4
    stx  %g4,[%g1]

    call sleep
    nop

! Check l2 idx hash enable status - should not change
    ldx  [%g2],%g4
    and  %g4,0x1,%g4
    cmp  %g4,%g0
    bne  test_fail
    nop

! Move to next section of test 
    set  0x1,%g4
    stw  %g4,[%g3]
    lduw [%g3],%g7

! Warm reset - same core
    setx 0x00000000000000ff,%g7,%g1
    sllx %g1,%o1,%g1
    stxa %g1,[ASI_CMP_CORE_ENABLE]%asi
    setx 0x8900000808,%g7,%g2
    set  0x1,%g1
    stx  %g1,[%g2]

    ba   halt
    nop

test_1:
! Check l2 idx hash enable - must be set
    ldx  [%g1],%g4
    and  %g4,0x1,%g4
    cmp  %g4,0x1
    bne  test_fail
    nop

! Check l2 idx hash enable status - must be set too
    ldx  [%g2],%g4
    and  %g4,0x1,%g4
    cmp  %g4,0x1
    bne  test_fail
    nop

! Move to next section of test 
    stw  %g0,[%g3]
    lduw [%g3],%g7

! Unset l2 idx hash enable
    stx  %g0,[%g1]

! Last core test
    cmp  %o1,56
    be   test_pass
    nop

! Warm reset - next core
    setx 0x000000000000ff00,%g7,%g1
    sllx %g1,%o1,%g1
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

sleep:
    rd   %tick,%l2
    setx 0x00000000000001ff,%g7,%l1
    add  %l1,%l2,%l1
sleep_loop:
    rd   %tick,%l2
    cmp  %l1,%l2
    bpos %xcc,sleep_loop
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
