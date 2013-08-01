/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_asi_cmp_tick_enable_3.s
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
    bne  other_threads
    nop

disable_tick:
! Disable and confirm that it is disabled
    stxa %g0,[0x38]%asi
    nop


    set 0x5,%l0
loop1:
    setx 0x0000008000000a00,%g7,%g6
    ldx  [%g6],%g4

    subcc %l0,1,%l0
    bg   loop1
    nop

rd_tick1:
    rd   %tick,%g1
    nop

    set 0x5,%l0
loop2:
    setx 0x0000008000000a00,%g7,%g6
    ldx  [%g6],%g4

    subcc %l0,1,%l0
    bg   loop2
    nop


rd_tick2:
    rd   %tick,%g2
check_tick1:
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop

! Now enable it
enable_tick:
    set  0x1,%g1
  stxa %g1,[0x38]%asi


Turn_on_all_th:
    setx 0xffffffffffffffff,%g7,%g6
    stxa %g6,[ASI_CMP_CORE_RUNNING_RW]%asi
    nop

    set 0x5,%l0
loop3:
    setx 0x0000008000000a00,%g7,%g6
    ldx  [%g6],%g4

    subcc %l0,1,%l0
    bg   loop3
    nop

other_threads:

rd_tick3:
    rd   %tick,%g1
    nop


    set 0x5,%l0
loop4:
    setx 0x0000008000000a00,%g7,%g6
    ldx  [%g6],%g4

    subcc %l0,1,%l0
    bg   loop4
    nop


rd_tick4:
    rd   %tick,%g2
check_tick2:
    cmp  %g1,%g2
    be  %xcc,test_fail
    nop



/******************************************************
 * Exit code
 *******************************************************/
test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

