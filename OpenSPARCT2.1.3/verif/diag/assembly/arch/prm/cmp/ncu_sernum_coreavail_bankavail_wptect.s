/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_sernum_coreavail_bankavail_wptect.s
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

#ifndef BANK_AVAIL
#define BANK_AVAIL 0xff
#endif

#ifndef CORE_AVAIL
#define CORE_AVAIL 0xff
#endif

#ifndef SERIAL_NUM
#define SERIAL_NUM 0x0
#endif

.text
.global	 main


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID

    cmp  %o1,63
    be   test_pass
    nop
    and  %o1,0x7,%g7
    cmp  %g7,0x0
    bne  test_fail
    nop

    wr   %g0,ASI_CMP_CORE,%asi

! Check serial_num, core_avail and bank_avail:
    setx 0x8000001000,%g7,%g2
    ldx  [%g2],%g3
    setx SERIAL_NUM,%g7,%g4
    cmp  %g3,%g4
    bne  %xcc,test_fail
    nop

    setx 0x8000001010,%g7,%g2
    ldx  [%g2],%g3
    setx CORE_AVAIL,%g7,%g4
    call compute_core_avail    ! return in %g4
    nop
    cmp  %g3,%g4
    bne  %xcc,test_fail
    nop

    setx 0x8000001018,%g7,%g2
    ldx  [%g2],%g3
    setx BANK_AVAIL,%g7,%g4
    cmp  %g3,%g4
    bne  %xcc,test_fail
    nop

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
    set  0x1,%g3
    stx  %g3,[%g2]

halt:
    ba   halt
    nop

/******************************************************
 * Subroutine code
 *******************************************************/

compute_core_avail:
    or   %g0,%g4,%l0
    or   %g0,%g0,%g4
    set  0x8,%l1
comp_loop:
    sllx %g4,8,%g4
    andcc %l0,0x80,%l2
    bz   skip
    nop
    or   %g4,0xff,%g4
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

