/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_ras_regs.s
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

//    cmp  %o1,0x0
//    bne  test_pass
    nop

!Write then read data of ESR_REG 
    setx 0x0000008000003000,%g7,%g1
    setx esr_data,%g7,%g2
    set  0x05,%g3

loop1:
    ldx  [%g2],%g4
    stx  %g4,[%g1]
    ldx [%g1], %g5
 !   mulx %g4, 0x8000076dbfffffff,%g4
    cmp %g4, %g5
    bne %xcc, test_fail
    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop1
    nop


!Write then read data of ELE_REG 
    setx 0x0000008000003008,%g7,%g1
    setx reg_data,%g7,%g2
    set  0x05,%g3

loop2:
    ldx  [%g2],%g4
    stx  %g4,[%g1]
    ldx [%g1], %g5
   ! mulx %g4, 0x0000076dbfffffff,%g4
    cmp %g4, %g5
    bne %xcc, test_fail
    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop2
    nop

!Write then read data of EIE_REG 
    setx 0x0000008000003010,%g7,%g1
    setx reg_data,%g7,%g2
    set  0x05,%g3

loop3:
    ldx  [%g2],%g4
    stx  %g4,[%g1]
    ldx [%g1], %g5
    ! mulx %g4, 0x0000076dbfffffff,%g4
    cmp %g4, %g5
    bne %xcc, test_fail
    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop3
    nop

/*
!Write then read data of EJR_REG 
    setx 0x0000008000003018,%g7,%g1
    setx reg_data,%g7,%g2
    set  0x05,%g3

loop4:
    ldx  [%g2],%g4
    stx  %g4,[%g1]
    ldx [%g1], %g5
    ! mulx %g4, 0x0000076dbfffffff,%g4
    cmp %g4, %g5
    bne %xcc, test_fail
    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop4
    nop
*/

!Write then read data of FEE_REG 
    setx 0x0000008000003020,%g7,%g1
    setx reg_data,%g7,%g2
    set  0x05,%g3

loop5:
    ldx  [%g2],%g4
    stx  %g4,[%g1]
    ldx [%g1], %g5
    ! mulx %g4, 0x0000076dbfffffff,%g4
    cmp %g4, %g5
    bne %xcc, test_fail
    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop5
    nop

!Write then read data of SIISYN_REG 
    setx 0x0000008000003030,%g7,%g1
    setx reg_data,%g7,%g2
    set  0x05,%g3

loop6:
    ldx  [%g2],%g4
    stx  %g4,[%g1]
    ldx [%g1], %g5
    ! mulx %g4, 0x87000fffffffffff,%g4
    cmp %g4, %g5
    bne %xcc, test_fail
    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop6
    nop

!Write then read data of NCUSYN_REG 
    setx 0x0000008000003038,%g7,%g1
    setx reg_data,%g7,%g2
    set  0x05,%g3

loop7:
    ldx  [%g2],%g4
    stx  %g4,[%g1]
    ldx [%g1], %g5
    ! mulx %g4, 0x8cffffffffffffff,%g4
    cmp %g4, %g5
    bne %xcc, test_fail
    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop7
    nop

!Write then read data of NCUSYN_REG 
    setx 0x0000008000003030,%g7,%g1
    setx reg_data,%g7,%g2
    set  0x05,%g3

loop8:
    ldx  [%g2],%g4
    stx  %g4,[%g1]
    ldx [%g1], %g5
    ! mulx %g4, 0xc0f8000fffffffff,%g4
    cmp %g4, %g5
    bne %xcc, test_fail
    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop8
    nop




/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

.data
.align 0x100
esr_data:
    .xword 0x80000245023832d0
    .xword 0x80000228aaaaaaaa
    .xword 0x8000054515555555
    .xword 0x80000768b937cfea
    .xword 0x0000000000000000
    .xword 0x800006e836cd0984
    .xword 0x800005ecda993bad
    .xword 0x800004defecadbce
    .xword 0x800003b3fdce9723
    .xword 0x8000020432363bde
    .xword 0x800001793bdefacd
.align 0x100
reg_data:
    .xword 0x00000245023832d0
    .xword 0x00000228aaaaaaaa
    .xword 0x0000054515555555
    .xword 0x00000768b937cfea
    .xword 0x0000000000000000
    .xword 0xe2873fe836cd0984
    .xword 0xbf363fecda993bad
    .xword 0xbaceefdefecadbce
    .xword 0x987233b3fdce9723
    .xword 0x0003290432363bde
    .xword 0xabd934793bdefacd
.end

