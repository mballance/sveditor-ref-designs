/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_regs_wptect.s
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

#define CREGS_TICK_ENABLE 0

#include "hboot.s"
#include "asi_s.h"

.text
.global	 main

main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID

    wr   %g0,ASI_CMP_CORE,%asi

    setx 0xffffff0000,%g7,%g1
    lduw [%g1],%g2
    cmp  %g2,%g0
    bne  read_regs
    nop

! Set registers
    set  0x1,%g2
    stw  %g2,[%g1]
    lduw [%g1],%g2

    set  0x0,%g2
    stxa %g2,[0x38]%asi

    call sleep
    nop

    setx 0x8000003040,%g7,%g1
    set  0x3,%g2
    stx  %g2,[%g1]

! Warm reset
    stxa %g0,[ASI_CMP_CORE_ENABLE]%asi
    setx 0x8900000808,%g7,%g2
    set  0x1,%g1
    stx  %g1,[%g2]

halt:
    ba   halt
    nop

! Read registers
read_regs:
    ldxa [0x38]%asi,%g3
    cmp  %g3,%g0
    bne  %xcc,test_fail
    nop

    wr   %g0,0x45,%asi
    ldxa [0x18]%asi,%g3
    cmp  %g3,0x1
    bne  %xcc,test_fail
    nop

    setx 0x8000003040,%g7,%g1
    setx 0x3,%g7,%g2
    ldx  [%g1],%g3
    cmp  %g2,%g3
    bne  %xcc,test_fail
    nop

    setx 0x8000001030,%g7,%g1
    ldx  [%g1],%g3
    cmp  %g0,%g3
    bne  %xcc,test_fail
    nop

    setx 0x8000001038,%g7,%g1
    ldx  [%g1],%g3
    cmp  %g0,%g3
    bne  %xcc,test_fail
    nop

    ba   test_pass
    nop

/******************************************************
 * Subroutine code
 *******************************************************/

sleep:
    set 0x3f,%l0
sleep_loop:
    subcc %l0,1,%l0
    bg   sleep_loop
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
