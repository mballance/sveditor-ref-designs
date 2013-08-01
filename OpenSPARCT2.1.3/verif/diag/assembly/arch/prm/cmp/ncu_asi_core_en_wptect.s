/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_asi_core_en_wptect.s
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

! Check that core_avail and asi_core_enable are correct
    setx CORE_AVAIL,%g7,%g2
    call compute_core_avail    ! return in %g2
    nop
    setx 0x8000001010,%g7,%g3
    ldx  [%g3],%g4
    cmp  %g2,%g4
    bne  %xcc,test_fail
    nop

    setx 0xffffff0000,%g7,%g1
    setx test_comb,%g7,%g3
    ldub [%g1],%g6
    cmp  %g6,0x8
    be   end_diag
    nop
    cmp  %g6,0x9
    be   test_pass
    nop
    cmp  %g6,0x0
    be   %xcc,program
    nop

    sllx %g6,3,%g6
    add  %g3,%g6,%g3
    srlx %g6,3,%g6
    ldx  [%g3],%g4
    andcc %g4,%g2,%g4
    call compute_core_en    ! return in %g4
    nop
    bz   program
    nop
    ldxa [ASI_CMP_CORE_ENABLED]%asi,%g5
    cmp  %g4,%g5
    bne  %xcc,test_fail
    nop

program:
! Program asi_core_enable
    add  %g6,1,%g6
    stb  %g6,[%g1]
    ldub [%g1],%g7
    add  %g3,8,%g3
    ldx  [%g3],%g4
    and  %g4,%g2,%g4
    stxa %g4,[ASI_CMP_CORE_ENABLE]%asi

warm_reset:
    setx 0x8900000808,%g7,%g2
    set  0x1,%g1
    stx  %g1,[%g2]

halt:
    ba   halt
    nop

end_diag:
    setx 0xffffff0000,%g7,%g1
    ldub [%g1],%g3
    add  %g3,1,%g3
    stb  %g3,[%g1]
    ldub [%g1],%g3

    stxa %g4,[ASI_CMP_CORE_ENABLE]%asi
    ba   warm_reset
    nop

/******************************************************
 * Subroutine code
 *******************************************************/

compute_core_avail:
    or   %g0,%g2,%l0
    or   %g0,%g0,%g2
    set  0x8,%l1
comp_loop:
    sllx %g2,8,%g2
    andcc %l0,0x80,%l2
    bz   skip
    nop
    or   %g2,0xff,%g2
skip:
    sllx %l0,1,%l0
    subcc %l1,1,%l1
    bnz  comp_loop
    nop
    retl
    nop

compute_core_en:
    set  0x8,%l1
    setx 0xffffffffffffff00,%g7,%l7
    setx 0x00000000000000ff,%g7,%l6
comp_en_loop:
    and  %g4,%l6,%l2
    cmp  %l2,%l6
    be   %xcc,skip_en
    nop
    and  %g4,%l7,%g4
skip_en:
    sllx %l7,8,%l7
    or   %l7,0xff,%l7
    sllx %l6,8,%l6
    subcc %l1,1,%l1
    bnz  comp_en_loop
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

.data 
.align 0x10
test_comb:
    .xword 0xfffeffffca2345ff
    .xword 0x8976923023ccff99
    .xword 0xffffffffffffffff
    .xword 0x4232300109124058
    .xword 0xfedcedaefecdebbb
    .xword 0xbcffade538ffecfe
    .xword 0xfffff903034ecdff
    .xword 0x010018fff09824ff
    .xword 0x01becaffffffff00
    .xword 0xceff35ffbcff09ff
    .xword 0xff89ffbcff5affc2
    .xword 0xff10923479ffff91
    .xword 0x3cffffc255374ff3
    .xword 0x223f3ffecffff779
    .xword 0xfcfffecedffeffff
    .xword 0x6768ffff989fff29
    .xword 0xbcbf09ff0292ffff
.end
