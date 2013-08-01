/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_bank_en_status_wptect.s
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

! Read bank enable comb
    setx 0xffffff0010,%g7,%i2
    ldub [%i2],%g1

! End of diag check
    cmp  %g1,0x0
    be   program_bank_comb
    nop
    cmp  %g1,0xb
    be   test_pass
    nop
    ba   other_comb
    nop

program_bank_comb:
    set  0xb,%g2
    setx 0xffffff0020,%g7,%g3
    setx bank_comb,%g7,%g4
program_loop:
    ldub [%g4],%g5
    stb  %g5,[%g3]
    ldub [%g3],%g5
    add  %g3,1,%g3
    add  %g4,1,%g4
    subcc %g2,1,%g2
    bnz  program_loop
    nop

other_comb:
    setx 0xffffff0020,%g7,%i3
    add  %g1,%i3,%i3
    ldub [%i3],%g6

! Check that bank_enable_status is correct
    call calc_bank_en_st    !return in %g5
    nop
    setx 0x8000001028,%g7,%i1
    ldx  [%i1],%g2
    cmp  %g2,%g5
    bne  %xcc,test_fail
    nop

! Next bank combination
    add  %g1,1,%g1
    stb  %g1,[%i2]
    ldub [%i2],%g1
    add  %i3,1,%i3
    ldub [%i3],%g6

! Program bank_enable
    setx 0x8000001020,%g7,%i4
    stx  %g6,[%i4]

! Check bank_enable_status
    call calc_bank_en_st_prvw    !return in %g5
    nop
    ldx  [%i1],%g2
    cmp  %g2,%g5
    bne  %xcc,test_fail
    nop

! Warm reset to turn on next bank combination
    setx 0x8900000808,%g7,%i5
    set  0x1,%g1
    stx  %g1,[%i5]

halt:
    ba   halt
    nop

/******************************************************
 * Subroutine code
 *******************************************************/

calc_bank_en_st_prvw:
    add  %g5,%g0,%l7
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
    be   not_pm_1
    nop
    or   %l0,0x10,%l0

not_pm_1:
! Remove illegal combinations
    cmp  %l0,0x17
    be   val_13_1
    nop
    cmp  %l0,0x1b
    be   val_13_1
    nop
    cmp  %l0,0x1d
    be   val_1c_1
    nop
    cmp  %l0,0x1e
    be   val_1c_1
    nop

final_shift_1:
    sll  %l0,8,%l4
    or   %l0,%l4,%g5
    srlx %g5,5,%g5
    sllx %g5,5,%g5
    and  %l7,0xff,%l7
    or   %g5,%l7,%g5
    retl
    nop

val_13_1:
    set  0x13,%l0
    ba   final_shift_1
    nop

val_1c_1:
    set  0x1c,%l0
    ba   final_shift_1
    nop


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
    be   not_pm_2
    nop
    or   %l0,0x10,%l0

not_pm_2:
! Remove illegal combinations
    cmp  %l0,0x17
    be   val_13_2
    nop
    cmp  %l0,0x1b
    be   val_13_2
    nop
    cmp  %l0,0x1d
    be   val_1c_2
    nop
    cmp  %l0,0x1e
    be   val_1c_2
    nop

final_shift_2:
    sll  %l0,8,%l4
    or   %l0,%l4,%g5
    retl
    nop

val_13_2:
    set  0x13,%l0
    ba   final_shift_2
    nop

val_1c_2:
    set  0x1c,%l0
    ba   final_shift_2
    nop


/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

.data 
bank_enable_status_code:
    .word 0x00000f0f
bank_comb:
    .byte 0xff
    .byte 0x03
    .byte 0x0c
    .byte 0x30
    .byte 0xc0
    .byte 0x0f
    .byte 0x33
    .byte 0xc3
    .byte 0x3c
    .byte 0xcc
    .byte 0xf0
    .byte 0xff
.end
