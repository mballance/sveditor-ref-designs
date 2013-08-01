/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_park_unpark_multiple_times.s
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
    setx 0xffffffffffffffff,%g7,%g2
    set  11,%g3
loop:
    stxa %g0,[ASI_CMP_CORE_RUNNING_RW]%asi
    call sleep
    nop
    stxa %g2,[ASI_CMP_CORE_RUNNING_RW]%asi
    call sleep
    nop

    subcc %g3,1,%g3
    bnz  loop
    nop

    setx flag,%g7,%g4
    set  1,%g5
    stb  %g5,[%g4]

    ba   halt
    nop

t_63:
    setx flag,%g7,%l0
    ldub [%l0],%l1
    cmp  %l1,%g0
    bz   t_63
    nop

    setx 0x8000000000000001,%g7,%g1
    set  11,%g2

loop_1:
    stxa %g1,[ASI_CMP_CORE_RUNNING_RW]%asi
    call sleep
    nop
    stxa %g0,[ASI_CMP_CORE_RUNNING_RW]%asi
    call sleep
    nop

    subcc %g2,1,%g2
    bnz  loop_1
    nop

    ba   test_pass
    nop

/******************************************************
 * Subroutine code
 *******************************************************/

sleep:
    rd   %tick,%l2
    setx 0x02ff,%l0,%l1
    add  %l1,%l2,%l1
sleep_loop:
    rd   %tick,%l2
    cmp  %l1,%l2
    bpos sleep_loop
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
flag:
    .byte 0x00
.end
