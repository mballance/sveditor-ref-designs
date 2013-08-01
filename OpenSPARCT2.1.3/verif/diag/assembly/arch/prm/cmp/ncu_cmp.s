/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_cmp.s
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

    cmp  %o1,0x0
    be   core_0
    nop
    cmp  %o1,0x8
    be   core_1
    nop
    ba   core_others
    nop

core_0:
    setx 0x0000ff000000ff00,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_ENABLE]%asi
    setx 0x8900000808,%g7,%g1
    set  0x1,%g2
    stx  %g2,[%g1]

halt:
    ba   halt
    nop

core_1:
    setx 0xa9872bfcde25fff0,%g7,%g1
    stxa %g1,[ASI_CMP_XIR_STEERING]%asi

    stxa %g0,[ASI_CMP_TICK_ENABLE]%asi

    setx 0xf5720163feab01cc,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_RUNNING_RW]%asi

    setx 0xacfa01afadc20186,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_RUNNING_W1S]%asi

    setx 0x1001fe846926fe23,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_RUNNING_W1C]%asi

    setx 0xffffff0000,%g7,%g1
    set  0x1,%g2
    stx  %g2,[%g1]

    setx CORE_AVAIL,%g7,%g1
    call compute_core_avail    ! return in %g1
    nop
    ldxa [ASI_CMP_CORE_AVAIL]%asi,%g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop
    setx 0x0000ff000000ff00,%g7,%g1
    ldxa [ASI_CMP_CORE_ENABLE]%asi,%g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop
    ldxa [ASI_CMP_CORE_ENABLED]%asi,%g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop

    ba   test_pass
    nop

core_others:
    setx 0xffffff0000,%g7,%g1
    ldx  [%g1],%g2
    cmp  %g2,0x1
    bne  core_others
    nop

    setx 0x00002b000000ff00,%g7,%g1
    ldxa [ASI_CMP_XIR_STEERING]%asi,%g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop

    setx 0x0000010000000100,%g7,%g1
    ldxa [ASI_CMP_CORE_RUNNING_RW]%asi,%g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop
    ldxa [ASI_CMP_CORE_RUNNING_STATUS]%asi,%g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop

    ldxa [ASI_CMP_TICK_ENABLE]%asi,%g2
    cmp  %g2,%g0
    bne  %xcc,test_fail
    nop

    setx CORE_AVAIL,%g7,%g1
    call compute_core_avail    ! return in %g1
    nop
    ldxa [ASI_CMP_CORE_AVAIL]%asi,%g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop
    setx 0x0000ff000000ff00,%g7,%g1
    ldxa [ASI_CMP_CORE_ENABLE]%asi,%g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop
    ldxa [ASI_CMP_CORE_ENABLED]%asi,%g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop

    ba   test_pass
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

