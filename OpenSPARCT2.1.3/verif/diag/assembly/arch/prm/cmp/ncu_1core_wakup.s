/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_1core_wakup.s
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

get_th_id_o0:
    ta   T_RD_THID

    cmp  %o1,0x0
    be   main_t0
    nop
    cmp  %o1,0x7
    ble  t_1_7
    nop
    bg   test_fail
    nop

main_t0:
!! Wait a while and see if any other threads woke up too
    call sleep
    nop

! Get access to common cntrs
    set  0x1,%g2
    setx cntr_access_flag,%g7,%g1
    set  0x0,%g3

spin_lock_0:
    cas  [%g1],%g2,%g3
    cmp  %g3,0x1
    bne  spin_lock_0
    nop

    setx thrd_sum, %g7,%g4
    ldx  [%g4],%g2
    cmp  %g2, 0x0
    bne  test_fail
    nop

    setx thrd_cnt, %g7,%g4
    ldx  [%g4],%g2
    cmp  %g2, 0x0
    bne  test_fail
    nop

! Release common cntrs
    stw  %g3,[%g1]

! Wake up threads, wait a while and check if the right threads woke up
    wr   %g0,ASI_CMP_CORE,%asi
    set	 0x2b,%g1
    stxa %g1,[ASI_CMP_CORE_RUNNING_RW]%asi

    call sleep
    nop

! Wait for all other threads to do their bit
    setx thrd_cnt, %g7,%g4
check_loop:
    ldx  [%g4],%g2
    cmp  %g2, 0x3
    bne  check_loop
    nop

! Wait for a bit in case other threads also wake up
    call sleep
    nop

    setx thrd_sum, %g7,%g4
    ldx  [%g4],%g2
    cmp  %g2, 0x9
    bne  test_fail
    nop

    ba   test_pass
    nop

t_1_7:
! Get access to common cntrs
    set  0x1,%g2
    setx cntr_access_flag,%g7,%g1
    set  0x0,%g3

spin_lock_1_7:
    cas  [%g1],%g2,%g3
    cmp  %g3,0x1
    bne  spin_lock_1_7
    nop

    setx thrd_sum,%g7,%g4
    ldx [%g4],%g2
    add  %g2,%o1,%g2
    stx  %g2,[%g4]

    setx thrd_cnt,%g7,%g4
    ldx [%g4],%g2
    add  %g2,0x1,%g2
    stx  %g2,[%g4]

! Release common cntrs
    stw  %g3,[%g1]

    ba   test_pass
    nop

sleep:
    rd   %tick,%l2
    setx 0x0000000000000fff,%g7,%l1
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
thrd_cnt:
	.xword 0x0000000000000000
thrd_sum:
	.xword 0x0000000000000000
other_core_thrd_cnt:
	.xword 0x0000000000000000
cntr_access_flag:
	.word 0x00000001
other_cores:
	.word 0x00000001
.end

