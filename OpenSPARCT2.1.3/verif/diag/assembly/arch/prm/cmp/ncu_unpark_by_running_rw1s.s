/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_unpark_by_running_rw1s.s
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

    cmp  %o1,0x0
    be   t_0
    nop
    cmp  %o1,0x3f
    be   t_63
    nop

! Just halt all other threads
halt:
    ba   halt
    nop

t_0:

! Enable/disable other threads and check status to see if 
! these threads were correctly parked/unparked

    ldxa [ASI_CMP_CORE_RUNNING_STATUS]%asi, %g2
    set  0x1,%g1
    cmp  %g2,%g1
    bne  %xcc,test_fail
    nop

    setx asi_running_rw1s_mask,%l0,%g7
    set  0x20,%g5

loop:
    stxa %g0,[ASI_CMP_CORE_RUNNING_RW]%asi
    call sleep
    nop
    ldx  [%g7],%g1
    stxa %g1,[ASI_CMP_CORE_RUNNING_W1S]%asi
    call sleep
    nop
    or   %g1,0x1,%g1

    ldxa [ASI_CMP_CORE_RUNNING_RW]%asi, %g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop
    ldxa [ASI_CMP_CORE_RUNNING_STATUS]%asi, %g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop

    subcc %g5,1,%g5
    bnz  loop
    add  %g7,0x8,%g7

    ba   test_pass
    nop

t_63:
    setx 0x8000000000000001,%l0,%g1
    ldxa [ASI_CMP_CORE_RUNNING_RW]%asi, %g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop
    ldxa [ASI_CMP_CORE_RUNNING_STATUS]%asi, %g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop

    ba   test_pass
    nop

sleep:
    rd   %tick,%l2
    setx 0x04ff,%l0,%l1
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

.data
asi_running_rw1s_mask:
    .xword 0x6849543973ffacea
    .xword 0x5873423420976290
    .xword 0x4876cedec243baa0
    .xword 0x5fccafcafadeafcc
    .xword 0x2876234524000004
    .xword 0x123287634bcafed8
    .xword 0x04cad5362ddcec98
    .xword 0x00027373bced6940
    .xword 0x68cde0de5438b098
    .xword 0x2763245926423460
    .xword 0x698bcade2345326a
    .xword 0x676324c2de739290
    .xword 0x4acedceafdbffbec
    .xword 0x72823c3de3cfade2
    .xword 0x7ace420789988672
    .xword 0x1849543973ffacec
    .xword 0x087342342097629e
    .xword 0x6876cedec243baa0
    .xword 0x3fccafcafadeafcc
    .xword 0x3876234524000008
    .xword 0x0000000000000000
    .xword 0x5000000000000000
    .xword 0x0040000000000000
    .xword 0x0000200000000000
    .xword 0x0000001000000000
    .xword 0x0000000000000000
    .xword 0x00000000ff000000
    .xword 0x0000000000770000
    .xword 0x000000000000ff00
    .xword 0x0000000000000022
    .xword 0x7fffffffffffffff
    .xword 0x8000000000000000
.end
