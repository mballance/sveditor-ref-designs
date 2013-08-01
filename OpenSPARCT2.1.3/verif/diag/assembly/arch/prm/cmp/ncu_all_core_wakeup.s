/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_all_core_wakeup.s
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
    wr   %g0,ASI_CMP_CORE,%asi

    cmp  %o1,0x0
    be   main_t0
    nop
    cmp  %o1,56
    bge  t_last_core
    nop
    ba   t_others
    nop

main_t0:
    
    setx 0xffffff0000,%g7,%g1
    lduw [%g1],%g2
    cmp  %g2,0x2
    be   test_2
    nop
    cmp  %g2,0x1
    be   test_1
    nop
    
test_0:
!! Read the core available register
    ldxa [ASI_CMP_CORE_AVAIL]%asi, %g1
    xnor %g0,%g0,%g6
    cmp  %g1,%g6
    bne  %xcc,test_fail
    nop

!! Enable/Disable other cores
    setx 0x53ff017fff00ffff,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_ENABLE]%asi
    ldxa [ASI_CMP_CORE_ENABLE]%asi, %g2
    setx 0x00ff0000ff00ffff,%g7,%g3
    cmp  %g2,%g3
    bne  %xcc,test_fail
    nop

    setx 0x23ecffffff234400,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_ENABLE]%asi
    ldxa [ASI_CMP_CORE_ENABLE]%asi, %g2
    setx 0x0000ffffff000000,%g7,%g3
    cmp  %g2,%g3
    bne  %xcc,test_fail
    nop

    setx 0x0102040810204080,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_ENABLE]%asi
    ldxa [ASI_CMP_CORE_ENABLE]%asi, %g2
    setx 0x00000000000000ff,%g7,%g3
    cmp  %g2,%g3
    bne  %xcc,test_fail
    nop

    setx 0x0102040810204080,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_ENABLE]%asi
    ldxa [ASI_CMP_CORE_ENABLE]%asi, %g2
    cmp  %g2,%g3
    bne  %xcc,test_fail
    nop

! Next test section
    setx 0xffffff0000,%g7,%g1
    set  0x1,%g3
    stw  %g3,[%g1]
    lduw [%g1],%g3

! Warm reset
    setx 0x8900000808,%g7,%g2
    stx  %g3,[%g2]

! Wait for warm reset
halt:
    ba   halt
    nop

test_1:
    ldxa [ASI_CMP_CORE_ENABLED]%asi, %g1
    setx 0x00000000000000ff,%g7,%g6
    cmp  %g1,%g6
    bne  %xcc,test_fail
    nop

! Enable threads in all other cores
    setx 0xffffffffffffff00,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_RUNNING_RW]%asi

! Should not start the other core until a warm reset
! Wait a while and see if any thread woke up

    call sleep
    nop
    call sleep
    nop

    setx 0xffffff0100, %g7,%g4
    lduw [%g4],%g2
    cmp  %g2,%g0
    bne  test_fail
    nop

! Enable some of the other cores
    setx 0x19ff4071ffccffff,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_ENABLE]%asi

! Next test section
    setx 0xffffff0000,%g7,%g1
    set  0x2,%g3
    stw  %g3,[%g1]
    lduw [%g1],%g3

! Warm reset
    setx 0x8900000808,%g7,%g2
    set  0x1,%g3
    stx  %g3,[%g2]

! Wait for warm reset
    ba   halt
    nop

test_2:
    ldxa [ASI_CMP_CORE_ENABLED]%asi, %g1
    setx 0x00ff0000ff00ffff,%g7,%g6
    cmp  %g1,%g6
    bne  %xcc,test_fail
    nop

! Set flag in memory before waking up other threads
    setx other_cores,%g7,%g1
    set  0x1,%g2
    stw  %g2,[%g1]

! Enable thread 0 in all other cores
    setx 0xff01ffff01ff0101,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_RUNNING_RW]%asi

! Just wait for a while first
    call sleep
    nop

    setx 0xffffff0100,%g7,%g4
wait_loop:
    lduw [%g4],%g2
    cmp  %g2, 0x50
    bne  wait_loop
    nop

! Wait a little longer to see if someone else also woke up
    call sleep
    nop

    lduw [%g4],%g2
    cmp  %g2, 0x50
    bne  test_fail
    nop

!! Disable yourself
    setx 0xff00000000000000,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_ENABLE]%asi
    setx 0x8900000808,%g7,%g2
    set  0x01,%g3
    stx  %g3,[%g2]

    ba   halt
    nop

t_last_core:
    wr   %g0,ASI_CMP_CORE,%asi
    ldxa [ASI_CMP_CORE_ENABLED]%asi, %g1
    setx 0xff00000000000000,%g7,%g6
    cmp  %g1,%g6
    bne  %xcc,test_fail
    nop

! End of test
    ba   test_pass
    nop

t_others:
! Get access to common cntrs
    set  0x1,%g2
    setx other_cores,%g7,%g1
    set  0x0,%g3

spin_lock_ot:
    cas  [%g1],%g2,%g3
    cmp  %g3,0x1
    bne  spin_lock_ot
    nop

    setx 0xffffff0100,%g7,%g4
    lduw [%g4],%g2
    add  %g2,%o1,%g2
    stw  %g2,[%g4]
    lduw [%g4],%g2

! Release common cntrs
    stw  %g3,[%g1]
    ba   test_pass
    nop

/******************************************************
 * Subroutine code
 *******************************************************/

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
other_core_thrd_cnt:
	.word 0x00000000
other_cores:
	.word 0x00000001
.end

